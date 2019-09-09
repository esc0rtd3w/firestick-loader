set file=%1

@echo off

color 0e


set adb="..\..\bin\adb.exe"


set shell=%adb% shell


set continue=0
cls
echo Are You Sure You Want To REMOVE All TWRP Backups [Y/N]?
echo.

set /p continue=


if %continue%==0 goto end
if %continue%==n goto end
if %continue%==N goto end


%shell% "rm -r /sdcard/TWRP/"


:end



