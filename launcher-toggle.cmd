@echo off

title Non-Root Debloat Script For Sheldon


set adb="bin\adb.exe"
set shell=%adb% shell sh
set push=%adb% push
set install=%adb% install


color 0e

cls
echo Pushing and Executing Script...
echo.
echo.


set state=e
cls
echo Pushing and Executing Script...
echo.
echo.
echo Enable or Disable Launcher and OTA [E/D]?
echo.
echo.
set /p state=

if %state%==d %push% scripts\debloat\bloat-disable-launcher-noroot.sh /data/local/tmp/bloat-disable-launcher-noroot.sh
if %state%==D %push% scripts\debloat\bloat-disable-launcher-noroot.sh /data/local/tmp/bloat-disable-launcher-noroot.sh
if %state%==d %shell% chmod 777 /data/local/tmp/bloat-disable-launcher-noroot.sh
if %state%==D %shell% chmod 777 /data/local/tmp/bloat-disable-launcher-noroot.sh
if %state%==d %shell% /data/local/tmp/bloat-disable-launcher-noroot.sh
if %state%==D %shell% /data/local/tmp/bloat-disable-launcher-noroot.sh


if %state%==e %push% scripts\debloat\bloat-enable-launcher-noroot.sh /data/local/tmp/bloat-enable-launcher-noroot.sh
if %state%==E %push% scripts\debloat\bloat-enable-launcher-noroot.sh /data/local/tmp/bloat-enable-launcher-noroot.sh
if %state%==e %shell% chmod 777 /data/local/tmp/bloat-enable-launcher-noroot.sh
if %state%==E %shell% chmod 777 /data/local/tmp/bloat-enable-launcher-noroot.sh
if %state%==e %shell% /data/local/tmp/bloat-enable-launcher-noroot.sh
if %state%==E %shell% /data/local/tmp/bloat-enable-launcher-noroot.sh


:end



