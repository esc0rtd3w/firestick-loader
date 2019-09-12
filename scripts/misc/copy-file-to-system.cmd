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

set /p src=
for /r %%a in (type %src%) do (
set name=%%~nxa
)
set temp=/data/local/tmp/%name%

cls
echo Source: %src%
echo Device Source: %temp%
echo.
echo Enter Destination File Path and Press ENTER:
echo.
echo.

set /p dest=

cls
echo Source: %src%
echo Device Source: %temp%
echo Destination: %dest%
echo.
echo Enter Permissions For Directory and Press ENTER:
echo.
echo Default 0755
echo.

set perm_dir=0755
set /p perm_dir=

cls
echo Source: %src%
echo Device Source: %temp%
echo Destination: %dest%
echo Permissions Directory: %perm_dir%
echo.
echo Enter Permissions For File and Press ENTER:
echo.
echo Default 0644
echo.

set perm_file=0644
set /p perm_file=

cls
echo Source: %src%
echo Device Source: %temp%
echo Destination: %dest%
echo Permissions Directory: %perm_dir%
echo Permissions File: %perm_file%
echo.
echo Enter User and Press ENTER:
echo.
echo Default root
echo.

set user=root
set /p user=

cls
echo Source: %src%
echo Device Source: %temp%
echo Destination: %dest%
echo Permissions Directory: %perm_dir%
echo Permissions File: %perm_file%
echo User: %user%
echo.
echo %shell% "su -c sh /data/local/tmp/copy-file-to-system.sh %temp% %dest%%name% %perm_dir% %perm_file% %user%"
echo.
echo Check Above Variables and Press ENTER:
echo.

pause>nul

%push% "%src%" /data/local/tmp/%temp%
%push% "..\copy-file-to-system.sh" /data/local/tmp/
%shell% "su -c chmod 777 /data/local/tmp/copy-file-to-system.sh"
%shell% "su -c sh /data/local/tmp/copy-file-to-system.sh %temp% %dest%%name% %perm_dir% %perm_file% %user%"


:end



