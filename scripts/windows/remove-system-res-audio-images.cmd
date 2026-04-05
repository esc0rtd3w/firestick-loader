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


set continue=0
cls
echo Are You Sure You Want To REMOVE The Following [Y/N]?
echo.
echo.

set /p continue=


if %continue%==0 goto end
if %continue%==n goto end
if %continue%==N goto end


%shell% "su -c mount -o remount,rw /system"
%shell% "su -c rm -r /system/res/images/*.*"
%shell% "su -c rm -r /system/res/sound/*.*"


:end



