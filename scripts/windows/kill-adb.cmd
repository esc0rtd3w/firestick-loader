@echo off

set adb="..\..\bin\adb.exe"

%adb% kill-server
taskkill /f /im adb.exe
taskkill /f /t /im adb.exe