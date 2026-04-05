@echo off

color 0e

set adb="..\..\bin\adb.exe"
set shell=%adb% shell
set twrp=%shell% twrp
set sleep="..\..\bin\wait.exe"

set twrpBasePathBackups=/sdcard/TWRP/BACKUPS

:: Get Backup Image Path
%shell% "ls /sdcard/TWRP/BACKUPS/>/data/local/tmp/serial.txt"
%adb% pull /data/local/tmp/serial.txt %temp%
set /p serial=<"%temp%\serial.txt"
set backupDir=/sdcard/TWRP/BACKUPS/%serial%/
%shell% "ls %backupDir%>/data/local/tmp/dirlist.txt"
%adb% pull /data/local/tmp/dirlist.txt %temp%
set /p dirlist=<"%temp%\dirlist.txt"

set backupName=0
set backupImagePath=0

cls
echo Type Backup Name From List and Press ENTER:
echo.
echo %dirlist%
echo.

set /p backupName=

set backupImagePath=%twrpBasePathBackups%/%serial%/%backupName%

cls
echo Backup Path: %backupImagePath%
echo.

%twrp% remountrw /system
%sleep% 3
%twrp% restore %backupName%


:end



