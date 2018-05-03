#!/system/bin/sh

name="Settings"

mount -o rw,remount /system

mkdir /system/app/$name/
chmod 755 /system/app/$name/

cp /data/local/tmp/settings-5.1.apk /system/app/$name/$name.apk

chown 0.0 /system/app/$name/$name.apk
chmod 644 /system/app/$name/$name.apk
