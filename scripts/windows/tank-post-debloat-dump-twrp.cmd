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

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

set dumpFolder="%temp%\firestick-loader\dump\restore"

if exist %dumpFolder% rd /q /s %dumpFolder%

%sleep% 2

mkdir %dumpFolder%

%shell% "mkdir /sdcard/restore/"
%shell% "cp -r /data/data/ca.dstudio.atvlauncher.pro/ /sdcard/restore/"
%shell% "cp -r /data/data/com.adamioan.scriptrunner/ /sdcard/restore/"
%shell% "cp -r /data/data/com.fluxii.android.mousetoggleforfiretv/ /sdcard/restore/"

%pull% /sdcard/restore/ %dumpFolder%


start "" explorer %dumpFolder%

echo.
echo.
echo.
echo Press a key to exit....
echo.
echo.
pause>nul

:end



