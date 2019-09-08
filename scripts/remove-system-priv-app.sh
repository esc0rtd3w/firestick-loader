#!/system/bin/sh

name="$1"

case "$name" in

"")
	echo "No Package Name! Exiting..."
	exit
;;

*)
	echo "Removing $name..."
	
	mount -o rw,remount /system

	rm -rf /system/priv-app/$name/
	#rm -rf /data/data/$name/
;;

esac
