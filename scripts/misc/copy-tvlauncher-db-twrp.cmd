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
%shell% "mkdir /data/data/awe.dev.pro.tv/"
%shell% "chmod 0755 /data/data/awe.dev.pro.tv/"
%shell% "mkdir /data/data/awe.dev.pro.tv/databases/"
%shell% "chmod 0755 /data/data/awe.dev.pro.tv/databases/"
%shell% "cp /data/local/tmp/tvlauncher_four.db /data/data/awe.dev.pro.tv/databases/tvlauncher_four.db"
%shell% "chmod 0644 /data/data/awe.dev.pro.tv/databases/tvlauncher_four.db"
%shell% "chown root:root /data/data/awe.dev.pro.tv/databases/tvlauncher_four.db"

echo.
echo Success if not output or error!
echo.
pause



:end



