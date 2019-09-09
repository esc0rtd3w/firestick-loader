@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: backup_enabled 0

%shell% settings --user 0 put global adb_enabled 0

exit

