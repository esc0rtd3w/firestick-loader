@echo off

title Install OS Full Setup Script For [Montoya] [Tank] [Mantis]

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

:: Default Device ID (stick, stick2, stick3, etc)
set devicePathID=0

:: Default OS Version (5.2.7.2, 6.2.7.2, lineageos, etc)
set romFileVersion=0

set romFileStockCompressed=0
set romFileStock=0
set romFileLineage=0
set romFileGapps=0

:: Stock or LineageOS
set osType=0

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


cls
%cocolor% 0a
echo TWRP Found!
echo.
%cocolor% 0b
echo Device: %fireOsDevice% / Firmware Version: %fireOsVersion%
echo.
echo.
pause

goto checkDevice


:checkDevice
cls
echo Checking Device...
echo.

:: Default Rom Images Montoya 1st Gen
if %fireOsDevice%==montoya (
	set romFileVersionMontoya=5.2.7.2
	set romFileStockCompressedMontoya=5.2.7.2-stock-rooted.split
	set romFileStockMontoya=montoya-5.2.7.2-rooted_r1.zip
	set romFileLineageMontoya=none
	set romFileGappsMontoya=none
	set romFileStockCompressed=%romFileStockCompressedMontoya%
	set romFileStock=%romFileStockMontoya%
	set romFileLineage=%romFileLineageMontoya%
	set romFileGapps=%romFileGappsMontoya%
	set osType=stock
	goto menuMontoya
)

:: Default Rom Images Tank 2nd Gen
if %fireOsDevice%==tank (
	set romFileVersionTank=5.2.7.2
	set romFileStockCompressedTank=5.2.7.2-stock-rooted.split
	set romFileStockTank=tank-5.2.7.2-rooted_r3.zip
	set romFileLineageCompressedTank=lineageos-tank.split
	set romFileLineageTank=lineageos-tank.zip
	set romFileSGappsTank=gapps-tank.zip
	set romFileStockCompressed=%romFileLineageCompressedTank%
	set romFileStock=%romFileStockTank%
	set romFileLineage=%romFileLineageTank%
	set romFileGapps=%romFileSGappsTank%
	set osType=lineageos
	goto menuTank
)

:: Default Rom Images Mantis 3rd Gen
if %fireOsDevice%==mantis (
	set romFileVersionMantis=6.2.7.1
	set romFileStockCompressedMantis=6.2.7.1-stock-rooted.split
	set romFileStockMantis=mantis-6.2.7.1-rooted_r1.zip
	set romFileLineageMantis=none
	set romFileGappsMantis=none
	set romFileStockCompressed=%romFileStockCompressedMantis%
	set romFileStock=%romFileStockMantis%
	set romFileLineage=%romFileLineageMantis%
	set romFileGapps=%romFileGappsMantis%
	set osType=stock
	goto menuMantis
)

:: Default Navigation if no match
goto nocompat

:menuMain
cls
%cocolor% 0a
echo TWRP Found!
echo.
%cocolor% 0b
echo Device: %fireOsDevice% / Firmware Version: %fireOsVersion%
echo.
echo.

:menuMontoya
set devicePathID=stick
%cocolor% 0e
echo Test Menu For [Montoya]
echo.
echo.
echo Detected Device: %fireOsDevice%
echo.
echo Rom Path ID: %devicePathID%
echo.
pause
goto stage1


:menuTank
set devicePathID=stick2
%cocolor% 0e
echo Test Menu For [Tank]
echo.
echo.
echo Detected Device: %fireOsDevice%
echo.
echo Rom Path ID: %devicePathID%
echo.
pause
goto stage1


:menuMantis
set devicePathID=stick3
%cocolor% 0e
echo Test Menu For [Mantis]
echo.
echo.
echo Detected Device: %fireOsDevice%
echo.
echo Rom Path ID: %devicePathID%
echo.
pause
goto stage1


:nocompat
%cocolor% 0c
cls
echo CANNOT continue!
echo.
echo This device is %fireOsDevice%
echo.
echo Rom Path ID: %devicePathID%
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

:: Check for any device issues
if %devicePathID%==0 goto nocompat
if %romFileVersion%==0 goto nocompat
if %romFileStockCompressed%==0 goto nocompat
if %osType%==0 goto nocompat


cls
echo Preparing OS Files...
echo.
if not exist "%temp%\firestick-loader\install\%devicePathID%\%romFileVersion%" md "%temp%\firestick-loader\install\%devicePathID%\%romFileVersion%"
%extractRAR% "install\%devicePathID%\%romFileVersion%\%romFileStockCompressed%" "%temp%\firestick-loader\install\%devicePathID%"

cls
echo Pushing OS Files to /sdcard/...
echo.

if %osType%==stock (
	%push% "%temp%\firestick-loader\install\%devicePathID%\%romFileStock%" /sdcard/
)

if %osType%==lineageos  (
	%push% "%temp%\firestick-loader\install\%devicePathID%\%romFileLineage%" /sdcard/
	%push% "%temp%\firestick-loader\install\%devicePathID%\%romFileGapps%" /sdcard/
)
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
%twrp% install /sdcard/%romFileLineage%
%twrp% install /sdcard/%romFileGapps%
%sleep% 5

cls
echo Cleaning Up Files...
echo.
rd /s /q "%temp%\firestick-loader\install\%devicePathID%"
%shell% "rm /sdcard/%romFileLineage%"
%shell% "rm /sdcard/%romFileGapps%"
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



