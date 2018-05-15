@echo off

color 0b

set adb="..\..\bin\adb.exe"


del /f /q "%temp%\logcat.txt"

:loop

%adb% logcat -d>>"%temp%\logcat.txt"

goto loop

