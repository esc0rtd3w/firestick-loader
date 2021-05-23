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

set src=0
set name=/sdcard/update.bin

cls
echo Enter File Path on Device and Press ENTER:
echo.
echo Example: /sdcard/update.bin
echo.
set /p name=

::%shell% "twrp remountrw /system"

:install
cls
%shell% "twrp install /sdcard/%name%"



:end



