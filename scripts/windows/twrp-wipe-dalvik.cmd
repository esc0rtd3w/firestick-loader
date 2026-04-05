@echo off

color 0e

set adb="..\..\bin\adb.exe"
set shell=%adb% shell
set twrp=%shell% twrp

cls
echo Wiping Dalvik...
echo.

%twrp% wipe dalvik


:end



