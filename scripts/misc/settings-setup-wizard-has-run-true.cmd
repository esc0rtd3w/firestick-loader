@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: setup_wizard_has_run 1

%shell% settings --user 0 put secure setup_wizard_has_run 1

exit

