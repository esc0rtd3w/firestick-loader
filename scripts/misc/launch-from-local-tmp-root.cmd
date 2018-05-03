@echo off

color 0e


set adb="..\..\bin\adb.exe"


set shell=%adb% shell "su -c sh



cls
echo Type script name to launch and press ENTER:
echo.
echo.

set /p script=


%shell% /data/local/tmp/%script%"





:end



