@echo off

title Full Setup Script For Tank

set debug=0
set fireOsVersion=0.0.0.0
set fireOsDevice=none
set downgrade=0

set magiskZip=Magisk-v20.1.zip

set adb="%~dp0bin\adb.exe"
set adbKill=%adb% kill-server
set adbStart=%adb% start-server
set adbWait=%adb% wait-for-device
set sleep="%~dp0bin\wait.exe"
set extractRAR="%~dp0bin\rar.exe" -y x
set cocolor="%~dp0bin\cocolor.exe"

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell
set twrp=%shell% twrp

if not exist "%temp%\firestick-loader" md "%temp%\firestick-loader"

:start
color 0e

:: Set Flags For ADB Service and Unknown Sources
set adb_success=0
set unk_sources_success=0

:: TWRP Requirement
set twrp_available=0
cls
echo Looking For TWRP Recovery...
echo.
%pull% /twres/twrp "%temp%\firestick-loader"
%sleep% 2
if exist "%temp%\firestick-loader\twrp" set twrp_available=1
if %twrp_available%==1 goto intro
if %twrp_available%==0 goto twrpfail

:twrpfail
%cocolor% 0c
cls
echo TWRP Not Found!
echo.
echo Trying To Force Boot Into Recovery...
echo.
%sleep% 3
%adb% reboot recovery
%sleep% 25
goto start

:intro
:: Reset TWRP Flags
if %twrp_available%==1 del /f /q "%temp%\firestick-loader\twrp"
if %twrp_available%==1 set twrp_available=0

color 0e
set rwcheck=0
cls
echo.
echo Mounting System To Check Device Settings...
echo.
%shell% "mount -o rw /system"

echo.
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 echo.
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot recovery
if %rwcheck%==1 %sleep% 25
if %rwcheck%==1 goto intro

:: Get FireOS Info
%shell% "cat /system/build.prop | grep ro.build.version.name>/sdcard/fireos-version.txt"
%pull% /sdcard/fireos-version.txt "%temp%"

%shell% "cat /system/build.prop | grep ro.product.device=>/sdcard/fireos-device.txt"
%pull% /sdcard/fireos-device.txt "%temp%"

for /f "tokens=3 delims= " %%f in ('type "%temp%\fireos-version.txt"') do set fireOsVersion=%%f
for /f "tokens=2 delims==" %%f in ('type "%temp%\fireos-device.txt"') do set fireOsDevice=%%f
%sleep% 1
%shell% "rm /sdcard/fireos-version.txt"
%shell% "rm /sdcard/fireos-device.txt"

if not %fireOsDevice%==tank goto notank
goto restore

:notank
%cocolor% 0c
cls
echo Supports Tank Only!
echo.
echo This device is %fireOsDevice% and CANNOT continue!
echo.
pause
goto end


:restore
set accessibility="scripts\settings\tank\system\scripts\5272\accessibility.sh"
set alexa="scripts\settings\tank\system\scripts\5272\alexa.sh"
set applications="scripts\settings\tank\system\scripts\5272\applications.sh"
set btcontroller="scripts\settings\tank\system\scripts\5272\btcontroller.sh"
set device="scripts\settings\tank\system\scripts\5272\device.sh"
set displaysounds="scripts\settings\tank\system\scripts\5272\display-sounds.sh"
set equipment="scripts\settings\tank\system\scripts\5272\equipment.sh"
set help="scripts\settings\tank\system\scripts\5272\help.sh"
set myaccount="scripts\settings\tank\system\scripts\5272\my-account.sh"
set network="scripts\settings\tank\system\scripts\5272\network.sh"
set notifications="scripts\settings\tank\system\scripts\5272\notifications.sh"
set preferences="scripts\settings\tank\system\scripts\5272\preferences.sh"


:: TODO add Controllers script
cls
echo Pushing Settings Scripts to Temp...
echo.

%push% %accessibility% /data/local/tmp/
%push% %alexa% /data/local/tmp/
%push% %applications% /data/local/tmp/
%push% %btcontroller% /data/local/tmp/
%push% %equipment% /data/local/tmp/
%push% %device% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %notifications% /data/local/tmp/
%push% %preferences% /data/local/tmp/

%sleep% 2

cls
echo Pushing Restore Home Script to Temp...
echo.
%push% "scripts\clean-sdcard-lite.sh" /data/local/tmp/
%push% "scripts\restore-home.sh" /data/local/tmp/

%sleep% 2

cls
echo Making Directories and Setting Permissions for Settings Scripts...
echo.
%shell% "rm -r /system/scripts/"
%shell% "mkdir /system/scripts/"
%shell% "chmod 0777 /system/scripts/"

%sleep% 2

%shell% "cp /data/local/tmp/accessibility.sh /system/scripts/accessibility.sh"
%shell% "cp /data/local/tmp/alexa.sh /system/scripts/alexa.sh"
%shell% "cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "cp /data/local/tmp/btcontroller.sh /system/scripts/btcontroller.sh"
%shell% "cp /data/local/tmp/device.sh /system/scripts/device.sh"
%shell% "cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "cp /data/local/tmp/equipment.sh /system/scripts/equipment.sh"
%shell% "cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "cp /data/local/tmp/notifications.sh /system/scripts/notifications.sh"
%shell% "cp /data/local/tmp/preferences.sh /system/scripts/preferences.sh"

%sleep% 2

cls
echo Copying Restore Home Script From Temp to /system...
echo.
%shell% "cp /data/local/tmp/clean-sdcard-lite.sh /system/scripts/clean-sdcard-lite.sh"
%shell% "cp /data/local/tmp/restore-home.sh /system/scripts/restore-home.sh"

%sleep% 2

cls
echo Setting Permissions...
echo.
%shell% "chmod 0777 /system/scripts/*.sh"
%shell% "chown root:root /system/scripts/*.sh"

%sleep% 2

cls
echo Fixing Permissions...
echo.
:: Source: https://forum.xda-developers.com/showthread.php?t=2222297

%shell% "chown -R media_rw:media_rw /data/media/"
%shell% "find /data/media/ -type d -exec chmod 775 {} ';'"
%shell% "find /data/media/ -type f -exec chmod 664 {} ';'"

%shell% "restorecon -FR /data/media/"

::%twrp% fixperms /
::%twrp% fixperms /system/
::%twrp% fixperms /data/
::%twrp% fixperms /sdcard/
%sleep% 5



cls
echo Preparing For Reboot...
echo.
%sleep% 8

%adb% reboot
%adbWait%

:end



