@echo off


:: Screen Capture Script for Amazon Firestick

:: esc0rtd3w / 2015

set wait="%~dp0bin\wait.exe"

set adb="..\..\bin\adb.exe"

set capDevice=/sdcard/cap.png

set tempHost=%temp%
set capHost="%temp%\cap.png"


cls
echo Capturing Device Screen....
echo.
echo.


%adb% shell screencap %capDevice%

%wait% 1

%adb% pull %capDevice% %tempHost%

%capHost%

