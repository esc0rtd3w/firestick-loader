@echo off

color 0e

set adb="..\..\bin\adb.exe"
set shell=%adb% shell
set twrp=%shell% twrp


%twrp% backup data


:end



