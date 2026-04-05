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

set dumpFolder="%temp%\firestick-loader\system-apps-dump"

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
echo Dumping System Apps...
echo.
echo.

%shell% "rm -r %sdcard%/system/app"
%shell% "rm -r %sdcard%/system/priv-app"

%shell% "mkdir -p %sdcard%/system/app"
%shell% "mkdir -p %sdcard%/system/priv-app"

%shell% "cp -R /system/app /%sdcard%/system"
%shell% "cp -R /system/priv-app /%sdcard%/system"

%pull% %sdcard%/system/app %dumpFolder%/system/app
%pull% %sdcard%/system/priv-app %dumpFolder%/system/priv-app

start "" explorer %dumpFolder%

:end



