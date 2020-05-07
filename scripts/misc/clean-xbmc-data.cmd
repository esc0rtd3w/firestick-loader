@echo off

:reset

color 0e

set wait="..\..\bin\wait.exe"

set adb="..\..\bin\adb.exe"

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard


cls
echo This will erase ALL Kodi/XBMC Data on %sdcard%!!!....
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
echo Cleaning /%sdcard%/Android/data/org.xbmc.kodi/ Directory....
echo.
echo.

%wait% 2

%adb% shell rm -rf /%sdcard%/Android/data/org.xbmc.kodi/*

goto end




:end

