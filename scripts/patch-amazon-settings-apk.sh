#!/system/bin/sh

mount -o rw,remount /system

rm /system/priv-app/com.amazon.tv.settings/com.amazon.tv.settings.apk

cp /data/local/tmp/com.amazon.tv.settings.apk /system/priv-app/com.amazon.tv.settings/com.amazon.tv.settings.apk

chown 0.0 /system/priv-app/com.amazon.tv.settings/com.amazon.tv.settings.apk
chmod 0644 /system/priv-app/com.amazon.tv.settings/com.amazon.tv.settings.apk

