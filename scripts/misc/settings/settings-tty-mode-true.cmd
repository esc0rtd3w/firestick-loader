@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: system tty_mode 1

%shell% settings --user 0 put system tty_mode 1

exit

