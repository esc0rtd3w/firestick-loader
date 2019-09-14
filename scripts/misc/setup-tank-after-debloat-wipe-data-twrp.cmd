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

:start
set accessibility="..\settings\tank\system\scripts\accessibility.sh"
set applications="..\settings\tank\system\scripts\applications.sh"
set device="..\settings\tank\system\scripts\device.sh"
set displaysounds="..\settings\tank\system\scripts\display-sounds.sh"
set help="..\settings\tank\system\scripts\help.sh"
set myaccount="..\settings\tank\system\scripts\my-account.sh"
set network="..\settings\tank\system\scripts\network.sh"
set notifications="..\settings\tank\system\scripts\notifications.sh"
set preferences="..\settings\tank\system\scripts\preferences.sh"

set noway=0
echo.
echo WARNING! THIS WILL FACTORY RESET YOUR DEVICE!
echo.
echo Press 1 to EXIT or just press ENTER to continue...
echo.
set /p noway=

if %noway%==1 goto end

:stage1
set rwcheck=0
cls
echo.
echo Mount System as RW...
echo.
%shell% "mount -o rw /system"

echo.
echo Check For RW Mount Status
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 echo.
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot recovery
if %rwcheck%==1 %sleep% 25
if %rwcheck%==1 goto stage1

%sleep% 3

echo.
echo Wipe Data and Cache...
echo.
%twrp% wipe data

echo.
echo Waiting For Cache Rebuild and ADB Service...
echo.

%shell% reboot
%adbWait%

echo.
echo Rebooting Back To Recovery To Continue...
echo.
%shell% reboot recovery
%sleep% 10

:stage2
set rwcheck=0
echo.
echo Mount System as RW...
echo.
%shell% "mount -o rw /system"

echo.
echo Check For RW Mount Status
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 echo.
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot recovery
if %rwcheck%==1 %sleep% 25
if %rwcheck%==1 goto stage2

%sleep% 3

echo.
echo Push Settings Scripts to Temp...
echo.
%push% %accessibility% /data/local/tmp/
%push% %applications% /data/local/tmp/
%push% %device% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %notifications% /data/local/tmp/
%push% %preferences% /data/local/tmp/

echo.
echo Push Restore Home Script to Temp...
echo.
%push% "..\restore-home.sh" /data/local/tmp/

echo.
echo Make and Set Permissions for Settings Scripts Directories...
echo.
%shell% "mkdir /system/scripts/"
%shell% "chmod 0777 /system/scripts/"

echo.
echo Copy Settings Scripts From Temp to System...
echo.
%shell% "cp /data/local/tmp/accessibility.sh /system/scripts/accessibility.sh"
%shell% "cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "cp /data/local/tmp/device.sh /system/scripts/device.sh"
%shell% "cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "cp /data/local/tmp/notifications.sh /system/scripts/notifications.sh"
%shell% "cp /data/local/tmp/preferences.sh /system/scripts/preferences.sh"

echo.
echo Copy Restore Home Script From Temp to System...
echo.
%shell% "cp /data/local/tmp/restore-home.sh /system/scripts/restore-home.sh"

echo.
echo Set Permissions...
echo.
%shell% "chmod 0777 /system/scripts/*.sh"
%shell% "chown root:root /system/scripts/*.sh"

echo.
echo Push App Data to sdcard...
echo.
%shell% "rm -r /sdcard/restore/"
%shell% "mkdir /sdcard/restore/"
%push% "..\..\data\tank\post-debloated\restore" /sdcard/restore/
%shell% "mkdir /sdcard/TitaniumBackup/"
%shell% "cp -r /sdcard/restore/TitaniumBackup /sdcard/"

echo.
echo Copy Data from sdcard to system...
echo.
%shell% "rm -r /system/restore/"
%shell% "mkdir /system/restore/"
%shell% "chmod 0777 /system/restore/"
::%shell% "cp -r /sdcard/restore/ca.dstudio.atvlauncher.pro/ /system/restore/"
::%shell% "cp -r /sdcard/restore/com.adamioan.scriptrunner/ /system/restore/"
::%shell% "cp -r /sdcard/restore/com.fluxii.android.mousetoggleforfiretv/ /system/restore/"
%shell% "cp -r /sdcard/restore/TitaniumBackup/ /system/restore/"
%shell% "mkdir /system/restore/apk/"
%shell% "chmod 0777 /system/restore/apk/"

::echo.
::echo Copy App Data back to /data/data/
::echo.
::%shell% "cp -r /system/restore/ca.dstudio.atvlauncher.pro/ /data/data/"
::%shell% "cp -r /system/restore/com.adamioan.scriptrunner/ /data/data/"
::%shell% "cp -r /system/restore/com.fluxii.android.mousetoggleforfiretv/ /data/data/"
::%shell% "chmod -R 0777 /data/data/ca.dstudio.atvlauncher.pro/"
::%shell% "chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db"
::%shell% "chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-shm"
::%shell% "chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-wal"
::%shell% "chmod -R 0777 /data/data/com.adamioan.scriptrunner/"
::%shell% "chmod -R 0777 /data/data/com.fluxii.android.mousetoggleforfiretv/"

echo.
echo Install BusyBox...
echo.
%push% "..\..\bin\android\busybox" /data/local/tmp/
%shell% "chmod 0777 /data/local/tmp/busybox"
%shell% "/data/local/tmp/busybox --install"

echo.
echo Install/Reinstall Magisk...
echo.
%push% "..\..\rooting\tank\Magisk-v19.3.zip" /data/local/tmp/
%shell% "twrp install /data/local/tmp/Magisk-v19.3.zip"

%sleep% 5

echo.
echo Fixing Permissions...
echo.
%twrp% fixperms /

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

%adbWait%

:: Enable ADB and Unknown Sources
echo.
echo Enabling ADB and Unknown Sources...
echo.
%shell% settings --user 0 put global adb_enabled 1
%shell% settings --user 0 put secure install_non_market_apps 1

%sleep% 5


:end



