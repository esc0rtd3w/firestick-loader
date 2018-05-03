@echo off


:: Screen Capture Script for Amazon Firestick

:: esc0rtd3w / 2015

color 0b

set runShellNoTerminateAndWait=cmd /k
set runShellNoTerminate=start cmd /k
set runShellWaitNoTerminate=start /wait cmd /k
set runShellTerminateAndWait=cmd /c
set runShellTerminate=start cmd /c
set runShellWaitTerminate=start /wait cmd /c

set sleep="..\..\bin\wait.exe"

:: Using different variable to not accidentally overwrite default used by root-stick (safety first!)
set adbTemp="..\..\bin\adb.exe"

set capDevice=/sdcard/cap.png

set tempHost=%temp%
set capHost="%temp%\cap.png"

set waitTime=5

cls
echo Set wait timer (in seconds) and press ENTER:
echo.
echo.
echo Default is 5
echo.
echo.
echo You can set it to any value, but setting 1 or 2 sometimes causes reboot
echo.
echo.

set /p waitTime=

goto loop


:loop
cls
echo Capturing Device Screen....
echo.
echo.
echo.
echo.
echo *** USE CTRL+C AND SELECT N TO BREAK CURRENT OPERATION ***
echo.
echo.

%adbTemp% shell screencap %capDevice%

%adbTemp% pull %capDevice% %tempHost%

%runShellTerminate% %capHost%

%sleep% %waitTime%


goto loop