@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: screensaver_enabled 0

%shell% settings --user 0 put secure screensaver_enabled 0

exit

