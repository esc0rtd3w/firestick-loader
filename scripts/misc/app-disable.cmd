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

set name=0

cls
echo Type Name of Package Name (NO SPACES) To REMOVE and Press ENTER:
echo.
echo.

set /p name=

%shell% "su -c pm disable %name%"


:end



