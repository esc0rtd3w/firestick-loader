@echo off

color 0e


set adb="..\..\bin\adb.exe"
set adbKill="%~dp0bin\adb.exe" kill-server
set adbStart="%~dp0bin\adb.exe" start-server
set adbWait=%adb% wait-for-device
set sleep="..\..\bin\wait.exe"

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
%shell% settings --user 0 put global adb_enabled 1

:: Mount System as RW
%shell% "mount -o rw /system"

%sleep% 3

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
%shell% "su -c mkdir /system/scripts/"
%shell% "su -c chmod 0777 /system/scripts/"

:: Copy Settings Scripts From Temp to System
%shell% "su -c cp /data/local/tmp/accessibility.sh /system/scripts/accessibility.sh"
%shell% "su -c cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "su -c cp /data/local/tmp/device.sh /system/scripts/device.sh"
%shell% "su -c cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "su -c cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "su -c cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "su -c cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "su -c cp /data/local/tmp/notifications.sh /system/scripts/notifications.sh"
%shell% "su -c cp /data/local/tmp/preferences.sh /system/scripts/preferences.sh"

:: Copy Restore Home Script From Temp to System
%shell% "su -c cp /data/local/tmp/restore-home.sh /system/scripts/restore-home.sh"

:: Set Permissions
%shell% "su -c chmod 0777 /system/scripts/*.sh"
%shell% "su -c chown root:root /system/scripts/*.sh"

:: Push App Data to sdcard
%shell% "su -c rm -r /sdcard/restore/"
%shell% "su -c mkdir /sdcard/restore/"
%shell% "su -c mkdir /sdcard/TitaniumBackup/"
%push% "..\..\data\tank\post-debloated\restore" /sdcard/restore/

:: Copy Data from sdcard to system
%shell% "su -c rm -r /system/restore/"
%shell% "su -c mkdir /system/restore/"
%shell% "su -c chmod 0777 /system/restore/"
%shell% "su -c cp -r /sdcard/restore/ca.dstudio.atvlauncher.pro/ /system/restore/"
%shell% "su -c cp -r /sdcard/restore/com.adamioan.scriptrunner/ /system/restore/"
%shell% "su -c cp -r /sdcard/restore/com.fluxii.android.mousetoggleforfiretv/ /system/restore/"
%shell% "su -c cp -r /sdcard/restore/TitaniumBackup/ /system/restore/"
%shell% "su -c mkdir /system/restore/apk/"
%shell% "su -c chmod 0777 /system/restore/apk/"

:: Copy App Data back to /data/data/
%shell% "su -c cp -r /system/restore/ca.dstudio.atvlauncher.pro/ /data/data/"
%shell% "su -c cp -r /system/restore/com.adamioan.scriptrunner/ /data/data/"
%shell% "su -c cp -r /system/restore/com.fluxii.android.mousetoggleforfiretv/ /data/data/"
%shell% "su -c chmod -R 0777 /data/data/ca.dstudio.atvlauncher.pro/"
%shell% "su -c chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db"
%shell% "su -c chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-shm"
%shell% "su -c chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-wal"
%shell% "su -c chmod -R 0777 /data/data/com.adamioan.scriptrunner/"
%shell% "su -c chmod -R 0777 /data/data/com.fluxii.android.mousetoggleforfiretv/"

:: Install BusyBox
%push% "..\..\bin\android\busybox" /data/local/tmp/
%shell% "su -c chmod 0777 /data/local/tmp/busybox"
%shell% "/data/local/tmp/busybox --install"

echo.
echo Prepared For Reboot!
echo.
echo Once rebooted, restore data with TitaniumBackup!
echo.
echo.
echo Press any key to reboot...
echo.
pause>nul

%adb% reboot



:end



