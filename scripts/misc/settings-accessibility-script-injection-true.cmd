@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: secure accessibility_script_injection 1

%shell% settings --user 0 put secure accessibility_script_injection 1

exit

