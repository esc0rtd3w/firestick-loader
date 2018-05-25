@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: lock_screen_show_notifications 1

%shell% settings --user 0 put secure lock_screen_show_notifications 1

exit

