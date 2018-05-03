set file=%1

@echo off

color 0e


set adb="..\..\bin\adb.exe"


set push=%adb% push
set shell=%adb% shell
set devices=%adb% devices

set twrpMainDir=/sdcard/TWRP
set twrpBackupDir=/sdcard/TWRP/BACKUPS
set twrpDirNewFolderName=

cls

for /f "tokens=* delims=*" %%s in ('%devices%') do set serialNumberTemp=%%s

setlocal enableDelayedExpansion
set "serialNumber=%serialNumberTemp%"
for /f "tokens=* delims=*" %%s in ('%devices%')  do set "serialNumber=!serialNumber:%%a=!"
echo %serialNumber:~0,16%>"%temp%\__serialNumber.txt"
endlocal


set /p serialNumber=<"%temp%\__serialNumber.txt"

%sleep% 2

del /f /q "%temp%\__serialNumber.txt"

:menu

set twrpDirNew=0

cls
%devices%
echo.
echo.
echo.
echo.
echo Drag Backup Folder Into This Window and Press ENTER:
echo.
echo.
echo Device Serial Number: %serialNumber%
echo.
echo.
echo ** MAKE SURE THE DISPLAYED SERIAL NUMBER MATCHES ABOVE ADB OUTPUT **
echo.
echo.
echo.
echo.

set /p twrpDirNew=

if %twrpDirNew%==0 goto menu

:: Get Folder Name Only
set twrpDirNewTemp=%twrpDirNew%
set twrpDirNewTemp=%twrpDirNewTemp:\=,%
for %%a in (%twrpDirNewTemp%) do set "twrpDirNewFolderName=%%a"



cls
echo Copying To Device
echo.
echo.
echo Source: 
echo %twrpDirNew%
echo.
echo Destination:
echo %twrpBackupDir%/%serialNumber%/%twrpDirNewFolderName%
echo.
echo.
echo.
echo.

%shell% "mkdir %twrpMainDir%"
%shell% "mkdir %twrpBackupDir%"
%shell% "mkdir %twrpBackupDir%/%serialNumber%"
%shell% "mkdir %twrpBackupDir%/%serialNumber%/%twrpDirNewFolderName%"

%push% %twrpDirNew% %twrpBackupDir%/%serialNumber%/%twrpDirNewFolderName%




:end



