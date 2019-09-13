#!/system/bin/sh


	
if [ -d /data/ ];
then
	empty=0
else
	mkdir /data/
	chmod -R 0771 /data/
	chown -R system:system /data/
fi
	
if [ -d /data/data/ ];
then
	empty=0
else
	mkdir /data/data/
	chmod -R 0771 /data/data/
	chown -R system:system /data/data/
fi

# Copy All Home User Data For Default Setup
#cp -r /system/restore/ca.dstudio.atvlauncher.pro/ /data/data/
#cp -r /system/restore/com.adamioan.scriptrunner/ /data/data/
#cp -r /system/restore/com.fluxii.android.mousetoggleforfiretv/ /data/data/
#chmod -R 0755 /data/data/ca.dstudio.atvlauncher.pro/
#chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db
#chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-shm
#chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-wal
#chmod -R 0755 /data/data/com.adamioan.scriptrunner/
#chmod -R 0755 /data/data/com.fluxii.android.mousetoggleforfiretv/

# TitaniumBackup FTW ;)
if [ -d /sdcard/TitaniumBackup/ ];
then
	empty=0
else
	mkdir /sdcard/TitaniumBackup
fi

cp -r /system/restore/TitaniumBackup/ /sdcard/


# Cleanup Extra Crap
rm -r /system/res/images/*.*
rm -r /system/res/sound/*.*


