@echo off

color 0b

set adb="..\..\bin\adb.exe"





cls
echo Dumping /sdcard/ Contents....
echo.

if not exist "%~dp0sdcard" md "%~dp0sdcard"

%adb% pull /sdcard/ "%~dp0sdcard"

echo.
echo.
echo.
echo.
pause

