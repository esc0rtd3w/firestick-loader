#!/bin/sh


# Part of The FireStick Loader

# esc0rtd3w 2016


adb="$PWD/bin/adb.linux"

pull="$PWD/bin/adb.linux" pull
push="$PWD/bin/adb.linux" push
shell="$PWD/bin/adb.linux" shell

sdcard="sdcard"
#sdcard="external_sd"
#sdcard="extSdCard"


clear
echo "Looking For Amazon Running Processes...."
echo ""
echo ""

$shell ps -A ^| grep amazon

echo ""
echo ""

read pause

