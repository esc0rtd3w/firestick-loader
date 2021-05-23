@echo off

color 0e


set adb="..\..\bin\adb.exe"


set pull=%adb% pull
set shell=%adb% shell



cls

mkdir "%temp%\firestick-loader"
mkdir "%temp%\firestick-loader\oobe-and-settings"
mkdir "%temp%\firestick-loader\oobe-and-settings\data"

%shell% "su -c mount -o rw /system"

%shell% "rm -r /sdcard/com.amazon.tv.oobe/"
%shell% "rm -r /sdcard/com.amazon.tv.settings.core/"
%shell% "rm -r /sdcard/com.amazon.tv.settings.v2/"
%shell% "rm -r /sdcard/com.amazon.device.settings/"

%shell% "su -c cp -R /data/data/com.amazon.tv.oobe/ /sdcard/"
%shell% "su -c cp -R /data/data/com.amazon.tv.settings.core/ /sdcard/"
%shell% "su -c cp -R /data/data/com.amazon.tv.settings.v2/ /sdcard/"

%pull% /sdcard/com.amazon.tv.oobe/ "%temp%\firestick-loader\oobe-and-settings\data\com.amazon.tv.oobe"
%pull% /sdcard/com.amazon.tv.settings.core/ "%temp%\firestick-loader\oobe-and-settings\data\com.amazon.tv.settings.core"
%pull% /sdcard/com.amazon.tv.settings.v2/ "%temp%\firestick-loader\oobe-and-settings\data\com.amazon.tv.settings.v2"
%pull% /sdcard/com.amazon.device.settings/ "%temp%\firestick-loader\oobe-and-settings\data\com.amazon.device.settings"

%shell% "rm -r /sdcard/com.amazon.tv.oobe/"
%shell% "rm -r /sdcard/com.amazon.tv.settings.core/"
%shell% "rm -r /sdcard/com.amazon.tv.settings.v2/"
%shell% "rm -r /sdcard/com.amazon.device.settings/"


start "" explorer "%temp%\firestick-loader\oobe-and-settings"

::pause

:end



