@echo off

color 0e


set adb="..\..\bin\adb.exe"
set adbKill="%~dp0bin\adb.exe" kill-server
set adbStart="%~dp0bin\adb.exe" start-server
set adbWait=%adb% wait-for-device

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell


set src=0
set dest=/sdcard/

:start
cls
echo Enter Source File Path or Drop File and Press ENTER:
echo.
echo.

set /p src=

if %src% equ 0 goto start

%push% "%src%" %dest%

pause


:end



