@echo off

:reset

color 0a

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


set kodiPath=/%sdcard%/Android/data/org.xbmc.kodi/files/.kodi

title Kodi Adult Profile and Addon Remover for Android                                          esc0rtd3w 2016


:: Remove Directory Under Profiles
::%shell% "su -c rm -f %kodiPath%/userdata/profiles/Adults Only"
%shell% "rm -r %kodiPath%/userdata/profiles/Adults Only"

:: Remove Addon Directories
%shell% "rm -r %kodiPath%/addons/repository.xxxadultxbmc"
%shell% "rm -r %kodiPath%/addons/repository.xbmcadult"

%shell% "rm -r %kodiPath%/addons/plugin.video.empflix"
%shell% "rm -r %kodiPath%/addons/plugin.video.fantasticc"
%shell% "rm -r %kodiPath%/addons/plugin.video.hotgoo"
%shell% "rm -r %kodiPath%/addons/plugin.video.largecamtube"
%shell% "rm -r %kodiPath%/addons/plugin.video.lubetube"
%shell% "rm -r %kodiPath%/addons/plugin.video.tube8"
%shell% "rm -r %kodiPath%/addons/plugin.video.uwc"
%shell% "rm -r %kodiPath%/addons/plugin.video.videodevil"
%shell% "rm -r %kodiPath%/addons/plugin.video.wildfire"
%shell% "rm -r %kodiPath%/addons/plugin.video.woodrocket"
%shell% "rm -r %kodiPath%/addons/plugin.video.you.jizz"


:: Overwrite Profiles XML
::%push% "profiles-default.xml" %kodiPath%/userdata/profiles.xml
%push% "xml\profiles-no-adult.xml" %kodiPath%/userdata/profiles.xml










:end