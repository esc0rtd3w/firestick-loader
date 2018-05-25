@echo off

:reset

color 0e

set wait="%~dp0bin\wait.exe"

set adb="..\..\bin\adb.exe"
set shell=%adb% shell

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard


cls
echo Looking For Amazon Running Processes....
echo.
echo.


%shell% "ps"

echo.
echo.
pause


:end

