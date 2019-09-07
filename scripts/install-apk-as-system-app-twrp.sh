#!/system/bin/sh

name="$1"

case "$name" in

"")
	echo "No Package Name! Exiting..."
	exit
;;

*)
	echo "Installing $name..."
	
	mount -o rw /system

	rm -rf /system/app/$name/
	mkdir /system/app/$name/
	chmod 0755 /system/app/$name/

	cp /data/local/tmp/temp.apk /system/app/$name/$name.apk

	chown root:root /system/app/$name/$name.apk
	chmod 0644 /system/app/$name/$name.apk
;;

esac
