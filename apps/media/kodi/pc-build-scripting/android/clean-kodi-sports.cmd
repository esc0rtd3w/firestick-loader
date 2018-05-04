@echo off


set adb="..\..\..\bin\adb.exe"
set adbWait=%adb% wait-for-device

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set sdcard=sdcard

set pathAndroid=Android/data/org.xbmc.kodi/files/.kodi
set pathIOS=private/var/mobile/Library/Preferences/Kodi
set pathMac=Users/USER_NAME_HERE/Library/Application Support/Kodi
set pathLinux=~/.kodi
set pathWindows=%AppData%\Kodi




cls
echo Cleaning Sports Addons From Kodi....
echo.
echo.
echo.

%shell% rm -r %pathAndroid%/addons/plugin.video.ChampionSports
%shell% rm -r %pathAndroid%/addons/plugin.video.DCSports
%shell% rm -r %pathAndroid%/addons/plugin.video.MoneySports
%shell% rm -r %pathAndroid%/addons/plugin.video.NBA
%shell% rm -r %pathAndroid%/addons/plugin.video.NHLVideo
%shell% rm -r %pathAndroid%/addons/plugin.video.NJMSoccer
%shell% rm -r %pathAndroid%/addons/plugin.video.SportsDevil
%shell% rm -r %pathAndroid%/addons/plugin.video.UFC
%shell% rm -r %pathAndroid%/addons/plugin.video.adriansports
%shell% rm -r %pathAndroid%/addons/plugin.video.all_wrestling
%shell% rm -r %pathAndroid%/addons/plugin.video.espn_3
%shell% rm -r %pathAndroid%/addons/plugin.video.extreme.com
%shell% rm -r %pathAndroid%/addons/plugin.video.fcs
%shell% rm -r %pathAndroid%/addons/plugin.video.motorstv.com
%shell% rm -r %pathAndroid%/addons/plugin.video.nbaondemand
%shell% rm -r %pathAndroid%/addons/plugin.video.nbcsn
%shell% rm -r %pathAndroid%/addons/plugin.video.nbcsnliveextra
%shell% rm -r %pathAndroid%/addons/plugin.video.nfl-teams
%shell% rm -r %pathAndroid%/addons/plugin.video.nfl.com
%shell% rm -r %pathAndroid%/addons/plugin.video.nhlondemand
%shell% rm -r %pathAndroid%/addons/plugin.video.nhlstreams
%shell% rm -r %pathAndroid%/addons/plugin.video.p2psport
%shell% rm -r %pathAndroid%/addons/plugin.video.prosport
%shell% rm -r %pathAndroid%/addons/plugin.video.redbull.tv
%shell% rm -r %pathAndroid%/addons/plugin.video.si
%shell% rm -r %pathAndroid%/addons/plugin.video.speedway
%shell% rm -r %pathAndroid%/addons/plugin.video.sportcenterhd
%shell% rm -r %pathAndroid%/addons/plugin.video.sportsmix
%shell% rm -r %pathAndroid%/addons/plugin.video.spoxtv
%shell% rm -r %pathAndroid%/addons/plugin.video.superreplays
%shell% rm -r %pathAndroid%/addons/plugin.video.youtube.ufc
%shell% rm -r %pathAndroid%/addons/plugin.video.youtube.wwe
%shell% rm -r %pathAndroid%/addons/repository.adriansports


echo.
echo.
echo.
echo Cleaning Sports User Data From Kodi....
echo.
echo.
echo.

%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.ChampionSports
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.DCSports
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.MoneySports
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.NBA
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.NHLVideo
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.NJMSoccer
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.SportsDevil
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.UFC
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.adriansports
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.all_wrestling
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.espn_3
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.extreme.com
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.fcs
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.motorstv.com
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.nbaondemand
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.nbcsn
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.nbcsnliveextra
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.nfl-teams
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.nfl.com
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.nhlondemand
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.nhlstreams
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.p2psport
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.prosport
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.redbull.tv
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.si
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.speedway
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.sportcenterhd
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.sportsmix
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.spoxtv
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.superreplays
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.youtube.ufc
%shell% rm -r %pathAndroid%/userdata/addon_data/plugin.video.youtube.wwe
%shell% rm -r %pathAndroid%/userdata/addon_data/repository.adriansports


:end







