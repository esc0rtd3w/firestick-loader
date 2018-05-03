#!/bin/sh


# Screen Capture Script for Amazon Firestick

# Part of The FireStick Loader

# esc0rtd3w 2016


adb="$PWD/bin/adb.linux"

sdcard="sdcard"
#sdcard="external_sd"
#sdcard="extSdCard"

capDevice="/$sdcard/cap.png"

tempHost="/tmp/"
capHost="/tmp/cap.png"


$adb shell screencap $capDevice

sleep 1

$adb pull $capDevice $tempHost

$capHost
