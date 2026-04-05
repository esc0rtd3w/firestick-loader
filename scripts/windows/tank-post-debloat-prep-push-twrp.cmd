@echo off

color 0e

set _color="%cd%\bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="..\..\bin\adb.exe"

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

set accessibility="..\settings\tank\system\scripts\accessibility.sh"
set applications="..\settings\tank\system\scripts\applications.sh"
set device="..\settings\tank\system\scripts\device.sh"
set displaysounds="..\settings\tank\system\scripts\display-sounds.sh"
set help="..\settings\tank\system\scripts\help.sh"
set myaccount="..\settings\tank\system\scripts\my-account.sh"
set network="..\settings\tank\system\scripts\network.sh"
set notifications="..\settings\tank\system\scripts\notifications.sh"
set preferences="..\settings\tank\system\scripts\preferences.sh"

:: Mount System as RW
%shell% "mount -o rw /system"

:: Push Settings Scripts to Temp
%push% %accessibility% /data/local/tmp/
%push% %applications% /data/local/tmp/
%push% %device% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %notifications% /data/local/tmp/

:: Push Restore Home Script to Temp
%push% "..\restore-home.sh" /data/local/tmp/

:: Make and Set Permissions for Settings Scripts Directories
%shell% "mkdir /system/scripts/"
%shell% "chmod 0755 /system/scripts/"

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
%shell% "mkdir /sdcard/restore/"
%push% "..\..\data\tank\post-debloated\restore\" /sdcard/restore/

:: Copy Data from sdcard to system
%shell% "mkdir /system/restore/"
%shell% "chmod 0755 /system/restore/"
::%shell% "cp -r /sdcard/restore/ca.dstudio.atvlauncher.pro/ /system/restore/"
::%shell% "cp -r /sdcard/restore/com.adamioan.scriptrunner/ /system/restore/"
::%shell% "cp -r /sdcard/restore/com.fluxii.android.mousetoggleforfiretv/ /system/restore/"
%shell% "cp -r /sdcard/restore/TitaniumBackup/ /system/restore/"

:: Push APKs
%push% "..\..\apps\system\busybox.apk" /data/local/tmp/
%push% "..\..\apps\utilities\mouse-toggle.apk" /data/local/tmp/

:: Setup APK Directory
%shell% "mkdir /system/restore/apk/"
%shell% "chmod 0755 /system/restore/apk/"

:: Copy APKs To System
%shell% "cp /data/local/tmp/busybox.apk /system/restore/apk/"
%shell% "cp /data/local/tmp/mouse-toggle.apk /system/restore/apk/"

::%shell% "chmod 0644 -R /system/restore/apk/"
%shell% "chown root:root -R /system/restore/apk/"

echo.
echo.
echo.
echo Press a key to exit....
echo.
echo.
pause>nul

:end



