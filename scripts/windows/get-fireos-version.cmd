@echo off

:reset

title Get FireOS Version Script  [esc0rtd3w]

::mode con lines=37

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


set kingrootPC="%~dp0rooting\montoya\king\kingroot-pc.exe"

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

set amStart=%shell% am start -a android.intent.action.MAIN -n






%shell% "cat /system/build.prop | grep ro.build.version.name>/sdcard/fireos-version.txt"

%pull% /sdcard/fireos-version.txt "%temp%"

::findstr 5.2.1.1 "%temp%\fireos-version.txt"

for /f "tokens=3 delims= " %%f in ('type "%temp%\fireos-version.txt"') do set fireOsVersion=%%f

cls
echo %fireOsVersion%

::notepad "%temp%\fireos-version.txt"

pause>nul



:end

