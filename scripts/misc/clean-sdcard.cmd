@echo off

:reset

color 0e

set wait="..\..\bin\wait.exe"

set adb="..\..\bin\adb.exe"

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard


cls
echo This will erase EVERYTHING on %sdcard%!!!....
echo.
echo.
echo.
echo TYPE "ACCEPT" WITHOUT QUOTES TO CONTINUE....
echo.
echo.

set /p safetyFirst=

if "%safetyFirst%"=="" goto doNothing
if %safetyFirst%==ACCEPT goto cleanThatShit
if %safetyFirst%==accept goto cleanThatShit
if %safetyFirst%==Accept goto cleanThatShit

goto doNothing


:doNothing
cls
echo Nothing Happened....
echo.
echo.

%wait% 3

goto end



:cleanThatShit

cls
echo Cleaning /%sdcard%/ Partition....
echo.
echo.

%wait% 2

%adb% shell rm -rf /%sdcard%/*

goto end




:end

