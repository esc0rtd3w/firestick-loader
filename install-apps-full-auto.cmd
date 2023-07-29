@echo off

set _color="%~dp0bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="%~dp0bin\adb.exe"

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set adbkill=%adb% kill-server

set pathAndroid=Android/data/org.xbmc.kodi/files/.kodi
set pathIOS=private/var/mobile/Library/Preferences/Kodi
set pathMac=Users/USER_NAME_HERE/Library/Application Support/Kodi
set pathLinux=~/.kodi
set pathWindows=%AppData%\Kodi

set apk=

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

set fireOsVersion==0.0.0.0

::set baddieStringOne="ro.build.version.name=Fire OS 5.0.5.1 (537175520)"
::set baddieStringTwo="ro.build.version.incremental=54.5.3.7_user_537175520"
::set baddieStringThree="ro.build.version.fireos=5.0.5.1"
set baddieStringOne=537175520
set baddieStringTwo=54.5.3.7_user_537175520
set baddieStringThree=5.0.5.1

:: Set This Flag To "0" For Original FireStarter (pre 5.0.5.1)
:: Set This Flag To "1" For New Firestopper (post 5.0.5.1)
set baddieFlagOne=0
set baddieFlagTwo=0

:: Set This Flag To "0" For Original Firestarter
set baddieFlagActive=0

set buildDotProp=/system/build.prop

%_color% 0e
%adbkill%

::cls
::%_color% 0e
::set appName=FirePwn Home
::set apk=
::echo Installing %appName%...
::echo.
::%install% "apps\home\FirePwnHome.apk"
::%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/

::cls
::%_color% 0e
::set appName=FirePwn Home Debug
::set apk=
::echo Installing %appName%...
::echo.
::%install% "apps\home\FirePwnHomeDebug.apk"
::%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/


set atvhomeInstall=n
cls
echo Install ATV Launcher as Home [User App] [Y/N]?
echo.
set /p atvhomeInstall=
if %atvhomeInstall%==n goto mtoggle
if %atvhomeInstall%==N goto mtoggle

cls
%_color% 0e
set appName=ATV Launcher [as User App] [4K]
set apk=
echo Installing %appName%...
echo.
%install% "apps\home\atv-launcher.apk"


:mtoggle
set mouseInstall=n
cls
echo Install Mouse Toggle [Y/N]?
echo.
set /p mouseInstall=
if %mouseInstall%==n goto adblockToggle
if %mouseInstall%==N goto adblockToggle

cls
%_color% 0e
set appName=Mouse Toggle
set apk=
echo Installing %appName%...
echo.
%install% "apps\utilities\mouse-toggle.apk"
::%install% "apps\utilities\mouse-toggle2.apk"
::%install% "apps\utilities\mouse-toggle3.apk"


:adblockToggle
set adguardInstall=n
cls
echo Install AdGuard [Y/N]?
echo.
set /p adguardInstall=
if %adguardInstall%==n goto adAwayToggle
if %adguardInstall%==N goto adAwayToggle

cls
%_color% 0e
set appName=AdGuard
set apk=
echo Installing %appName%...
echo.
%install% "apps\utilities\adguard.apk"


:adAwayToggle
set adawayInstall=n
cls
echo Install AdAway [ROOT] [Y/N]?
echo.
set /p adawayInstall=
if %adawayInstall%==n goto fmToggle
if %adawayInstall%==N goto fmToggle

cls
%_color% 0e
set appName=AdAway [ROOT]
set apk=
echo Installing %appName%...
echo.
%install% "apps\utilities\adaway.apk"


:fmToggle
set fmInstall=n
cls
echo Install Root Explorer [ROOT] [Y/N]?
echo.
set /p fmInstall=
if %fmInstall%==n goto kodiMain
if %fmInstall%==N goto kodiMain

cls
%_color% 0e
set appName=Root Explorer [ROOT]
set apk=
echo Installing %appName%...
echo.
%install% "apps\system\root-explorer.apk"

:: Skipping Kodi Install as of 20210627
goto appsMain

:kodiMain
set kodiInstall=n
cls
echo Install Kodi [Y/N]?
echo.
set /p kodiInstall=
if %kodiInstall%==n goto appsMain
if %kodiInstall%==N goto appsMain

cls
%_color% 0e
set appName=Kodi
set apk=
echo.
echo.
echo Installing %appName%...
echo.

set kodiBuild=default

set kodiVersion=17
cls
%_color% 0e
set appName=Kodi
echo Installing %appName%...
echo.
echo Select Version of Kodi and press ENTER:
echo.
echo Default: 17
echo.
echo.
echo 1) 16
echo.
echo 2) 17
echo.
echo 3) 18
echo.
set /p kodiVersion=

if %kodiVersion% gtr 3 goto kodimain

if %kodiVersion%==1 set kodiVersion=16
if %kodiVersion%==2 set kodiVersion=17
if %kodiVersion%==3 set kodiVersion=18

md "%temp%\firestick-loader\apps\media\kodi\data\%kodiVersion%\%kodiBuild%"
%extractRAR% "%~dp0apps\media\kodi\apk\%kodiVersion%\kodi.apk.split" "%temp%\firestick-loader\apps\media"
%sleep% 3
%install% "%temp%\firestick-loader\apps\media\kodi.apk"

%extractRAR% "%~dp0apps\media\kodi\data\%kodiVersion%\%kodiBuild%\kodi-data.split" "%temp%\firestick-loader\apps\media\kodi\data\%kodiVersion%\%kodiBuild%"
%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiVersion%\%kodiBuild%\addons" "/%sdcard%/%pathAndroid%/addons"
%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiVersion%\%kodiBuild%\userdata" "/%sdcard%/%pathAndroid%/userdata"

%rm% "%temp%\firestick-loader\apps\media\kodi"


:appsMain
cls
%_color% 0e
set appName=TeaTV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\teatv.apk"

cls
%_color% 0e
set appName=Cat Mouse
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\cat-mouse.apk"

cls
%_color% 0e
set appName=Cinema HD
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\cinemahd.apk"

cls
%_color% 0e
set appName=Bee TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\bee-tv.apk"

cls
%_color% 0e
set appName=Nova TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\nova-tv.apk"

cls
%_color% 0e
set appName=FreeFlix HQ
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\freeflixhq.apk"

cls
%_color% 0e
set appName=Ocean Streamz
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\ocean-streamz.apk"

cls
%_color% 0e
set appName=Viva TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\viva-tv.apk"

cls
%_color% 0e
set appName=Pluto TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\pluto-tv.apk"

cls
%_color% 0e
set appName=Tubi TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\tubi-tv.apk"

cls
%_color% 0e
set appName=Xumo TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\xumo-tv.apk"

cls
%_color% 0e
set appName=LiveNET TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\live-net-tv.apk"

::cls
::%_color% 0e
::set appName=MediaBox HD
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\media\mediaboxhd.apk"

cls
%_color% 0e
set appName=Crackle
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\crackle.apk"

::cls
::%_color% 0e
::set appName=Cuco TV
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\media\cuco-tv.apk"

cls
%_color% 0e
set appName=Film Plus
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\film-plus.apk"

::cls
::%_color% 0e
::set appName=DOFU Sports
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\media\dofu-sports.apk"

cls
%_color% 0e
set appName=Twitch
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\twitch-amazon.apk"

::cls
::%_color% 0e
::set appName=Twitch
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::md "%temp%\firestick-loader\apps\media\"
::%extractRAR% "%~dp0apps\media\twitch-amazon.split" "%temp%\firestick-loader\apps\media"
::%sleep% 3
::%install% "%temp%\firestick-loader\apps\media\twitch-amazon.apk"

cls
%_color% 0e
set appName=NetFlix
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\netflix-amazon.apk"

cls
%_color% 0e
set appName=Hulu
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\hulu-amazon.apk"

cls
%_color% 0e
set appName=Amazon Prime Video
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\amazon\amazon-prime-video.apk"

cls
%_color% 0e
set appName=SmartTube
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\stube.apk"

cls
%_color% 0e
set appName=SOPlayer
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\so-player.apk"

cls
%_color% 0e
set appName=VLC TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\vlc.apk"

::cls
::%_color% 0e
::set appName=Firefox TV Web Browser
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\web\firefox-tv.apk"

cls
%_color% 0e
set appName=Opera Mini Web Browser
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\opera-mini.apk"

cls
%_color% 0e
set appName=Downloader
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\downloader.apk"

cls
%_color% 0e
set appName=Wifi FTP Server
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\wifi-ftp-server.apk"

cls
%_color% 0e
set appName=Aurora Store
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\stores\aurora-store.apk"

cls
%_color% 0e
set appName=Aptoid TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\stores\aptoid-tv.apk"

cls
%_color% 0e
set appName=TV Games
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\games\tv-games.apk"

cls
%_color% 0e
set appName=Pacman 256
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\games\pacman-256.apk"

cls
%_color% 0e
set appName=Flappy Birds Family
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\games\flappy-birds-family-amazon.apk"


cls
%_color% 0e
set appName=Falling Lightblocks
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\games\falling-lightblocks.apk"

cls
%_color% 0e
set appName=Solitaire
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\games\solitaire.apk"

cls
%_color% 0e
set appName=Big Shark
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\games\big-shark.apk"

cls
%_color% 0e
set appName=Orb Wars
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\games\orb-wars.apk"

goto end

:end



