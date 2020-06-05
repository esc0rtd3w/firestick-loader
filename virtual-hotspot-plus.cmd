@echo off

:reset

title Amazon FireStick Virtual Hotspot Script  [esc0rtd3w]

color 0e

set pathBin="%~dp0bin"

set runShellNoTerminateAndWait=cmd /k
set runShellNoTerminate=start cmd /k
set runShellWaitNoTerminate=start /wait cmd /k
set runShellTerminateAndWait=cmd /c
set runShellTerminate=start cmd /c
set runShellWaitTerminate=start /wait cmd /c

set _color="%~dp0bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o


set virtualRouterGUI="%~dp0bin\virtualrouterplus.exe"


set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="%~dp0bin\adb.exe"
set adbKill=%adb% kill-server
set adbStart="%adb% start-server
set adbWait=%adb% wait-for-device

set msgbox="%~dp0bin\msgbox.exe"




taskkill /f /im virtualrouterplus.exe


cls
%runShellTerminate% %virtualRouterGUI%
cls


:end

