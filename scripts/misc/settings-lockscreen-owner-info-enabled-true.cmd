@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: lock_screen_owner_info_enabled 1

%shell% settings --user 0 put secure lock_screen_owner_info_enabled 1

exit

