@echo off

:reset

set adb="..\..\..\bin\adb.exe"
set adbWait=%adb% wait-for-device

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard


title Kodi Log Viewer for Android                                          esc0rtd3w 2016

%pull% /%sdcard%/Android/data/org.xbmc.kodi/files/.kodi/temp/kodi.log %cd%



:end