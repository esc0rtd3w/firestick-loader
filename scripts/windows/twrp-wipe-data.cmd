@echo off

color 0e

set adb="..\..\bin\adb.exe"
set shell=%adb% shell
set twrp=%shell% twrp

set verify=0

cls
echo Enter 1 To Wipe Data Partition and Press ENTER:
echo.

set /p verify=

if %verify%==0 goto end

set verify=0
cls
echo Re-Verify Action
echo.
echo Enter 1 To Wipe Data Partition and Press ENTER:
echo.

set /p verify=

if %verify%==0 goto end

%twrp% wipe data


:end



