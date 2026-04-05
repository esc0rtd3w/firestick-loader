@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: global wifi_watchdog_on 1

%shell% settings --user 0 put global wifi_watchdog_on 1

exit

