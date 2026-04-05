@echo off

:reset

title Update Protection Loop Script [Try Preventing FireOS 5.2.1.1+ Update]  [esc0rtd3w]

::mode con lines=37

color 0e

set runShellNoTerminateAndWait=cmd /k
set runShellNoTerminate=start cmd /k
set runShellWaitNoTerminate=start /wait cmd /k
set runShellTerminateAndWait=cmd /c
set runShellTerminate=start cmd /c
set runShellWaitTerminate=start /wait cmd /c

set _color="..\..\bin\cocolor.exe"
set sleep="..\..\bin\wait.exe"
set rm=rmdir /s /q

set adb="..\..\bin\adb.exe"
set adbKill="%adb% kill-server
set adbStart="%adb% start-server
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





:loop


:: Try ROOT Commands
%_color% 0b
echo.
echo.
echo.
echo Trying ROOT Commands....
echo.
echo.
echo.
echo Attempting To Clear Cache and Remove OTA BIN Files....
echo.
echo.
echo.
echo.

:: Request SU Permission
%shell% "su"
%shell% "su"
%shell% "su"
%shell% "su"

:: Clear Cache and Update BIN Files
%shell% "su -c rm -f /cache/*.bin"
%shell% "su -c rm -f /cache/*.*"
::%shell% "su -c rm -f /cache/recovery/*.*"
::%shell% "su -c rm -f /cache/dalvik-cache/*.*"

%shell% "su -c busybox rm -f /cache/*.bin"
%shell% "su -c busybox rm -f /cache/*.*"

%shell% "su -c /system/bin/busybox rm -f /cache/*.bin"
%shell% "su -c /system/bin/busybox rm -f /cache/*.*"

%shell% "su -c /system/xbin/busybox rm -f /cache/*.bin"
%shell% "su -c /system/xbin/busybox rm -f /cache/*.*"

%shell% "su -c /data/local/busybox rm -f /cache/*.bin"
%shell% "su -c /data/local/busybox rm -f /cache/*.*"

%shell% "su -c chmod 777 /cache/"
%shell% "su -c chmod 777 /cache/recovery/"

echo.
echo.
echo.
echo Attempting To Disable Amazon OTA Updates....
echo.
echo.

%shell% "su -c pm hide com.amazon.dcp"
%shell% "su -c pm hide com.amazon.settings.systemupdates/.OTAEventReceiver"
%shell% "su -c pm hide com.amazon.device.software.ota"
%shell% "su -c pm hide com.amazon.device.software.ota.override"
%shell% "su -c pm hide com.amazon.tv.nimh"

%shell% "su -c pm disable com.amazon.dcp"
%shell% "su -c pm disable com.amazon.settings.systemupdates/.OTAEventReceiver"
%shell% "su -c pm disable com.amazon.device.software.ota"
%shell% "su -c pm disable com.amazon.device.software.ota.override"
%shell% "su -c pm disable com.amazon.tv.nimh"

%sleep% 1


:: Try USER Commands
%_color% 0e
echo.
echo.
echo.
echo Trying USER Commands....
echo.
echo.
echo.
echo Attempting To Clear Cache and Remove OTA BIN Files....
echo.
echo.
%shell% "rm -f /cache/*.bin"
%shell% "rm -f /cache/*.*"
::%shell% "rm -f /cache/recovery/*.*"
::%shell% "rm -f /cache/dalvik-cache/*.*"

%shell% "busybox rm -f /cache/*.bin"
%shell% "busybox rm -f /cache/*.*"

%shell% "/system/bin/busybox rm -f /cache/*.bin"
%shell% "/system/bin/busybox rm -f /cache/*.*"

%shell% "/system/xbin/busybox rm -f /cache/*.bin"
%shell% "/system/xbin/busybox rm -f /cache/*.*"

%shell% "/data/local/busybox rm -f /cache/*.bin"
%shell% "/data/local/busybox rm -f /cache/*.*"

%shell% "chmod 777 /cache/"
%shell% "chmod 777 /cache/recovery/"

echo.
echo.
echo.
echo Attempting To Disable Amazon OTA Updates....
echo.
echo.
%shell% "pm hide com.amazon.dcp"
%shell% "pm hide com.amazon.settings.systemupdates/.OTAEventReceiver"
%shell% "pm hide com.amazon.device.software.ota"
%shell% "pm hide com.amazon.device.software.ota.override"
%shell% "pm hide com.amazon.tv.nimh"

%shell% "pm disable com.amazon.dcp"
%shell% "pm disable com.amazon.settings.systemupdates/.OTAEventReceiver"
%shell% "pm disable com.amazon.device.software.ota"
%shell% "pm disable com.amazon.device.software.ota.override"
%shell% "pm disable com.amazon.tv.nimh"

%sleep% 1


goto loop


:end

