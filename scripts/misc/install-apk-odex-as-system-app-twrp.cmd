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


cls
set name=0

cls
echo Type Name of Package Name ODEX (NO SPACES) You Want and Press ENTER:
echo.
echo.

set /p name=


cls

cls
echo Package Name: %name%
echo.
echo Drag (or Type) an ODEX Path and Press ENTER:
echo.
echo.

set /p odex=

%shell% "mount -o rw /system"
%push% "%odex%" /data/local/tmp/temp.odex
%push% "..\install-odex-as-system-app-twrp.sh" /data/local/tmp/
%shell% "chmod 777 /data/local/tmp/install-odex-as-system-app-twrp.sh"
%shell% "sh /data/local/tmp/install-odex-as-system-app-twrp.sh %name%"

:end



