@echo off

color 0e


set adb="..\..\bin\adb.exe"
set adbKill="%~dp0bin\adb.exe" kill-server
set adbStart="%~dp0bin\adb.exe" start-server
set adbWait=%adb% wait-for-device

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell
set twrp=%shell% twrp

set accessibility="..\settings\tank\system\scripts\accessibility.sh"
set applications="..\settings\tank\system\scripts\applications.sh"
set device="..\settings\tank\system\scripts\device.sh"
set displaysounds="..\settings\tank\system\scripts\display-sounds.sh"
set help="..\settings\tank\system\scripts\help.sh"
set myaccount="..\settings\tank\system\scripts\my-account.sh"
set network="..\settings\tank\system\scripts\network.sh"
set notifications="..\settings\tank\system\scripts\notifications.sh"
set preferences="..\settings\tank\system\scripts\preferences.sh"

:: Set ADB Enabled
::%shell% settings --user 0 put global adb_enabled 1

:: Mount System as RW
%shell% "mount -o rw /system"

:: Wipe Data and Cache
%twrp% wipe data

:: Make new /data/data/ directory
%shell% "mkdir /data/"
%shell% "mkdir /data/data/"
%shell% "mkdir /data/local/"
%shell% "mkdir /data/local/tmp/"
%shell% "chmod -R 0777 /data/"
%shell% "chown -R system:system /data/"

:: Push Settings Scripts to Temp
%push% %accessibility% /data/local/tmp/
%push% %applications% /data/local/tmp/
%push% %device% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %notifications% /data/local/tmp/
%push% %preferences% /data/local/tmp/

:: Push Restore Home Script to Temp
%push% "..\restore-home.sh" /data/local/tmp/

:: Make and Set Permissions for Settings Scripts Directories
%shell% "mkdir /system/scripts/"
%shell% "chmod 0777 /system/scripts/"

:: Copy Settings Scripts From Temp to System
%shell% "cp /data/local/tmp/accessibility.sh /system/scripts/accessibility.sh"
%shell% "cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "cp /data/local/tmp/device.sh /system/scripts/device.sh"
%shell% "cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "cp /data/local/tmp/notifications.sh /system/scripts/notifications.sh"
%shell% "cp /data/local/tmp/preferences.sh /system/scripts/preferences.sh"

:: Copy Restore Home Script From Temp to System
%shell% "cp /data/local/tmp/restore-home.sh /system/scripts/restore-home.sh"

:: Set Permissions
%shell% "chmod 0777 /system/scripts/*.sh"
%shell% "chown root:root /system/scripts/*.sh"

:: Push App Data to sdcard
%shell% "rm -r /sdcard/restore/"
%shell% "mkdir /sdcard/restore/"
%push% "..\..\data\tank\post-debloated\restore" /sdcard/restore/

:: Copy Data from sdcard to system
%shell% "mkdir /system/restore/"
%shell% "chmod 0777 /system/restore/"
%shell% "cp -r /sdcard/restore/ca.dstudio.atvlauncher.pro/ /system/restore/"
%shell% "cp -r /sdcard/restore/com.adamioan.scriptrunner/ /system/restore/"
%shell% "cp -r /sdcard/restore/com.fluxii.android.mousetoggleforfiretv/ /system/restore/"
%shell% "mkdir /system/restore/apk/"
%shell% "chmod 0777 /system/restore/apk/"

:: Copy App Data back to /data/data/
%shell% "cp -r /system/restore/ca.dstudio.atvlauncher.pro/ /data/data/"
%shell% "cp -r /system/restore/com.adamioan.scriptrunner/ /data/data/"
%shell% "cp -r /system/restore/com.fluxii.android.mousetoggleforfiretv/ /data/data/"
%shell% "chmod -R 0777 /data/data/ca.dstudio.atvlauncher.pro/"
%shell% "chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db"
%shell% "chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-shm"
%shell% "chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-wal"
%shell% "chmod -R 0777 /data/data/com.adamioan.scriptrunner/"
%shell% "chmod -R 0777 /data/data/com.fluxii.android.mousetoggleforfiretv/"


echo.
echo Success if not output or error!
echo.
pause



:end



