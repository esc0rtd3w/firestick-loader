@echo off

set adb="..\..\bin\adb.exe"

:loop
%adb% shell input keyevent 82
%adb% shell input keyevent 66
goto loop