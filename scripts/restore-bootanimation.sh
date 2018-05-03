#!/system/bin/sh

mount -o rw,remount /system

rm /system/media/bootanimation.zip
cp /data/local/tmp/bootanimation.zip /system/media/bootanimation.zip
chmod 0644 /system/media/bootanimation.zip


