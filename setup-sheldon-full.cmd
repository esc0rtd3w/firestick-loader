@echo off

title Non-Root Debloat Script For Sheldon


set adb="bin\adb.exe"
set shell=%adb% shell sh
set push=%adb% push
set install=%adb% install


color 0e

cls
echo The sheldon device will only install an alternative Home Menu and debloat using non-root method for now
echo.
echo.
pause


cls
echo Installing Home Menu...
echo.
echo.
%install% apps\home\atv-launcher.apk


set enable=0
cls
echo Pushing and Executing Script...
echo.
echo.
echo Press 1 to ENABLE Bloat
echo.

set /p enable=

if %enable%==1 goto enable

%push% scripts\debloat\bloat-disable-noroot.sh /data/local/tmp/
%shell% chmod 777 /data/local/tmp/bloat-disable-noroot.sh
%shell% /data/local/tmp/bloat-disable-noroot.sh

goto end

:enable
%push% scripts\debloat\bloat-enable-noroot.sh /data/local/tmp/
%shell% chmod 777 /data/local/tmp/bloat-enable-noroot.sh
%shell% /data/local/tmp/bloat-enable-noroot.sh



:end



