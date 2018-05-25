@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: user_setup_complete 1

%shell% settings --user 0 put secure user_setup_complete 1

exit

