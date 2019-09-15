#!/system/bin/sh

mount -o remount,rw /system

# TitaniumBackup FTW ;)
if [ -d /sdcard/TitaniumBackup/ ];
then
	empty=0
else
	mkdir /sdcard/TitaniumBackup
fi

cp -r /system/restore/TitaniumBackup/ /sdcard/


# Install Packages
cp /system/restore/apk/autostarts.apk /data/local/tmp/
pm install /data/local/tmp/autostarts.apk
cp /system/restore/apk/busybox.apk /data/local/tmp/
pm install /data/local/tmp/busybox.apk
cp /system/restore/apk/mouse-toggle.apk /data/local/tmp/
pm install /data/local/tmp/mouse-toggle.apk
cp /system/restore/apk/reboot.apk /data/local/tmp/
pm install /data/local/tmp/reboot.apk

mount -o remount,ro /system

