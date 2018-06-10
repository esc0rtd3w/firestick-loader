@echo off

color 0e

set _color="%cd%\bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="..\..\bin\adb.exe"

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set dd=%shell% "su -c dd

set blockBase=/dev/block/platform/sdhci.1/by-name

set dumpFolder="%temp%\firestick-loader\build-prop"

set swipeUp=%shell% input swipe 200 900 200 300
set keyEnter=%shell% input keyevent 66
set keyTab=%shell% input keyevent 61


set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard


if exist %dumpFolder% rd /q /s %dumpFolder%
mkdir %dumpFolder%

echo.
echo.
echo.
echo Dumping boot.oat....
echo.
echo.

%shell% "cp /system/framework/arm/boot.oat /sdcard/"
%pull% %sdcard%/boot.oat %dumpFolder%
%shell% rm %sdcard%/boot.oat



start "" explorer %dumpFolder%


:end



