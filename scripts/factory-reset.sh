#!/system/bin/sh

#clear
echo "Factory Resetting...."
echo ""
echo ""


su -c mount -o rw,remount /cache
su -c mount -o rw,remount /data
su -c mount -o rw,remount /system


#rm -rf /system/firepwn/

mkdir /system/firepwn/
chown 0.0 /system/firepwn/
chmod 777 /system/firepwn/

mkdir /system/firepwn/data/
chmod -R 777 /system/firepwn/data/
mkdir /system/firepwn/data/app/
chmod -R 777 /system/firepwn/data/app/
mkdir /system/firepwn/data/data/
chmod -R 777 /system/firepwn/data/data/
mkdir /system/firepwn/data/misc/
chmod -R 777 /system/firepwn/data/misc/
mkdir /system/firepwn/data/misc/wifi/
chmod -R 777 /system/firepwn/data/misc/wifi/
mkdir /system/firepwn/data/system/
chmod -R 777 /system/firepwn/data/system/
mkdir /system/firepwn/data/system/users/
chmod -R 777 /system/firepwn/data/system/users/
mkdir /system/firepwn/data/system/users/0/
chmod -R 777 /system/firepwn/data/system/users/0/
mkdir /system/firepwn/data/user/
chmod -R 777 /system/firepwn/data/user/
mkdir /system/firepwn/data/user/0/
chmod -R 777 /system/firepwn/data/user/0/
mkdir /system/firepwn/system/
chmod -R 777 /system/firepwn/system/
mkdir /system/firepwn/system/app/
chmod -R 777 /system/firepwn/system/app/
mkdir /system/firepwn/system/priv-app/
chmod -R 777 /system/firepwn/system/priv-app/

# Recursive Permissions
chown -R 0.0 /system/firepwn/
chmod -R 777 /system/firepwn/


# Preserve ADB Settings (XML should be pushed with menu before launching this script)
mkdir /system/firepwn/data/data/com.amazon.tv.settings/
mkdir /system/firepwn/data/data/com.amazon.tv.settings/shared_prefs/
#cp -Rp /data/data/com.amazon.tv.settings/shared_prefs/ /system/firepwn/data/data/com.amazon.tv.settings/
cp /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml /system/firepwn/data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml
#rm /system/firepwn/data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml
#cp /data/local/tmp/com.amazon.tv.settings_preferences.xml /system/firepwn/data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml
chmod 777 /system/firepwn/data/data/com.amazon.tv.settings/com.amazon.tv.settings_preferences.xml


mkdir /system/firepwn/data/user/0/com.amazon.tv.settings/
mkdir /system/firepwn/data/user/0/com.amazon.tv.settings/shared_prefs/
cp /data/user/0/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml /system/firepwn/data/user/0/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml

# Preserve KingRoot APK
cp /data/local/tmp/kingroot.apk /system/firepwn/kingroot.apk
chmod 777 /system/firepwn/kingroot.apk

# Preserve KingRoot Settings
mkdir /system/firepwn/data/data/com.kingroot.kinguser/
mkdir /system/firepwn/data/data/com.kingroot.kinguser/shared_prefs/
chmod 777 /system/firepwn/data/data/com.kingroot.kinguser/
chmod 777 /system/firepwn/data/data/com.kingroot.kinguser/shared_prefs/
cp -RP /data/data/com.kingroot.kinguser/shared_prefs/ /system/firepwn/data/data/com.kingroot.kinguser/

# Preserve Wifi Settings
mkdir /system/firepwn/data/misc/wifi/
#cp -Rp /data/misc/wifi/wpa_supplicant.conf /system/firepwn/data/misc/wifi/wpa_supplicant.conf
cp -P /data/misc/wifi/wpa_supplicant.conf /system/firepwn/data/misc/wifi/wpa_supplicant.conf
#chmod 777 /system/firepwn/data/misc/wifi/wpa_supplicant.conf

# Preserving Package Restrictions
mkdir /system/firepwn/data/system/users/0/
cp -P /data/system/users/0/package-restrictions.xml /system/firepwn/data/system/users/0/package-restrictions.xml
#chmod 777 /system/firepwn/data/system/users/0/package-restrictions.xml

#read


#<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
#<map>
#    <string name="countryOfResidence">US</string>
#    <boolean name="whisperplay_settings_key" value="false" />
#    <boolean name="enable_unknown_sources_key" value="true" />
#    <boolean name="enable_adb_key" value="true" />
#    <boolean name="notifications_settings_key" value="false" />
#    <boolean name="report_usage" value="false" />
#    <string name="preferredMarketplace">ATVPDKIKX0DER</string>
#</map>

# Removing /data/
#rm -R -- /data/*/

rm -f /data/.layout_version
#rm -rf /data/adb/
rm -rf /data/anr/
rm -rf /data/app/
rm -rf /data/app-asec/
rm -rf /data/app-lib/
rm -rf /data/app-private/
rm -f /data/bugreports
#rm -rf /data/dalvik-cache/
#rm -rf /data/data/
rm -rf /data/data-lib/
rm -rf /data/debug_service/
rm -rf /data/diag/
rm -rf /data/dontpanic/
rm -rf /data/drm/
rm -rf /data/DxDrm/
rm -rf /data/hwval/
rm -rf /data/key_provisioning/
rm -rf /data/mediadrm/
#rm -rf /data/misc/
rm -rf /data/playready/
rm -rf /data/proffline/
rm -rf /data/property/
rm -rf /data/radio/
rm -rf /data/resource-cache/
rm -rf /data/securedStorageLocation/
rm -rf /data/securestop/
rm -rf /data/security/
rm -rf /data/sfs/
#rm -rf /data/system/
#rm -rf /data/user/
rm -rf /data/vitals/
rm -rf /data/webcrypto/
#rm -rf /data/

# Clean /data/data/

#removeList=ls /data/data/ | grep -v "com.kingroot.kinguser"

#rm -rf /data/data/*.*

#while read line;do

	#item=$(echo "$line")
	#rm -rf /data/data/*.*

#done < $removeList


# Restore Kingroot Settings and Request SU again and remount RW
cp -RP /system/firepwn/data/data/com.kingroot.kinguser/ /data/data/com.kingroot.kinguser/
su -c mount -o rw,remount /system


# Clean User 0
rm -rf /data/user/0/*.*

#rm -f /data/system/users/0/*.*
#rm -f /data/system/users/0/accounts.db
#rm -f /data/system/users/0/accounts.db-journal
#rm -f /data/system/users/0/appwidgets.xml
#rm -f /data/system/users/0/package-restrictions.xml

# Rebuilding empty /data/
#mkdir /data/
#mkdir /data/app/
#mkdir /data/app/mcRegistry
#mkdir /data/app/mcRegistry/TbStorage
#mkdir /data/app/
#mkdir /data/data/
#mkdir /data/system/
#mkdir /data/local/
#mkdir /data/local/tmp/

#chown system:system /data/data/
#chmod 771 /data/data/
#chmod 777 /data/data/

# Restoring ADB Settings
mkdir /data/data/com.amazon.tv.settings
mkdir /data/data/com.amazon.tv.settings/shared_prefs

chown system:system /data/data/com.amazon.tv.settings/
#chmod 751 /data/data/com.amazon.tv.settings/
chmod 777 /data/data/com.amazon.tv.settings/

chown system:system /data/data/com.amazon.tv.settings/shared_prefs
#chmod 771 /data/data/com.amazon.tv.settings/shared_prefs
chmod 777 /data/data/com.amazon.tv.settings/shared_prefs

#cp -Rp /system/firepwn/data/data/com.amazon.tv.settings/ /data/data/com.amazon.tv.settings/
cp -P /system/firepwn/data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml


mkdir /data/user/0/com.amazon.tv.settings
mkdir /data/user/0/com.amazon.tv.settings/shared_prefs
chown system:system /data/user/0/com.amazon.tv.settings/
chmod 777 /data/user/0/com.amazon.tv.settings/
chown system:system /data/user/0/com.amazon.tv.settings/shared_prefs
chmod 777 /data/user/0/com.amazon.tv.settings/shared_prefs
cp -P /system/firepwn/data/user/0/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml /data/user/0/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml


#chown system:system /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml
#chmod 660 /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml
#chmod 777 /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml


# Restoring KingRoot Settings
#mkdir /data/data/com.kingroot.kinguser/
#mkdir /data/data/com.kingroot.kinguser/shared_prefs/
cp -RP /system/firepwn/data/data/com.kingroot.kinguser/ /data/data/com.kingroot.kinguser/


# Restoring WiFi Settings
#mkdir /data/misc/
#mkdir /data/misc/wifi/

#chown system:misc /data/misc/
#chmod 771 /data/misc/
#chmod 777 /data/misc/

#chown wifi:wifi /data/misc/wifi/
#drwxrwx--t system   misc              1970-01-01 16:00 misc
#chmod 771 /data/misc/wifi/
#chmod 777 /data/misc/wifi/

cp -P /system/firepwn/data/misc/wifi/wpa_supplicant.conf /data/misc/wifi/wpa_supplicant.conf
#chown wifi:wifi /data/misc/wifi/wpa_supplicant.conf
#chmod 660 /data/misc/wifi/wpa_supplicant.conf
#chmod 777 /data/misc/wifi/wpa_supplicant.conf


# Remove System After Restore Data Stuff
#rm -rf /data/system/
rm -f /data/system/SYSTEM_LAST_KMSG
rm -f /data/system/appops.xml
rm -f /data/system/batterystats.bin
rm -f /data/system/batterystats.bin_ext
rm -f /data/system/called_pre_boots.dat
rm -f /data/system/chronos_db
rm -rf /data/system/compatibility
rm -f /data/system/device_policies.xml
#rm -rf /data/system/dropbox
rm -f /data/system/entropy.dat
rm -f /data/system/framework_atlas.config
rm -rf /data/system/ifw
rm -rf /data/system/inputmethod
rm -rf /data/system/install_sessions
rm -rf /data/system/job
rm -f /data/system/last-fstrim
rm -f /data/system/locksettings.db
rm -f /data/system/locksettings.db-shm
rm -f /data/system/locksettings.db-wal
rm -f /data/system/ndebugsocket
rm -rf /data/system/netstats
rm -f /data/system/package-usage.list
rm -f /data/system/packages.list
rm -f /data/system/packages.xml
rm -rf /data/system/procstats
rm -rf /data/system/recent_images
rm -rf /data/system/recent_tasks
rm -rf /data/system/seapp_hash
rm -rf /data/system/shared_prefs
rm -rf /data/system/sync
rm -f /data/system/tmp_init.rc
rm -f /data/system/uiderrors.txt
rm -rf /data/system/usagestats
#rm -rf /data/system/users


#mkdir /data/system/
#chmod 777 /data/system/


# Restoring Package Restrictions
mkdir /system/firepwn/data/system/users/
mkdir /system/firepwn/data/system/users/0/
chmod 777 /system/firepwn/data/system/users/
chmod 777 /system/firepwn/data/system/users/0/
cp /system/firepwn/data/system/users/0/package-restrictions.xml /data/system/users/0/package-restrictions.xml
chown system:system /data/system/users/0/package-restrictions.xml
#chmod 660 /data/system/users/0/package-restrictions.xml
chmod 777 /data/system/users/0/package-restrictions.xml





# Clearing Dalvik Cache
#rm -rf /data/dalvik-cache
#rm -rf /cache/dalvik-cache

# Clearing Cache
#rm -R -- /cache/*/
#rm -rf /cache/
#mkdir /cache/
rm -f /cache/*.*
rm -rf /cache/dalvik-cache

# Reinstall KingRoot APK
#pm install /data/local/tmp/kingroot.apk

#reboot

echo "done!"
read

