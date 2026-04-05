@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: get secure bluetooth_address

echo.
%shell% settings get secure bluetooth_address

echo.
echo.
pause

exit

