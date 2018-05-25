@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: enabled_notification_listeners 1

%shell% settings --user 0 put secure enabled_notification_listeners 1

exit

