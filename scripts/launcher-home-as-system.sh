#!/system/bin/sh

mount -o rw,remount /system

mkdir /system/app/Launcher/
chmod 0755 /system/app/Launcher/

cp /data/local/tmp/Launcher.apk /system/app/Launcher/Launcher.apk

chown 0.0 /system/app/Launcher/Launcher.apk
chmod 0644 /system/app/Launcher/Launcher.apk

