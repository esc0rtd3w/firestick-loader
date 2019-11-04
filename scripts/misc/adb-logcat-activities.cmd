@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


:loop

%shell% "logcat | grep I/ActivityManager"

goto loop

