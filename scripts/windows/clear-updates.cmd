@echo off

:reset

color 0e

set wait="..\..\bin\wait.exe"

set adb="..\..\bin\adb.exe"

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

set cacheDir=cache
set cacheDirSD=sdcard/Android/data/com.amazon.device.software.ota/files

cls
echo Removing *.bin Updates....
echo.
echo.

%wait% 2

%shell% "su -c rm -f /%cacheDir%/*.bin"
%shell% "su -c rm -f /%cacheDirSD%/*.bin"

goto end




:end

