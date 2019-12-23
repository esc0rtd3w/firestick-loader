@echo off

color 0e


set adb="..\..\bin\adb.exe"


set shell=%adb% shell
set push=%adb% push


%adb% shell "mkdir /sdcard/TitaniumBackup/"
%adb% push "..\..\data\tank\post-debloated\5272\restore\TitaniumBackup" /sdcard/TitaniumBackup/

pause

:end



