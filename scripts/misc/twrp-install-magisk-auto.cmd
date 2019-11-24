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

set name=Magisk-v19.3.zip
set installOnly=0

cls
echo Type 1 if zip already on device and Press ENTER:
echo.
echo Current Filename: %name%
echo.

set /p installOnly=

if %installOnly%==1 goto install

:push
cls
set src="..\..\rooting\tank\%name%"

%push% %src% /sdcard/

:install
%shell% "twrp install /sdcard/%name%"



:end



