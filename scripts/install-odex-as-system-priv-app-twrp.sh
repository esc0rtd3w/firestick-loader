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

	rm -rf /system/priv-app/$name/arm/
	mkdir /system/priv-app/$name/arm/
	chmod 0755 /system/priv-app/$name/arm/

	cp /data/local/tmp/temp.odex /system/priv-app/$name/arm/$name.odex

	chown root:root /system/priv-app/$name/arm/$name.odex
	chmod 0644 /system/priv-app/$name/arm/$name.odex
;;

esac
