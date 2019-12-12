@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell
set shellSU=%adb% shell su -c


%shellSU% grep usb.config= /init*rc

echo.
echo Press any key to exit...
echo.
pause>nul
