#!/bin/sh


# Check For Root

# Part of The FireStick Loader

# esc0rtd3w 2017



checkRootStatus(){
	
	if [ -f /system/xbin/su ];
	then
		echo "1">/sdcard/rootAccess.txt
	else
		echo "0">/sdcard/rootAccess.txt
	fi
	
}
	
checkRootStatus

