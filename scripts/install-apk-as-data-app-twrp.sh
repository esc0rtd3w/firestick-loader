#!/system/bin/sh

name="$1"

case "$name" in

"")
	echo "No Package Name! Exiting..."
	exit
;;

*)
	echo "Installing $name..."
	
	mount -o rw /data

	rm -rf /data/app/$name/
	mkdir /data/app/$name/
	chmod 0755 /data/app/$name/

	cp /data/local/tmp/temp.apk /data/app/$name/$name.apk

	chown root:root /data/app/$name/$name.apk
	chmod 0644 /data/app/$name/$name.apk
;;

esac
