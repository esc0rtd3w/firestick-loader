@echo off

title Full Setup Script For Montoya

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
set key=%shell% input keyevent
set twrp=%shell% twrp

if not exist "%temp%\firestick-loader" md "%temp%\firestick-loader"

:start
color 0e
set applications="scripts\settings\montoya\system\scripts\505\applications.sh"
set btcontroller="scripts\settings\tank\system\scripts\505\btcontroller.sh"
set displaysounds="scripts\settings\montoya\system\scripts\505\display-sounds.sh"
set help="scripts\settings\montoya\system\scripts\505\help.sh"
set myaccount="scripts\settings\montoya\system\scripts\505\my-account.sh"
set network="scripts\settings\montoya\system\scripts\505\network.sh"
set pcon="scripts\settings\montoya\system\scripts\505\parental-controls.sh"
set system="scripts\settings\montoya\system\scripts\505\system.sh"

:: Set Flags For ADB Service and Unknown Sources
set adb_success=0
set unk_sources_success=0

:: TWRP Requirement
set twrp_available=0
cls
%cocolor% 0e
echo Looking For TWRP Recovery...
echo.
%cocolor% 0c
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
echo.
%cocolor% 0e
echo A New Window Will Open That You Must Type Into!
%cocolor% 0c
echo.
%sleep% 3
%adb% reboot
%sleep% 15

%cocolor% 0e
cls
echo A new window should have opened!
echo.
echo.
echo 1) Type "mouse" without quotes and press ENTER
echo.
echo 2) Press the D key [RIGHT] to move TWRP selection to Launch Recovery
echo.
echo When TWRP loaded, close mouse window then press N on this screen and ENTER
echo.
start /wait cmd /k %shell%
%sleep% 5
goto start

:intro
:: Reset TWRP Flags
if %twrp_available%==1 del /f /q "%temp%\firestick-loader\twrp"
if %twrp_available%==1 set twrp_available=0


:stage1
color 0e
set rwcheck=0
cls
echo.
echo Mounting System as RW...
echo.
%shell% "mount -o rw /system"

echo.
echo Check For RW Mount Status
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 cls
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot
if %rwcheck%==1 %sleep% 15

if %rwcheck%==1 cls
if %rwcheck%==1 echo A new window should have opened!
if %rwcheck%==1 echo.
if %rwcheck%==1 echo.
if %rwcheck%==1 echo 1) Type "mouse" without quotes and press ENTER
if %rwcheck%==1 echo.
if %rwcheck%==1 echo 2) Press the D key [RIGHT] to move TWRP selection to Launch Recovery
if %rwcheck%==1 echo.
if %rwcheck%==1 echo When TWRP loaded, close mouse window then press N on this screen and ENTER
if %rwcheck%==1 echo.
if %rwcheck%==1 start /wait cmd /k %shell%
if %rwcheck%==1 %sleep% 5
if %rwcheck%==1 goto stage1

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
echo Pushing Restore Data to /sdcard/...
echo.
%push% "data\montoya\post-debloated\restore" /sdcard/restore/
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

%sleep% 2

cls
echo Pushing Settings Scripts to Temp...
echo.
%push% %applications% /data/local/tmp/
%push% %btcontroller% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %pcon% /data/local/tmp/
%push% %system% /data/local/tmp/

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

cls
echo Copying Settings Scripts From Temp to /system...
echo.
%shell% "cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "cp /data/local/tmp/btcontroller.sh /system/scripts/btcontroller.sh"
%shell% "cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "cp /data/local/tmp/parental-controls.sh /system/scripts/parental-controls.sh"
%shell% "cp /data/local/tmp/system.sh /system/scripts/system.sh"

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
echo Remove Old FirePwnHome Launcher From /system/app/ if present...
echo.
%shell% "rm -r /system/app/FirePwnHome/"

%sleep% 2

cls
echo Copying Apps to /system/app/...
echo.
%shell% "rm -r /system/app/ADBInsecure/"
%shell% "mkdir /system/app/ADBInsecure/"
%shell% "chmod 0775 /system/app/ADBInsecure/"
%shell% "chown root:root /system/app/ADBInsecure/"
%shell% "cp /system/restore/apk/system/ADBInsecure.apk /system/app/ADBInsecure/ADBInsecure.apk"

%shell% "rm -r /system/app/Launcher/"
%shell% "mkdir /system/app/Launcher/"
%shell% "chmod 0775 /system/app/Launcher/"
%shell% "chown root:root /system/app/Launcher/"
%shell% "cp /system/restore/apk/system/Launcher.apk /system/app/Launcher/Launcher.apk"

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
echo Setting Permissions For System Apps...
echo.
%shell% "chmod 0644 /system/app/ADBInsecure/ADBInsecure.apk"
%shell% "chown root:root /system/app/ADBInsecure/ADBInsecure.apk"

%shell% "chmod 0644 /system/app/Launcher/Launcher.apk"
%shell% "chown root:root /system/app/Launcher/Launcher.apk"

%shell% "chmod 0644 /system/app/ScriptRunner/ScriptRunner.apk"
%shell% "chown root:root /system/app/ScriptRunner/ScriptRunner.apk"

%shell% "chmod 0644 /system/app/TitaniumBackup/TitaniumBackup.apk"
%shell% "chown root:root /system/app/TitaniumBackup/TitaniumBackup.apk"

%shell% "chmod 0644 /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"
%shell% "chown root:root /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"

%sleep% 2


cls
echo Installing BusyBox...
echo.
%push% "%~dp0bin\android\busybox" /data/local/tmp/
%shell% "chmod 0777 /data/local/tmp/busybox"
%shell% "/data/local/tmp/busybox --install"

%sleep% 2

cls
echo Wiping Data, Cache, and Dalvik Cache...
echo.
::%twrp% wipe data
::%sleep% 5
%twrp% wipe cache
%sleep% 5
%twrp% wipe dalvik
%sleep% 5

cls
echo Fixing Permissions...
echo.
:: Source: https://forum.xda-developers.com/showthread.php?t=2222297

%shell% "chown -R media_rw:media_rw /data/media/"
%shell% "find /data/media/ -type d -exec chmod 775 {} ';'"
%shell% "find /data/media/ -type f -exec chmod 664 {} ';'"

%shell% "restorecon -FR /data/media/"

cls
echo Waiting For 2nd Init To Boot Normally...
echo.
%adb% reboot
%sleep% 45

cls
%cocolor% 0e
echo Waiting For Cache Rebuild and ADB Service...
echo.
echo.
%cocolor% 0b
echo Complete the user setup to configure remote, wifi, and Amazon account
%cocolor% 0e
echo.
echo.
echo Once on Launcher, do the following:
echo.
echo 1) Use TitaniumBackup to restore data for Home and SH Script Runner
echo 2) Open ADB Insecure app, set to insecure and run at boot
echo 3) Unplug and replug the device to use new Home shortcuts
echo 4) Use the Device shortcut and navigate to Developer Options menu
echo.
echo.
echo Finally, Enable ADB Debugging and the script will automatically continue...
echo.
%adbwait%

cls
%cocolor% 0e
echo Rebooting...
echo.
%adb% reboot
%sleep% 15

cls
%cocolor% 0e
echo Waiting on Reboot...
echo.
%sleep% 55
%adbwait%

:chkadb
cls
%cocolor% 0e
echo Checking For ADB Service...
echo.
%sleep% 5
%shell% "nothing=nothing"
if %errorlevel%==0 goto stage3
%sleep% 30
goto chkadb

:stage3
cls
echo Checking/Enabling ADB and Unknown Sources...
echo.
echo This script will also set these values in Amazon Settings app
echo.
%shell% settings --user 0 put global adb_enabled 1
if %errorlevel%==0 set adb_success=1
%shell% settings --user 0 put secure install_non_market_apps 1
if %errorlevel%==0 set unk_sources_success=1

:chk1
if %adb_success%==1 goto chk2
if %adb_success%==0 goto chkadb

:chk2
if %unk_sources_success%==1 goto final

:: If anything fails, go back to check adb status
goto chkadb

:final
set unkadb=0
cls
echo Checking For ADB Service...
echo.
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p unkadb=

if %unkadb%==1 cls
if %unkadb%==1 echo Waiting For ADB Service...
if %unkadb%==1 echo.
if %unkadb%==1 %cocolor% 0b
if %unkadb%==1 echo Make sure you open ADB Insecure app and set to run at boot
if %unkadb%==1 echo.
if %unkadb%==1 %cocolor% 0e
if %unkadb%==1 %sleep% 10
if %unkadb%==1 goto stage3

%sleep% 3

cls
color 0a
echo Finished!
echo.
echo Use TitaniumBackup to restore data for Mouse Toggle, Reboot, and Autoruns
echo.
echo Press any key to exit...
pause>nul


:end



