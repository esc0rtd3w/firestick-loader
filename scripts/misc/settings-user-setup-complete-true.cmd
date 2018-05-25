@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


:loop

%shell% settings --user 0 put secure user_setup_complete 1

exit

