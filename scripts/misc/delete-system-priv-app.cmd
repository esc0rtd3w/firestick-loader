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


cls
set name=0

cls
echo Type Name of Package Name (NO SPACES) You Want and Press ENTER:
echo.
echo.

set /p name=


%push% "%apk%" /data/local/tmp/temp.apk
%push% "..\delete-system-priv-app.sh" /data/local/tmp/
%shell% "su -c chmod 777 /data/local/tmp/delete-system-priv-app.sh"
%shell% "su -c sh /data/local/tmp/delete-system-priv-app.sh %name%"


:end



