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

:kodimain
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
set appName=Popcorn Time Community Edition
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\popcorntimece.apk"

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
set appName=CyberFlix
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\cyberflix.apk"

cls
%_color% 0e
set appName=Typhoon TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\typhoon-tv.apk"

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
set appName=Tubi TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\tubi-tv.apk"

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
set appName=Mobdro
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\mobdro.apk"

cls
%_color% 0e
set appName=Popcornflix
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\popcornflix.apk"

cls
%_color% 0e
set appName=Popcornflix Kids
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\popcornflix-kids.apk"

cls
%_color% 0e
set appName=NetFlix
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\netflix.apk"

cls
%_color% 0e
set appName=Hulu
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\hulu.apk"

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
set appName=Youtube
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\youtube.apk"

cls
%_color% 0e
set appName=Youtube Kids
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\youtube-kids.apk"

cls
%_color% 0e
set appName=Twitch
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\twitch.apk"

cls
%_color% 0e
set appName=VLC TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\vlc-tv-arm.apk"

cls
%_color% 0e
set appName=MX Player
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\mx-player.apk"

cls
%_color% 0e
set appName=Plex
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\plex.apk"

cls
%_color% 0e
set appName=Podcast Addict
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\pocast-addict.apk"

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
set appName=Puffin TV Web Browser
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\puffin-tv.apk"

cls
%_color% 0e
set appName=Amazon Silk Web Browser
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\amazon-silk.apk"

goto end

:end



