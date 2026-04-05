@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Content^: query --uri content^://com.amazon.device.controller.provider/device
echo.

%shell% content query --uri content://com.amazon.device.controller.provider/device

pause
exit

