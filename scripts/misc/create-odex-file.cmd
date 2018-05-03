@echo off

:reset

title Android ODEXer  [esc0rtd3w 2016]

::mode con lines=36

color 0e

set runShellNoTerminateAndWait=cmd /k
set runShellNoTerminate=start cmd /k
set runShellWaitNoTerminate=start /wait cmd /k
set runShellTerminateAndWait=cmd /c
set runShellTerminate=start cmd /c
set runShellWaitTerminate=start /wait cmd /c

set _color="%cd%\bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set teamviewer="%~dp0bin\teamviewer.exe"

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="..\..\bin\adb.exe"
set adbKill="%~dp0bin\adb.exe" kill-server
set adbStart="%~dp0bin\adb.exe" start-server
set adbWait=%adb% wait-for-device

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set tap=%adb% shell input tap
set swipe=%shell% input swipe
set key=%shell% input keyevent

set swipeUp=%shell% input swipe 200 900 200 300
set keyEnter=%shell% input keyevent 66
set keyOk=%shell% input keyevent 23
set keyTab=%shell% input keyevent 61
set keyArrowUp=%shell% input keyevent 19
set keyArrowDown=%shell% input keyevent 20
set keyArrowLeft=%shell% input keyevent 21
set keyArrowRight=%shell% input keyevent 22

set keyBack=%shell% input keyevent 3
set keyHome=%shell% input keyevent 4

set bloatAction=disable


set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

set fireOsVersion=0.0.0.0

set buildDotProp=/system/build.prop

set rootable=0
set rootableText=NOT EXPLOITABLE
set firstCheck=0
set firstTimeRootAttempt=1


set mountRW=%shell% "su -c mount -o rw,remount /system"
set mountRO=%shell% "su -c mount -o ro,remount /system"

set kill=%shell% am kill

:: Must use double quotes after process/package for Super Kill
set killSuper=%shell% "su -c am kill

:: Must use double quotes after process/package for Super Kill
set rmSuper=%shell% "su -c rm



cls
echo Enter Full APK Path With Name and press ENTER:
echo.
echo.
echo Example: /system/Superuser.apk
echo.
echo.

set /p apkPath=


cls
echo Enter ODEX Name and press ENTER:
echo.
echo.
echo Example: Superuser.odex
echo.
echo.

set /p odexFileNew=


%shell% "su -c busybox dd if=%odexPath% of=%odexFileNew% bs=1 count=20 skip=52 seek=52 conv=notrunc"






:end

%adbKill%



