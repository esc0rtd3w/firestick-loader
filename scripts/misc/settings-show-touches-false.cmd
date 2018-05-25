@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: system show_touches 0

%shell% settings --user 0 put system show_touches 0

exit

