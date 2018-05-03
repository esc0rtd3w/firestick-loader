#!/system/bin/sh

mount -o rw,remount /system

rm /system/priv-app/com.amazon.bueller.photos/com.amazon.bueller.photos.apk

cp /data/local/tmp/com.amazon.bueller.photos.apk /system/priv-app/com.amazon.bueller.photos/com.amazon.bueller.photos.apk

chown 0.0 /system/priv-app/com.amazon.bueller.photos/com.amazon.bueller.photos.apk
chmod 0644 /system/priv-app/com.amazon.bueller.photos/com.amazon.bueller.photos.apk

