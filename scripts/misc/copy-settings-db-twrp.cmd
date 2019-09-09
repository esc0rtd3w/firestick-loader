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


set src=0

cls
echo Enter Source File Path or Drop File and Press ENTER:
echo.
echo.

set /p db=

%push% %db% /data/local/tmp/
%shell% "mkdir /data/data/"
%shell% "mkdir /data/data/com.android.providers.settings/"
%shell% "mkdir /data/data/com.android.providers.settings/databases/"
%shell% "cp /data/local/tmp/settings.db /data/data/com.android.providers.settings/databases/settings.db"

echo.
echo Success if not output or error!
echo.
pause



:end



