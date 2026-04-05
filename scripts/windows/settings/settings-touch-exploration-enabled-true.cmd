@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: touch_exploration_enabled 1

%shell% settings --user 0 put secure touch_exploration_enabled 1

exit

