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

set dumpFolder="%temp%\firestick-loader\partitions-dump"

set swipeUp=%shell% input swipe 200 900 200 300
set keyEnter=%shell% input keyevent 66
set keyTab=%shell% input keyevent 61


set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard


if exist %dumpFolder% rd /q /s %dumpFolder%
mkdir %dumpFolder%

echo.
echo.
echo.
echo Dumping boot Partition....
echo.
echo.

%dd% if=%blockBase%/boot of=/%sdcard%/boot.img"
%pull% %sdcard%/boot.img %dumpFolder%
%shell% rm %sdcard%/boot.img

echo.
echo.
echo.
echo Dumping cache Partition....
echo.
echo.

::%dd% if=%blockBase%/cache of=/%sdcard%/cache.img"
::%pull% %sdcard%/cache.img %dumpFolder%
::%shell% rm %sdcard%/cache.img

echo.
echo.
echo.
echo Dumping custom-cert Partition....
echo.
echo.

%dd% if=%blockBase%/custom-cert of=/%sdcard%/custom-cert.img"
%pull% %sdcard%/custom-cert.img %dumpFolder%
%shell% rm %sdcard%/custom-cert.img

echo.
echo.
echo.
echo Dumping diag Partition....
echo.
echo.

%dd% if=%blockBase%/diag of=/%sdcard%/diag.img"
%pull% %sdcard%/diag.img %dumpFolder%
%shell% rm %sdcard%/diag.img

echo.
echo.
echo.
echo Dumping dt-blob Partition....
echo.
echo.

%dd% if=%blockBase%/dt-blob of=/%sdcard%/dt-blob.img"
%pull% %sdcard%/dt-blob.img %dumpFolder%
%shell% rm %sdcard%/dt-blob.img

echo.
echo.
echo.
echo Dumping fbi Partition....
echo.
echo.

%dd% if=%blockBase%/fbi of=/%sdcard%/fbi.img"
%pull% %sdcard%/fbi.img %dumpFolder%
%shell% rm %sdcard%/fbi.img

echo.
echo.
echo.
echo Dumping goldpersist Partition....
echo.
echo.

%dd% if=%blockBase%/goldpersist of=/%sdcard%/goldpersist.img"
%pull% %sdcard%/goldpersist.img %dumpFolder%
%shell% rm %sdcard%/goldpersist.img

echo.
echo.
echo.
echo Dumping gpt Partition....
echo.
echo.

%dd% if=%blockBase%/gpt of=/%sdcard%/gpt.img"
%pull% %sdcard%/gpt.img %dumpFolder%
%shell% rm %sdcard%/gpt.img

echo.
echo.
echo.
echo Dumping loader Partition....
echo.
echo.

%dd% if=%blockBase%/loader of=/%sdcard%/loader.img"
%pull% %sdcard%/loader.img %dumpFolder%
%shell% rm %sdcard%/loader.img

echo.
echo.
echo.
echo Dumping misc Partition....
echo.
echo.

%dd% if=%blockBase%/misc of=/%sdcard%/misc.img"
%pull% %sdcard%/misc.img %dumpFolder%
%shell% rm %sdcard%/misc.img

echo.
echo.
echo.
echo Dumping mobicore Partition....
echo.
echo.

%dd% if=%blockBase%/mobicore of=/%sdcard%/mobicore.img"
%pull% %sdcard%/mobicore.img %dumpFolder%
%shell% rm %sdcard%/mobicore.img

echo.
echo.
echo.
echo Dumping persist Partition....
echo.
echo.

%dd% if=%blockBase%/persist of=/%sdcard%/persist.img"
%pull% %sdcard%/persist.img %dumpFolder%
%shell% rm %sdcard%/persist.img

echo.
echo.
echo.
echo Dumping recovery Partition....
echo.
echo.

%dd% if=%blockBase%/recovery of=/%sdcard%/recovery.img"
%pull% %sdcard%/recovery.img %dumpFolder%
%shell% rm %sdcard%/recovery.img

echo.
echo.
echo.
echo Dumping system Partition....
echo.
echo.

%dd% if=%blockBase%/system of=/%sdcard%/system.img"
%pull% %sdcard%/system.img %dumpFolder%
%shell% rm %sdcard%/system.img

echo.
echo.
echo.
echo Dumping u-boot Partition....
echo.
echo.

%dd% if=%blockBase%/u-boot of=/%sdcard%/u-boot.img"
%pull% %sdcard%/u-boot.img %dumpFolder%
%shell% rm %sdcard%/u-boot.img

echo.
echo.
echo.
echo Dumping u-boot-env Partition....
echo.
echo.

%dd% if=%blockBase%/u-boot-env of=/%sdcard%/u-boot-env.img"
%pull% %sdcard%/u-boot-env.img %dumpFolder%
%shell% rm %sdcard%/u-boot-env.img

echo.
echo.
echo.
echo Dumping userdata Partition....
echo.
echo.

::%dd% if=%blockBase%/userdata of=/%sdcard%/userdata.img"
::%pull% %sdcard%/userdata.img %dumpFolder%
::%shell% rm %sdcard%/userdata.img

echo.
echo.
echo.
echo Dumping vc-firmware Partition....
echo.
echo.

%dd% if=%blockBase%/vc-firmware of=/%sdcard%/vc-firmware.img"
%pull% %sdcard%/vc-firmware.img %dumpFolder%
%shell% rm %sdcard%/vc-firmware.img

echo.
echo.
echo.
echo Opening Dump Folder....
echo.
echo.


color 0a


start "" explorer %dumpFolder%


:end



