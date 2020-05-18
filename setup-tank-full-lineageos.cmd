@echo off

title Full Setup Script For Tank

set debug=0
set fireOsVersion=0.0.0.0
set fireOsDevice=none
set downgrade=0

set adult=0
set adultCheck=0

set magiskZip=Magisk-v20.4.zip

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

:: Kill any adb instances before starting
%adbKill%


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
%shell% "cat /system/build.prop | grep ro.product.name>/sdcard/fireos-version.txt"
%pull% /sdcard/fireos-version.txt "%temp%"

%shell% "cat /system/build.prop | grep ro.product.device=>/sdcard/fireos-device.txt"
%pull% /sdcard/fireos-device.txt "%temp%"

for /f "tokens=2 delims==" %%f in ('type "%temp%\fireos-version.txt"') do set fireOsVersion=%%f
for /f "tokens=2 delims==" %%f in ('type "%temp%\fireos-device.txt"') do set fireOsDevice=%%f
%sleep% 1
%shell% "rm /sdcard/fireos-version.txt"
%shell% "rm /sdcard/fireos-device.txt"

if not %fireOsDevice%==tank goto notank
if not %fireOsVersion%==cm_tank goto nolineage

set continue=y
cls
%cocolor% 0a
echo TWRP Found!
echo.
%cocolor% 0b
echo Device: %fireOsDevice% / Product Name: %fireOsVersion%
echo.
echo.
%cocolor% 0e
echo Continue [Y/N]?
echo.
set /p continue=

if %continue%==y goto stage1
if %continue%==Y goto stage1

goto end


:notank
%cocolor% 0c
cls
echo Supports Tank Only!
echo.
echo This device is %fireOsDevice% and CANNOT continue!
echo.
pause
goto end


:nolineage
%cocolor% 0c
cls
echo Supports LineageOS Only!
echo.
echo This OS is %fireOsVersion% and CANNOT continue!
echo.
pause
goto end


:stage1

color 0e
set rwcheck=0

cls
echo Forcing Reboot Back To Recovery...
echo.
%adb% reboot recovery
%sleep% 25

cls
echo.
echo Mounting System as RW for System Install...
echo.
%shell% "mount -o rw /system"

echo.
echo Check For RW Mount Status
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
if %rwcheck%==1 goto stage1


cls
echo Removing Some Pre-Installed Apps...
echo.

%sleep% 3

%shell% "rm -r /system/app/YouTubeLeanback/"

%sleep% 5

cls
echo Setting Up Directories For Restore...
echo.
%shell% "rm -r /sdcard/restore/"
%shell% "mkdir /sdcard/restore/"
%shell% "rm -r /sdcard/TitaniumBackup/"
%shell% "mkdir /sdcard/restore/apk/"
%shell% "mkdir /sdcard/restore/apk/system/"
%sleep% 2

cls
echo Use Home Menu With Preset Adult Section [Y/N]?
echo.
echo Default is NO
echo.
set /p adultCheck=
if %adultCheck%==y set adult=1
if %adultCheck%==Y set adult=1

cls
echo Pushing Restore Data to /sdcard/...
echo.
%push% "data\tank\post-debloated\lineageos-all\restore" /sdcard/restore/
if %adult%==0 %push% "data\tank\post-debloated\lineageos\restore" /sdcard/restore/
if %adult%==1 %push% "data\tank\post-debloated\lineageos-adult\restore" /sdcard/restore/
%sleep% 2

cls
echo Copying TitaniumBackup Data For Restore...
echo.
%shell% "cp -r /sdcard/restore/TitaniumBackup/ /sdcard/"
%sleep% 2

cls
echo Creating System Restore Directories and Setting Permissions...
echo.
%shell% "rm -r /system/restore/"
%shell% "mkdir /system/restore/"
%shell% "mkdir /system/restore/apk/"
%shell% "mkdir /system/restore/apk/system/"

%shell% "chmod 0777 /system/restore/"
%shell% "chown root:root /system/restore/"

%shell% "chmod 0777 /system/restore/apk/"
%shell% "chown root:root /system/restore/apk/"

%shell% "chmod 0777 /system/restore/apk/system/"
%shell% "chown root:root /system/restore/apk/system/"

cls
echo Copying Data from /sdcard to /system...
echo.
%shell% "cp -r /sdcard/restore/ /system/"

%sleep% 3

cls
echo Pushing Clean SD Card Script to Temp...
echo.
%push% "scripts\clean-sdcard-lite.sh" /data/local/tmp/

%sleep% 2

cls
echo Making Directories and Setting Permissions for Settings Scripts...
echo.
%shell% "rm -r /system/scripts/"
%shell% "mkdir /system/scripts/"
%shell% "chmod 0777 /system/scripts/"

%sleep% 2

cls
echo Copying Clean SD Card Script From Temp to /system...
echo.
%shell% "cp /data/local/tmp/clean-sdcard-lite.sh /system/scripts/clean-sdcard-lite.sh"

%sleep% 2

cls
echo Setting Permissions...
echo.
%shell% "chmod 0777 /system/scripts/*.sh"
%shell% "chown root:root /system/scripts/*.sh"

%sleep% 2

cls
echo Copying Apps to /system/app/...
echo.
%shell% "rm -r /system/app/LeanbackLauncher/"
%shell% "mkdir /system/app/LeanbackLauncher/"
%shell% "chmod 0775 /system/app/LeanbackLauncher/"
%shell% "chown root:root /system/app/LeanbackLauncher/"
%shell% "cp /system/restore/apk/system/LeanbackLauncher.apk /system/app/LeanbackLauncher/LeanbackLauncher.apk"

%shell% "rm -r /system/app/ScriptRunner/"
%shell% "mkdir /system/app/ScriptRunner/"
%shell% "chmod 0775 /system/app/ScriptRunner/"
%shell% "chown root:root /system/app/ScriptRunner/"
%shell% "cp /system/restore/apk/system/ScriptRunner.apk /system/app/ScriptRunner/ScriptRunner.apk"

%shell% "rm -r /system/app/TitaniumBackup/"
%shell% "mkdir /system/app/TitaniumBackup/"
%shell% "chmod 0775 /system/app/TitaniumBackup/"
%shell% "chown root:root /system/app/TitaniumBackup/"
%shell% "cp /system/restore/apk/system/TitaniumBackup.apk /system/app/TitaniumBackup/TitaniumBackup.apk"

%shell% "rm -r /system/app/TitaniumBackupAddon/"
%shell% "mkdir /system/app/TitaniumBackupAddon/"
%shell% "chmod 0775 /system/app/TitaniumBackupAddon/"
%shell% "chown root:root /system/app/TitaniumBackupAddon/"
%shell% "cp /system/restore/apk/system/TitaniumBackupAddon.apk /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"

%sleep% 2

cls
echo Copying Apps to /system/priv-app/...
echo.
%shell% "rm -r /system/priv-app/LeanbackLauncher/"
%shell% "mkdir /system/priv-app/LeanbackLauncher/"
%shell% "chmod 0775 /system/priv-app/LeanbackLauncher/"
%shell% "chown root:root /system/priv-app/LeanbackLauncher/"
%shell% "cp /system/restore/apk/system/LeanbackLauncher.apk /system/priv-app/LeanbackLauncher/LeanbackLauncher.apk"

%sleep% 2

cls
echo Setting Permissions For System Apps...
echo.
%shell% "chmod 0644 /system/app/LeanbackLauncher/LeanbackLauncher.apk"
%shell% "chown root:root /system/app/LeanbackLauncher/LeanbackLauncher.apk"

%shell% "chmod 0644 /system/priv-app/LeanbackLauncher/LeanbackLauncher.apk"
%shell% "chown root:root /system/priv-app/LeanbackLauncher/LeanbackLauncher.apk"

%shell% "chmod 0644 /system/app/ScriptRunner/ScriptRunner.apk"
%shell% "chown root:root /system/app/ScriptRunner/ScriptRunner.apk"

%shell% "chmod 0644 /system/app/TitaniumBackup/TitaniumBackup.apk"
%shell% "chown root:root /system/app/TitaniumBackup/TitaniumBackup.apk"

%shell% "chmod 0644 /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"
%shell% "chown root:root /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"

%sleep% 2

set wipedata=n
cls
echo Wipe Data and Cache [Y/N]?
echo.
set /p wipedata=

if %wipedata%==n goto skipwipe
if %wipedata%==N goto skipwipe

cls
echo Wiping Data, Cache, and Dalvik Cache...
echo.
echo This May Take Several Minutes!
echo.
%twrp% wipe data
%sleep% 5
%twrp% wipe cache
%sleep% 5
%twrp% wipe dalvik
%sleep% 5

:skipwipe
cls
echo Re-Installing Magisk for SU Access...
echo.
%push% "rooting\tank\%magiskZip%" /data/local/tmp/
%twrp% install /data/local/tmp/%magiskZip%
%sleep% 2

cls
echo Fixing Permissions...
echo.
:: Source: https://forum.xda-developers.com/showthread.php?t=2222297

%shell% "chown -R media_rw:media_rw /data/media/"
%shell% "find /data/media/ -type d -exec chmod 775 {} ';'"
%shell% "find /data/media/ -type f -exec chmod 664 {} ';'"

%shell% "restorecon -FR /data/media/"

%sleep% 5

cls
echo Preparing For Reboot...
echo.

%sleep% 8

%adb% reboot

%adbWait%


:finished
cls
color 0a
echo.
echo Once on Launcher, use TitaniumBackup to restore data for
echo ATV Launcher Home and SH Script Runner Settings
echo.
echo Use TitaniumBackup to restore apps for Mouse Toggle, Busybox and Autoruns
echo.
echo Press any key to exit...
pause>nul



:end



