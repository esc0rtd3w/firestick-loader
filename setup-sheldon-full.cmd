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


cls
echo Pushing and Executing Script...
echo.
echo.

%push% scripts\debloat\bloat-disable-noroot.sh /data/local/tmp/
%shell% chmod 777 /data/local/tmp/bloat-disable-noroot.sh
%shell% /data/local/tmp/bloat-disable-noroot.sh



:end



