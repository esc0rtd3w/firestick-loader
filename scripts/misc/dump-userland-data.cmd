@echo off

color 0e

set _color="%cd%\bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="..\..\bin\adb.exe"

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set dd=%shell% "su -c dd

set blockBase=/dev/block/platform/sdhci.1/by-name

set dumpFolder="%temp%\firestick-loader\userDump"

set swipeUp=%shell% input swipe 200 900 200 300
set keyEnter=%shell% input keyevent 66
set keyTab=%shell% input keyevent 61


set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

%push% "..\..\bin\android\busybox" /data/local/tmp/


if exist %dumpFolder% rd /q /s %dumpFolder%

%sleep% 2

mkdir %dumpFolder%

cls
echo.
echo.
echo.
echo Dumping build.prop....
echo.
echo.

%shell% "cp /system/build.prop /sdcard/"
%pull% %sdcard%/build.prop %dumpFolder%
%shell% rm %sdcard%/build.prop

echo.
echo.
echo.
echo Dumping APK List....
echo.
echo.

%shell% "pm list package>>/sdcard/pm-list-packages-5.2.1.2.txt"
%pull% %sdcard%/pm-list-packages-5.2.1.2.txt %dumpFolder%
%shell% rm %sdcard%/pm-list-packages-5.2.1.2.txt

echo.
echo.
echo.
echo Dumping Processes....
echo.
echo.

%shell% "ps>>/sdcard/process-list-5.2.1.2.txt"
%pull% %sdcard%/process-list-5.2.1.2.txt %dumpFolder%
%shell% rm %sdcard%/process-list-5.2.1.2.txt

echo.
echo.
echo.
echo Dumping Services List....
echo.
echo.

%shell% "service list>>/sdcard/services-list-5.2.1.2.txt"
%pull% %sdcard%/services-list-5.2.1.2.txt %dumpFolder%
%shell% rm %sdcard%/services-list-5.2.1.2.txt

::echo.
::echo.
::echo.
::echo Dumping APK Activites....
::echo.
::echo.

::%shell% "dumpsys package>>/sdcard/dumpsys-packages-5.2.1.2.txt"
::%pull% %sdcard%/dumpsys-packages-5.2.1.2.txt %dumpFolder%
::%shell% rm %sdcard%/dumpsys-packages-5.2.1.2.txt

echo.
echo.
echo.
echo Dumping Full dumpsys Info....
echo.
echo.

%push% "..\dumpsys.sh" /data/local/tmp/
%shell% "chmod 775 /data/local/tmp/dumpsys.sh"
%shell% "sh /data/local/tmp/dumpsys.sh"
%pull% %sdcard%/dumpsys-summary-5.2.1.2.txt %dumpFolder%
%pull% %sdcard%/dumpsys-full-5.2.1.2.txt %dumpFolder%
%shell% rm %sdcard%/dumpsys-summary-5.2.1.2.txt
%shell% rm %sdcard%/dumpsys-full-5.2.1.2.txt





::echo.
::echo.
::echo.
::echo Dumping Root Path Directory Tree....
::echo.
::echo.

::%shell% "chmod 775 /data/local/tmp/busybox"
::%shell% "ls -l />>/sdcard/root-directory-tree.txt"
::%shell% "ls -l /system">>/sdcard/root-directory-tree.txt"
::%pull% %sdcard%/root-directory-tree-5.2.1.2.txt %dumpFolder%
::%shell% rm %sdcard%/root-directory-tree-5.2.1.2.txt


start "" explorer %dumpFolder%

echo.
echo.
echo.
echo Press a key to exit....
echo.
echo.
pause>nul

:end



