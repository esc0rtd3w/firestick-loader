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

set cacheDir1=cache
set cacheDir2=data/dalvik-cache

cls
echo Cleaning /%cacheDir1%/
echo.

%wait% 2

%shell% "rm -rf /%cacheDir1%/*"

echo Cleaning /%cacheDir2%/
echo.
echo.

%wait% 2
%shell% "rm -rf /%cacheDir2%/*"

%shell% reboot

goto end




:end

