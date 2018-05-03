#!/bin/sh


# Part of The FireStick Loader

# esc0rtd3w 2016


adb="$PWD/bin/adb.linux"

sdcard="sdcard"
#sdcard="external_sd"
#sdcard="extSdCard"


clear
echo "This will erase ALL Kodi/XBMC Data on $sdcard!!!...."
echo ""
echo ""
echo ""
echo "TYPE "ACCEPT" WITHOUT QUOTES TO CONTINUE...."
echo ""
echo ""

read safetyFirst

case "$safetyFirst" in

	"")
	doNothing
	;;

	"ACCEPT" | "accept" | "Accept")
	cleanThatShit
	;;

	*)
	doNothing
	;;
esac


doNothing() {

	clear
	echo "Nothing Happened...."
	echo ""
	echo ""

	sleep 3

}


cleanThatShit() {

	clear
	echo "Cleaning /$sdcard/Android/data/org.xbmc.kodi/ Directory...."
	echo ""
	echo ""

	sleep 2

	$adb shell rm -rf /$sdcard/Android/data/org.xbmc.kodi/*

}


