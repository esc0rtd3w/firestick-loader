#!/system/bin/sh

mount -o rw,remount /system

# Remove Old FireStopper From System If Exists
rm -rf /system/app/FireStopper/

mkdir /system/app/FirePwnHome/
chmod 0755 /system/app/FirePwnHome/

cp /data/local/tmp/FirePwnHome.apk /system/app/FirePwnHome/FirePwnHome.apk

chown 0.0 /system/app/FirePwnHome/FirePwnHome.apk
chmod 0644 /system/app/FirePwnHome/FirePwnHome.apk

#am start -a com.firepwn.home.montoya/.gui.MainActivity -n com.firepwn.home.montoya/.gui.MainActivity
