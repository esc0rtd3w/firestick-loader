@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: secure USER_ROLE ADULT

%shell% settings --user 0 put secure USER_ROLE ADULT

exit

