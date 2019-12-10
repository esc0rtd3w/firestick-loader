@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


%shell% getprop sys.usb.config

echo.
echo Press any key to exit...
echo.
pause>nul
