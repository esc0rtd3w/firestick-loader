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
cp /system/restore/apk/root-explorer.apk /data/local/tmp/
pm install /data/local/tmp/root-explorer.apk
cp /system/restore/apk/busybox.apk /data/local/tmp/
pm install /data/local/tmp/busybox.apk
cp /system/restore/apk/mouse-toggle.apk /data/local/tmp/
pm install /data/local/tmp/mouse-toggle.apk
#cp /system/restore/apk/reboot.apk /data/local/tmp/
#pm install /data/local/tmp/reboot.apk

# Fix SD Card Permissions
chown -R media_rw:media_rw /data/media/
find /data/media/ -type d -exec chmod 775 {} ';'
find /data/media/ -type f -exec chmod 664 {} ';'

restorecon -FR /data/media/

mount -o remount,ro /system

