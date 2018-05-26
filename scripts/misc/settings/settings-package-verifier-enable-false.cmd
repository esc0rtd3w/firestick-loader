@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: global package_verifier_enable 0

%shell% settings --user 0 put global package_verifier_enable 0

exit

