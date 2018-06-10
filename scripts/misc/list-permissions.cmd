@echo off

color 0b

set adb="..\..\bin\adb.exe"



%adb% shell pm list permissions -d -g

pause

