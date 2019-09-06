#!/system/bin/sh

name="$1"

case "$name" in

"")
	echo "No Package Name! Exiting..."
	exit
;;

*)
	echo "Deleting $name..."
	
	mount -o rw,remount /system

	rm -rf /system/priv-app/$name/
;;

esac
