set file=%1

@echo off

color 0e


set adb="..\..\bin\adb.exe"


set push=%adb% push



cls


%push% %file% /data/local/tmp/





:end



