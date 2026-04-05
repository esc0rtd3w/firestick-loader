@echo off

color 0e


set adb="..\..\bin\adb.exe"


set pull=%adb% pull

set dumpPath="%temp%\firestick-loader\backups\TWRP"

cls
echo Current Path: %dumpPath%
echo.
echo Enter Path To Dump Backups and Press ENTER:
echo.
set /p dumpPath=

cls
echo New Path: %dumpPath%
echo.

mkdir %dumpPath%

%pull% /sdcard/TWRP/ %dumpPath%


start "" explorer %dumpPath%



:end



