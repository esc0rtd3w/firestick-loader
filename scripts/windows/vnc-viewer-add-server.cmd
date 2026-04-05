@echo off

title Bypass VNC Viewer Nag                      esc0rtd3w 2016



set adb="..\..\bin\adb.exe"
set adbWait=%adb% wait-for-device

set tap=%adb% shell input tap

%tap% 1860 1035




:end


