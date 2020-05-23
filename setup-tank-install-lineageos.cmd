@echo off

title Install LineageOS Full Setup Script For Tank

set debug=0
set fireOsVersion=0.0.0.0
set fireOsDevice=none
set downgrade=0

set adult=0
set adultCheck=0

set magiskZip=Magisk.zip

set adb="%~dp0bin\adb.exe"
set adbKill=%adb% kill-server
set adbStart=%adb% start-server
set adbWait=%adb% wait-for-device
set sleep="%~dp0bin\wait.exe"
set extractRAR="%~dp0bin\rar.exe" -y x
set cocolor="%~dp0bin\cocolor.exe"

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell
set twrp=%shell% twrp

if not exist "%temp%\firestick-loader" md "%temp%\firestick-loader"

:start
color 0e

:: Kill any adb instances before starting
%adbKill%

:: Set Flags For ADB Service and Unknown Sources
set adb_success=0
set unk_sources_success=0

:: TWRP Requirement
set twrp_available=0
cls
echo Looking For TWRP Recovery...
echo.
%pull% /twres/twrp "%temp%\firestick-loader"
%sleep% 2
if exist "%temp%\firestick-loader\twrp" set twrp_available=1
if %twrp_available%==1 goto intro
if %twrp_available%==0 goto twrpfail

:twrpfail
%cocolor% 0c
cls
echo TWRP Not Found!
echo.
echo Trying To Force Boot Into Recovery...
echo.
%sleep% 3
%adb% reboot recovery
%sleep% 25
goto start

:intro
:: Reset TWRP Flags
if %twrp_available%==1 del /f /q "%temp%\firestick-loader\twrp"
if %twrp_available%==1 set twrp_available=0

color 0e
set rwcheck=0
cls
echo.
echo Mounting System To Check Device Settings...
echo.
%shell% "mount -o rw /system"

echo.
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 echo.
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot recovery
if %rwcheck%==1 %sleep% 25
if %rwcheck%==1 goto intro

:: Get FireOS Info
%shell% "cat /system/build.prop | grep ro.build.version.name>/sdcard/fireos-version.txt"
%pull% /sdcard/fireos-version.txt "%temp%"

%shell% "cat /system/build.prop | grep ro.product.device=>/sdcard/fireos-device.txt"
%pull% /sdcard/fireos-device.txt "%temp%"

for /f "tokens=3 delims= " %%f in ('type "%temp%\fireos-version.txt"') do set fireOsVersion=%%f
for /f "tokens=2 delims==" %%f in ('type "%temp%\fireos-device.txt"') do set fireOsDevice=%%f
%sleep% 1
%shell% "rm /sdcard/fireos-version.txt"
%shell% "rm /sdcard/fireos-device.txt"

if not %fireOsDevice%==tank goto notank


cls
%cocolor% 0a
echo TWRP Found!
echo.
%cocolor% 0b
echo Device: %fireOsDevice% / Firmware Version: %fireOsVersion%
echo.
echo.
pause

goto stage1

:notank
%cocolor% 0c
cls
echo Supports Tank Only!
echo.
echo This device is %fireOsDevice% and CANNOT continue!
echo.
pause
goto end


:stage1
cls
echo.
echo Mounting System as RW for System Install...
echo.
%twrp% remountrw /system

echo.
echo Check For RW Mount Status
echo.
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 echo.
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot recovery
if %rwcheck%==1 %sleep% 25
if %rwcheck%==1 goto stage1

cls
echo Preparing LineageOS and Google Apps Zip Files
echo.
if not exist "%temp%\firestick-loader\install\stick2\lineageos" md "%temp%\firestick-loader\install\stick2\lineageos"
%extractRAR% "install\stick2\5.2.6.3\lineageos-tank.split" "%temp%\firestick-loader\install\stick2"

cls
echo Pushing LineageOS and Google Apps Zip Files to /sdcard/...
echo.
%push% "%temp%\firestick-loader\install\stick2\lineageos-tank.zip" /sdcard/
%push% "%temp%\firestick-loader\install\stick2\gapps-tank.zip" /sdcard/
%sleep% 2

cls
echo Wiping System, Data, and Cache...
echo.
%twrp% wipe /data
%twrp% wipe /system
%sleep% 5

cls
echo Installing LineageOS and Google Apps...
echo.
%twrp% install /sdcard/lineageos-tank.zip
%twrp% install /sdcard/gapps-tank.zip
%sleep% 5

cls
echo Cleaning Up Files...
echo.
rd /s /q "%temp%\firestick-loader\downgrade\stick2"
%shell% "rm /sdcard/lineageos-tank.zip"
%shell% "rm /sdcard/gapps-tank.zip"
%sleep% 5

cls
echo Installing Magisk...
echo.
%push% "rooting\%magiskZip%" /data/local/tmp/
%twrp% install /data/local/tmp/%magiskZip%
%sleep% 3

cls
echo Preparing For Reboot...
echo.
%sleep% 8

%adb% reboot
%sleep% 10
cls
echo Finished!
echo.
pause



:end



