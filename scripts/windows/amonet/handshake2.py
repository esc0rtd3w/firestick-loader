#!/usr/bin/env python3
import sys

from common import Device
from logger import log


def handshake2(dev, cmd='FACTFACT'):
    log("Handshake")
    dev.handshake2(cmd)

if __name__ == "__main__":
    if len(sys.argv) > 2:
        dev = Device(sys.argv[2])
    else:
        dev = Device()
        dev.find_device(True)

    if len(sys.argv) > 1:
        cmd = sys.argv[1]
    else:
        cmd = 'FACTFACT'
    handshake2(dev,cmd)
