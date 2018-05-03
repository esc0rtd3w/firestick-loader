#!/system/bin/sh

name="$1"

mount -o rw,remount /system

mkdir /system/app/$name/
chmod 0755 /system/app/$name/

cp /data/local/tmp/temp.apk /system/app/$name/$name.apk

#chown 0.0 /system/app/$name/$name.apk
chmod 0644 /system/app/$name/$name.apk
