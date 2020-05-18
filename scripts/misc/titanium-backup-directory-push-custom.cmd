@echo off

color 0e


set adb="..\..\bin\adb.exe"


set shell=%adb% shell
set push=%adb% push


cls
echo Enter TitaniumBackup Directory To Transfer To /sdcard/
echo.
set /p directory=

%adb% shell "mkdir /sdcard/TitaniumBackup/"
%adb% push %directory% /sdcard/TitaniumBackup/

pause

:end



