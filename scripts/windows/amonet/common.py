import struct
import sys
import glob
import time

import serial

from logger import log

BAUD = 115200
TIMEOUT = 5


CRYPTO_BASE = 0x11010000


def serial_ports ():
    """ Lists available serial ports

        :raises EnvironmentError:
            On unsupported or unknown platforms
        :returns:
            A set containing the serial ports available on the system
    """

    if sys.platform.startswith("win"):
        ports = [ "COM{0:d}".format(i + 1) for i in range(256) ]
    elif sys.platform.startswith("linux"):
        ports = glob.glob("/dev/ttyACM*")
    elif sys.platform.startswith("darwin"):
        ports = glob.glob("/dev/cu.usbmodem*")
    else:
        raise EnvironmentError("Unsupported platform")

    result = set()
    for port in ports:
        try:
            s = serial.Serial(port, timeout=TIMEOUT)
            s.close()
            result.add(port)
        except (OSError, serial.SerialException):
            pass

    return result


def p32_be(x):
    return struct.pack(">I", x)


class Device:

    def __init__(self, port=None):
        self.dev = None
        if port:
            self.dev = serial.Serial(port, BAUD, timeout=TIMEOUT)

    def find_device(self,preloader=False):
        if self.dev:
            raise RuntimeError("Device already found")

        if preloader:
            log("Waiting for preloader")
        else:
            log("Waiting for bootrom")

        old = serial_ports()
        while True:
            new = serial_ports()

            # port added
            if new > old:
                port = (new - old).pop()
                break
            # port removed
            elif old > new:
                old = new

            time.sleep(0.25)

        log("Found port = {}".format(port))

        self.dev = serial.Serial(port, BAUD, timeout=TIMEOUT)

    def check(self, test, gold):
        if test != gold:
            raise RuntimeError("ERROR: Serial protocol mismatch")

    def check_int(self, test, gold):
        test = struct.unpack('>I', test)[0]
        self.check(test, gold)

    def _writeb(self, out_str):
        self.dev.write(out_str)
        return self.dev.read()

    def handshake(self):
        # look for start byte
        while True:
            c = self._writeb(b'\xa0')
            if c == b'\x5f':
                break
            self.dev.flushInput()

        # complete sequence
        self.check(self._writeb(b'\x0a'), b'\xf5')
        self.check(self._writeb(b'\x50'), b'\xaf')
        self.check(self._writeb(b'\x05'), b'\xfa')

    def handshake2(self, cmd='FACTFACT'):
        # look for start byte
        c = 0
        while c != b'Y':
            c = self.dev.read()
        log("Preloader ready, sending " + cmd)
        command = str.encode(cmd)
        self.dev.write(command)
        self.dev.flushInput()

    def read32(self, addr, size=1):
        result = []

        self.dev.write(b'\xd1')
        self.check(self.dev.read(1), b'\xd1') # echo cmd

        self.dev.write(struct.pack('>I', addr))
        self.check_int(self.dev.read(4), addr) # echo addr

        self.dev.write(struct.pack('>I', size))
        self.check_int(self.dev.read(4), size) # echo size

        self.check(self.dev.read(2), b'\x00\x00') # arg check

        for _ in range(size):
            data = struct.unpack('>I', self.dev.read(4))[0]
            result.append(data)

        self.check(self.dev.read(2), b'\x00\x00') # status

        # support scalar
        if len(result) == 1:
            return result[0]
        else:
            return result

    def write32(self, addr, words, status_check=True):
        # support scalar
        if not isinstance(words, list):
            words = [ words ]

        self.dev.write(b'\xd4')
        self.check(self.dev.read(1), b'\xd4') # echo cmd

        self.dev.write(struct.pack('>I', addr))
        self.check_int(self.dev.read(4), addr) # echo addr

        self.dev.write(struct.pack('>I', len(words)))
        self.check_int(self.dev.read(4), len(words)) # echo size

        self.check(self.dev.read(2), b'\x00\x01') # arg check

        for word in words:
            self.dev.write(struct.pack('>I', word))
            self.check_int(self.dev.read(4), word) # echo word

        if status_check:
            self.check(self.dev.read(2), b'\x00\x01') # status

    def run_ext_cmd(self, cmd):
        self.dev.write(b'\xC8')
        self.check(self.dev.read(1), b'\xC8') # echo cmd
        cmd = bytes([cmd])
        self.dev.write(cmd)
        self.check(self.dev.read(1), cmd)
        self.dev.read(1)
        self.dev.read(2)

    def wait_payload(self):
        data = self.dev.read(4)
        if data != b"\xB1\xB2\xB3\xB4":
            raise RuntimeError("received {} instead of expected pattern".format(data))

    def emmc_read(self, idx):
        # magic
        self.dev.write(p32_be(0xf00dd00d))
        # cmd
        self.dev.write(p32_be(0x1000))
        # block to read
        self.dev.write(p32_be(idx))

        data = self.dev.read(0x200)
        if len(data) != 0x200:
            raise RuntimeError("read fail")

        return data

    def emmc_write(self, idx, data):
        if len(data) != 0x200:
            raise RuntimeError("data must be 0x200 bytes")

        # magic
        self.dev.write(p32_be(0xf00dd00d))
        # cmd
        self.dev.write(p32_be(0x1001))
        # block to write
        self.dev.write(p32_be(idx))
        # data
        self.dev.write(data)

        code = self.dev.read(4)
        if code != b"\xd0\xd0\xd0\xd0":
            raise RuntimeError("device failure")

    def emmc_switch(self, part):
        # magic
        self.dev.write(p32_be(0xf00dd00d))
        # cmd
        self.dev.write(p32_be(0x1002))
        # partition
        self.dev.write(p32_be(part))

    def reboot(self):
        # magic
        self.dev.write(p32_be(0xf00dd00d))
        # cmd
        self.dev.write(p32_be(0x3000))        

    def rpmb_read(self):
        # magic
        self.dev.write(p32_be(0xf00dd00d))
        # cmd
        self.dev.write(p32_be(0x2000))

        data = self.dev.read(0x100)
        if len(data) != 0x100:
            raise RuntimeError("read fail")

        return data

    def rpmb_write(self, data):
        if len(data) != 0x100:
            raise RuntimeError("data must be 0x100 bytes")

        # magic
        self.dev.write(p32_be(0xf00dd00d))
        # cmd
        self.dev.write(p32_be(0x2001))
        # data
        self.dev.write(data)
