@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Content^: query --uri content^://settings/system
echo.

%shell% content query --uri content://settings/system

pause
exit

