#!/system/bin/sh

name="$1"

case "$name" in

"")
	echo "No Package Name! Exiting..."
	exit
;;

*)
	echo "Installing $name ODEX..."
	
	mount -o rw /system

	rm -rf /system/app/$name/arm/
	mkdir /system/app/$name/arm/
	chmod 0755 /system/app/$name/arm/

	cp /data/local/tmp/temp.odex /system/app/$name/arm/$name.odex

	chown root:root /system/app/$name/arm/$name.odex
	chmod 0644 /system/app/$name/arm/$name.odex
;;

esac
