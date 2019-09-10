@echo off

color 0e


set adb="..\..\bin\adb.exe"
set adbKill="%~dp0bin\adb.exe" kill-server
set adbStart="%~dp0bin\adb.exe" start-server
set adbWait=%adb% wait-for-device

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell


set db=0

cls
echo Enter Source File Path or Drop File and Press ENTER:
echo.
echo.

set /p db=

%push% %db% /data/local/tmp/
%shell% "mkdir /data/data/"
%shell% "mkdir /data/data/ca.dstudio.atvlauncher.pro/"
%shell% "chmod 0755 /data/data/ca.dstudio.atvlauncher.pro/"
%shell% "mkdir /data/data/ca.dstudio.atvlauncher.pro/databases/"
%shell% "chmod 0755 /data/data/ca.dstudio.atvlauncher.pro/databases/"
%shell% "cp /data/local/tmp/sections.db /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db"
%shell% "chmod 0644 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db"
%shell% "chown root:root /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db"

echo.
echo Success if not output or error!
echo.
pause



:end



