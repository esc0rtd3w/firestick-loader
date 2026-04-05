@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell

set text=none

cls
echo Set GREP Text and Press ENTER:
echo.
echo.
echo ** For Multiple Entries Use "text1 | grep text2" Format (NO QUOTES) **
echo.
echo ** Example: amazon ^| grep nimh **
echo.
echo.

set /p text=


%shell% "logcat v | grep %text%"



:end

