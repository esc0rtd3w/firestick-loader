@echo off

color 0e

set _color="%cd%\bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="..\..\bin\adb.exe"

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard


%shell% "su -c mkdir /system/restore/"
%shell% "su -c chmod 0755 /system/restore/"
::%shell% "su -c cp -r /data/data/ca.dstudio.atvlauncher.pro/ /system/restore/"
::%shell% "su -c cp -r /data/data/com.adamioan.scriptrunner/ /system/restore/"
::%shell% "su -c cp -r /data/data/com.fluxii.android.mousetoggleforfiretv/ /system/restore/"
%shell% "su -c cp -r /sdcard/restore/TitaniumBackup/ /system/restore/"
::%shell% "su -c chmod 0755 /system/restore/ca.dstudio.atvlauncher.pro"
::%shell% "su -c chmod 0755 /system/restore/com.adamioan.scriptrunner"
::%shell% "su -c chmod 0755 /system/restore/com.fluxii.android.mousetoggleforfiretv"

echo.
echo.
echo.
echo Press a key to exit....
echo.
echo.
pause>nul

:end



