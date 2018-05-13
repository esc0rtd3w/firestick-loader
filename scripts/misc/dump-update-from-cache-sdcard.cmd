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

set dumpFolder="%temp%\firestick-loader\update-dump"

set swipeUp=%shell% input swipe 200 900 200 300
set keyEnter=%shell% input keyevent 66
set keyTab=%shell% input keyevent 61


set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

set cacheDir=cache
set updateFile=update-kindle-montoya-54.6.0.6_user_606753620.bin

if exist %dumpFolder% rd /q /s %dumpFolder%
mkdir %dumpFolder%

echo.
echo.
echo.
echo Copying /%cacheDir%/%updateFile% to /%sdcard%/...
echo.
echo.


%shell% "su -c cp /%cacheDir%/%updateFile% /%sdcard%/"
%pull% %sdcard%/%updateFile% %dumpFolder%

start "" explorer %dumpFolder%

:end



