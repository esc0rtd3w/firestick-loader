@echo off

set adb="..\..\bin\adb.exe"
set shell=%adb% shell

%shell% "su -c service call bluetooth_manager 6"




:end


