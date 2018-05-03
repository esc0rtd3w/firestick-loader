@echo off

color 0b

set adb="..\..\bin\adb.exe"


:loop

%adb% logcat v

goto loop

