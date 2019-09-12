@echo off

color 0e


set adb="..\..\bin\adb.exe"


set shell=%adb% shell


%shell% rm -r /sdcard/TitaniumBackup/

::pause

:end



