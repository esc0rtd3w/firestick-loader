#!/system/bin/sh

mount -o rw,remount /system

mkdir /system/app/Terminal/
chmod 0755 /system/app/Terminal/

cp /data/local/tmp/terminal.apk /system/app/Terminal/Terminal.apk

chown 0.0 /system/app/Terminal/Terminal.apk
chmod 0644 /system/app/Terminal/Terminal.apk

am start -a android.intent.action.MAIN -n jackpal.androidterm/.Term
