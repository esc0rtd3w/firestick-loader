#!/system/bin/sh

name="$1"

mount -o rw,remount /system

mkdir /system/priv-app/$name/
chmod 0755 /system/priv-app/$name/

cp /data/local/tmp/temp.apk /system/priv-app/$name/$name.apk

#chown 0.0 /system/priv-app/$name/$name.apk
chmod 0644 /system/priv-app/$name/$name.apk
