#!/system/bin/sh

mount -o rw,remount /system

mkdir /system/app/FireStopper/
chmod 0755 /system/app/FireStopper/

cp /data/local/tmp/firestopper.apk /system/app/FireStopper/FireStopper.apk

#chown 0.0 /system/app/FireStopper/FireStopper.apk
chmod 0644 /system/app/FireStopper/FireStopper.apk

am start -a de.belu.firestopper/.gui.MainActivity -n de.belu.firestopper/.gui.MainActivity
