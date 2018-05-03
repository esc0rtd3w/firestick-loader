@echo off

:reset

title Check For Root Script  [esc0rtd3w]

color 0e

set sleep="%~dp0bin\wait.exe"

set adb="..\..\bin\adb.exe"

set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell


:: Clean Before Checking
if exist "%temp%\rootAccess.txt" del /f /q "%temp%\rootAccess.txt"


%push% "..\check-root.sh" /data/local/tmp/
%shell% "chmod 777 /data/local/tmp/check-root.sh"
%shell% "sh /data/local/tmp/check-root.sh"

%pull% /sdcard/rootAccess.txt "%temp%"


for /f "tokens=* delims=*" %%r in ('type "%temp%\rootAccess.txt"') do set rootStatus=%%r


%sleep% 2


:: Remove Temp File On SD Card
%shell% "rm /sdcard/rootAccess.txt"

cls
echo Root Status: %rootStatus%
echo.
echo.

pause


:: Remove Temp File After Main Menu Checks Root Status
if exist "%temp%\rootAccess.txt" del /f /q "%temp%\rootAccess.txt"


:end

