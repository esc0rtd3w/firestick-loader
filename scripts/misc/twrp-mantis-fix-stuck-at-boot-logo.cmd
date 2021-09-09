@echo off

:: Source 
:: https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-tv-stick-4k-mantis.3978459/page-66#post-84572515

:: idme \print
:: idme copy KB /dev/block/platform/soc/11230000.mmc/by-name/kb
:: idme copy DKB /dev/block/platform/soc/11230000.mmc/by-name/dkb

color 0e

set adb="..\..\bin\adb.exe"
set wait="..\..\bin\wait.exe"
set shell=%adb% shell
set idme=%shell% idme

echo This will attempt to automate the process over adb...
echo.
echo These commands can also be ran manually from TWRP Advanced Terminal
echo.
echo.
echo idme \print
echo idme copy KB /dev/block/platform/soc/11230000.mmc/by-name/kb
echo idme copy DKB /dev/block/platform/soc/11230000.mmc/by-name/dkb
echo.
echo.
echo.
echo Press any key to attempt automated method...
echo.
pause>nul
echo.
%shell% "mount -o rw /system"
%wait% 3

%idme% \print
%wait% 3
echo.
echo.
%idme% copy KB /dev/block/platform/soc/11230000.mmc/by-name/kb
%wait% 3
echo.
echo.
%idme% copy DKB /dev/block/platform/soc/11230000.mmc/by-name/dkb
%wait% 3

echo.
echo.
echo Check For Successful Write!
echo.
pause

:end







