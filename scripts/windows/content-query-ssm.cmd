@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Content^: query --uri content://com.amazon.ssmsys.provider/ssm
echo.

%shell% content query --uri content://com.amazon.ssmsys.provider/ssm

pause
exit

