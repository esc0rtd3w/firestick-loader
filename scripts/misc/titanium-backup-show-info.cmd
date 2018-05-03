@echo off

title Click Info When Showing App Stuffs                     esc0rtd3w 2016



set adb="..\..\bin\adb.exe"
set adbWait=%adb% wait-for-device


set tap=%adb% shell input tap


%tap% 960 300





:end


