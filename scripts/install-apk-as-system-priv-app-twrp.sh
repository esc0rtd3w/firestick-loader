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

	rm -rf /system/priv-app/$name/
	mkdir /system/priv-app/$name/
	chmod 0755 /system/priv-app/$name/

	cp /data/local/tmp/temp.apk /system/priv-app/$name/$name.apk

	chown root:root /system/priv-app/$name/$name.apk
	chmod 0644 /system/priv-app/$name/$name.apk
;;

esac
