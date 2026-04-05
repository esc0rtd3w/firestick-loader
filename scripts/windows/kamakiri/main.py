#!/usr/bin/env python3

import sys
import time

from common import Device
from logger import log
from load_payload import load_payload, load_pl_payload
from functions import *

import usb.core
import usb.util

import ctypes

import traceback


import struct
import os

def main(dev):

    if dev.preloader:
        load_pl_payload(dev)
    else:
        load_payload(dev)

    device_type_id = dev.idme_read(b"device_type_id").rstrip(b"\x00").decode("utf-8")

    log("Check device_type_id")
    if device_type_id == "AKPGW064GI9HE":
        log("Detected mantis (" + device_type_id + ")")
    else:
        log("Wrong device detected: " + device_type_id)
        exit(1)

    if len(sys.argv) == 2 and sys.argv[1] == "fixgpt":
        dev.emmc_switch(0)
        log("Flashing GPT")
        flash_binary(dev, "../bin/gpt-mantis.bin", 0, 34 * 0x200)

    # 1) Sanity check GPT
    log("Check GPT")
    switch_user(dev)

    # 1.1) Parse gpt
    gpt = parse_gpt(dev)
    log("gpt_parsed = {}".format(gpt))
    if "lk" not in gpt or "tee1" not in gpt or "boot" not in gpt or "recovery" not in gpt:
        raise RuntimeError("bad gpt")

    # 2) Sanity check boot0
    log("Check boot0")
    switch_boot0(dev)

    # 3) Sanity check rpmb
    log("Check rpmb")
    rpmb = dev.rpmb_read()
    if rpmb[0:4] != b"AMZN":
        thread = UserInputThread(msg = "rpmb looks broken; if this is expected (i.e. you're retrying the exploit) press enter, otherwise terminate with Ctrl+C")
        thread.start()
        while not thread.done:
            dev.kick_watchdog()
            time.sleep(1)

    # 5) Zero out rpmb to enable downgrade
    log("Downgrade rpmb")
    dev.rpmb_write(b"\x00" * 0x100)
    log("Recheck rpmb")
    rpmb = dev.rpmb_read()
    if rpmb != b"\x00" * 0x100:
        dev.reboot()
        raise RuntimeError("downgrade failure, giving up")
    log("rpmb downgrade ok")
    dev.kick_watchdog()

    # 6) Downgrade tz
    log("Flash tz")
    switch_user(dev)
    flash_binary(dev, "../bin/tz.img", gpt["tee1"][0], gpt["tee1"][1] * 0x200)

    # 7) Downgrade lk
    log("Flash lk")
    switch_user(dev)
    flash_binary(dev, "../bin/lk.bin", gpt["lk"][0], gpt["lk"][1] * 0x200)

    # 6) Install lk-payload
    log("Flash lk-payload")
    switch_boot0(dev)
    flash_binary(dev, "../lk-payload/build/payload.bin", 1024)

    # 8) Flash microloader
    log("Inject microloader")
    switch_user(dev)
    boot_hdr1 = dev.emmc_read(gpt["boot"][0]) + dev.emmc_read(gpt["boot"][0] + 1)
    boot_hdr2 = dev.emmc_read(gpt["boot"][0] + 2) + dev.emmc_read(gpt["boot"][0] + 3)
    flash_binary(dev, "../bin/microloader.bin", gpt["boot"][0], 2 * 0x200)
    if boot_hdr2[0:8] != b"ANDROID!":
        flash_data(dev, boot_hdr1, gpt["boot"][0] + 2, 2 * 0x200)

    log("Force fastboot")
    force_fastboot(dev, gpt)

    if not dev.preloader:
        # 9) Install preloader
        log("Flash preloader")
        switch_boot0(dev)
        flash_binary(dev, "../bin/preloader.img", 0)

    # 9.1) Wait some time so data is flushed to EMMC
    time.sleep(5)

    # Reboot (to fastboot or recovery)
    log("Reboot")
    dev.reboot()


if __name__ == "__main__":

    check_modemmanager()

    dev = Device()
    dev.find_device()

    if (len(sys.argv) == 2 and sys.argv[1] == "crash") or (len(sys.argv) == 3 and sys.argv[2] == "crash"):
        while dev.preloader:
            log("Found device in preloader mode, trying to crash...")
            dev.handshake()
            dev.crash_pl()
            dev.dev.close()
            dev = Device()
            dev.find_device()

    main(dev)
