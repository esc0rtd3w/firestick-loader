@echo off


set adb="adb.exe"

set tap=%adb% shell input tap


:menu


%tap% 20 1030


:end


