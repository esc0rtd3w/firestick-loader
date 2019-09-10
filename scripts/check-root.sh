#!/bin/sh


# Check For Root

# Part of The FireStick Loader

# esc0rtd3w 2017



checkRootStatus(){
	
	chk_bin="0"
	chk_sbin="0"
	chk_xbin="0"
	echo "0">/sdcard/rootAccess.txt
	
	if [ -f /system/bin/su ];
	then
		chk_bin="1"
	else
		chk_bin="0"
	fi
	
	case "$chk_bin" in
	
		"0")
			if [ -f /system/xbin/su ];
			then
				chk_xbin="1"
			else
				chk_xbin="0"
			fi
		;;
	
		"1")
			echo "1">/sdcard/rootAccess.txt
			break;
		;;
	
	esac
	
	case "$chk_xbin" in
	
		"0")
		if [ -f /sbin/su ];
		then
			chk_sbin="1"
			echo "1">/sdcard/rootAccess.txt
		else
			chk_sbin="0"
			echo "0">/sdcard/rootAccess.txt
		fi
		;;
	
		"1")
			echo "1">/sdcard/rootAccess.txt
			break;
		;;
	
	esac
	
}
	
checkRootStatus

