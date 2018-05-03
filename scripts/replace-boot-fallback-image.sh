#!/system/bin/sh

mount -o rw,remount /system

rm /system/framework/framework-res.apk

cp /data/local/tmp/framework-res.apk /system/framework/framework-res.apk

chmod 0644 /system/framework/framework-res.apk


