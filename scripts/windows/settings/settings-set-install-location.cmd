@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell

set installLocationValue=0

cls
echo Enter Install Location Value and Press ENTER:
echo.
echo. 
set /p installLocationValue=

cls
echo Settings^: global set_install_location %installLocationValue%

%shell% settings --user 0 put global set_install_location %installLocationValue%

exit

