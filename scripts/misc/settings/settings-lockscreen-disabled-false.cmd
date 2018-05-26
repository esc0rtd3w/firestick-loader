@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: lockscreen.disabled 0

%shell% settings --user 0 put secure lockscreen.disabled 0

exit

