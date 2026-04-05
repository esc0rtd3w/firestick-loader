@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell

set installLocation=0

cls
echo Enter Install Location and Press ENTER:
echo.
echo. 
set /p installLocation=

cls
echo Settings^: global default_install_location %installLocation%

%shell% settings --user 0 put global default_install_location %installLocation%

exit

