#!/bin/sh


# Part of The FireStick Loader

# esc0rtd3w 2018


adb="$PWD/bin/adb.linux"

pull="$PWD/bin/adb.linux" pull
push="$PWD/bin/adb.linux" push
shell="$PWD/bin/adb.linux" shell

temp="/tmp"

sdcard="sdcard"
#sdcard="external_sd"
#sdcard="extSdCard"

cacheDir="cache"
updateFile="update-kindle-montoya-54.6.0.6_user_606753620.bin"

clear
echo "Copying $updateFile To $sdcard..."
echo ""
echo ""

sleep 2


su -c cp /$cacheDir/$updateFile /$sdcard/$updateFile



