@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: secure install_non_market_apps 1

%shell% settings --user 0 put secure install_non_market_apps 1

exit

