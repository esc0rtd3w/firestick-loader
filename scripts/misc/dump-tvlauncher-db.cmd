@echo off

color 0e

set _color="%cd%\bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="..\..\bin\adb.exe"

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell


set dumpFolder="%temp%\firestick-loader\dump"

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

if not exist %dumpFolder% mkdir %dumpFolder%

%shell% "su -c cp /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db /sdcard/sections.db"
%pull% /sdcard/sections.db %dumpFolder%

start "" explorer %dumpFolder%

echo.
echo.
echo.
echo Press a key to exit....
echo.
echo.
::pause>nul

:end



