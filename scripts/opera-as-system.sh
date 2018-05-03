#!/system/bin/sh

mount -o rw,remount /system

mkdir /system/app/OperaMini/
chmod 0755 /system/app/OperaMini/

cp /data/local/tmp/opera.apk /system/app/OperaMini/OperaMini.apk

#chown 0.0 /system/priv-app/OperaMini/OperaMini.apk
chmod 0644 /system/app/OperaMini/OperaMini.apk

#am start -a de.belu.firestopper/.gui.MainActivity -n 
