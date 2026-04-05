@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: system screen_off_timeout 900000

%shell% settings --user 0 put system screen_off_timeout 900000

exit

