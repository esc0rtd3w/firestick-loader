#!/system/bin/sh

name="$1"

case "$name" in

"")
	echo "No Package Name! Exiting..."
	exit
;;

*)
	echo "Removing $name..."
	
	mount -o rw,remount /data

	rm -rf /data/app/$name/
	rm -rf /data/data/$name/
;;

esac
