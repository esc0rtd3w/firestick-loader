@echo off

set _color="%cd%\bin\cocolor.exe"

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

set kodiBuild=default

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

set fsContinue=0

cls
%_color% 0e
set appName=FirePwn Home
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Home Replacement App
echo.
set /p choice=


if %choice%==1 (
		echo.
		echo.
		echo Installing %appName%...
		echo.

		%install% "apps\home\FirePwnHome.apk"
		%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/
)

cls
%_color% 0e
set appName=FirePwn Home Debug
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Home Replacement App
echo.
set /p choice=


if %choice%==1 (
		echo.
		echo.
		echo Installing %appName%...
		echo.

		%install% "apps\home\FirePwnHomeDebug.apk"
		%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/
)

cls
%_color% 0e
set appName=FireStarter
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Home Replacement App
echo.
set /p choice=


if %choice%==1 (
		echo.
		echo.
		echo Installing %appName%...
		echo.

		%install% "apps\home\firestopper.apk"
		%push% "apps\home\sdcard\FireStarterBackup.zip" /sdcard/
)


	
cls
set isKodi=0
%_color% 0e
set appName=Kodi
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: XBMC: XBOX Media Center
echo.
set /p choice=
if %choice%==1 (
	set isKodi=1
	echo.
	echo.
	echo Installing %appName%...
	echo.

	md "%temp%\firestick-loader\apps\media\kodi"

	%extractRAR% "%~dp0apps\media\kodi.apk.split" "%temp%\firestick-loader\apps\media"
	%sleep% 3
	%install% "%temp%\firestick-loader\apps\media\kodi.apk"

	%rm% "%temp%\firestick-loader\apps\media\kodi"
)


:: Skip Kodi Data if Kodi Is Not Requested To Install
if %isKodi%==0 goto skipKodi
cls
set kodiBuildSelect=2
%_color% 0e
set appName=Kodi Data
set apk=
echo Select Type of Kodi Data To Transfer and Press ENTER (Default 2):
echo.
echo 1) None   2) Default   3) Kids   4) No Sports
echo.
echo.
%_color% 0b
echo Requirements: Kodi
echo.
echo Info: Kodi Addon and User Data
echo.
set /p kodiBuildSelect=

if %kodiBuildSelect%==1 (

	cls
	echo.

)

if %kodiBuildSelect%==2 (

	set kodiBuild=default

	echo.
	echo.
	echo Installing %appName% / %kodiBuild%...
	echo.


	md "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%"

	%extractRAR% "%~dp0apps\media\kodi\data\%kodiBuild%\kodi-data.split" "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%"
	%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%\addons" "/%sdcard%/%pathAndroid%/addons"
	%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%\userdata" "/%sdcard%/%pathAndroid%/userdata"

	%rm% "%temp%\firestick-loader\apps\media\kodi"
)

if %kodiBuildSelect%==3 (

	set kodiBuild=kids

	echo.
	echo.
	echo Installing %appName% / %kodiBuild%...
	echo.


	md "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%"

	%extractRAR% "%~dp0apps\media\kodi\data\%kodiBuild%\kodi-data.split" "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%"
	%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%\addons" "/%sdcard%/%pathAndroid%/addons"
	%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%\userdata" "/%sdcard%/%pathAndroid%/userdata"

	%rm% "%temp%\firestick-loader\apps\media\kodi"
)

if %kodiBuildSelect%==4 (

	set kodiBuild=default

	echo.
	echo.
	echo Installing %appName% / %kodiBuild%...
	echo.


	md "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%"

	%extractRAR% "%~dp0apps\media\kodi\data\%kodiBuild%\kodi-data.split" "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%"

	%sleep% 5

	call "%~dp0apps\media\kodi\clean-kodi-sports-alt.cmd"

	%sleep% 5

	%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%\addons" "/%sdcard%/%pathAndroid%/addons"
	%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%\userdata" "/%sdcard%/%pathAndroid%/userdata"

	%rm% "%temp%\firestick-loader\apps\media\kodi"
)


:skipKodi
cls
%_color% 0e
set appName=XBMC Launcher
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: Kodi (XBMC)
echo.
echo Info: Use Kodi as a HOME Replacement
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\system\xbmclauncher.apk"
)



cls
%_color% 0e
set appName=Aptoid TV App Store
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: 3rd Party App Store
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\stores\aptoid-tv.apk"
)



cls
%_color% 0e
set appName=F-Droid App Store
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: 3rd Party App Store
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\stores\fdroid.apk"
)


cls
%_color% 0e
set appName=SopCast
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: Kodi Uses This App
echo.
echo Info: Torrent Streaming App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\sopcast.apk"
)


cls
%_color% 0e
set appName=AceStream
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: Kodi Uses This App
echo.
echo Info: Torrent Streaming App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\acestream.apk"
)


cls
%_color% 0e
set appName=Mobdro
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Live TV App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\mobdro.apk"
)


cls
%_color% 0e
set appName=Cinema HD
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Movie/Video App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\cinemahd.apk"
)


cls
%_color% 0e
set appName=KokoTime
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Movie/Video App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\kokotime.apk"
)


cls
%_color% 0e
set appName=TeaTV
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Movie/Video App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\teatv.apk"
)

cls
%_color% 0e
set appName=TubiTV
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Live TV App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\tubitv.apk"
)

cls
%_color% 0e
set appName=PlutoTV
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Live TV App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\plutotv.apk"
)

cls
%_color% 0e
set appName=Popcornflix
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Retro TV Shows / Movies App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\popcornflix.apk"
)

cls
%_color% 0e
set appName=VidMate HD
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Retro TV Shows / Movies App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\vidmate.apk"
)


cls
%_color% 0e
set appName=NetFlix
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Media Streaming Service
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\netflix.apk"
)


cls
%_color% 0e
set appName=Hulu
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Media Streaming Service
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\media\hulu.apk"
)


cls
%_color% 0e
set appName=Amazon Underground - UK
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: Remove "com.amazon.shoptv.client" *ROOT*
echo.
echo Info: Amazon Store and Media Access
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\amazon\amazon-underground.apk"
)


cls
%_color% 0e
set appName=Amazon App Store - USA
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: Remove "com.amazon.shoptv.client" *ROOT*
echo.
echo Info: Amazon Store and Media Access
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\amazon\amazon-appstore.apk"
)


cls
%_color% 0e
set appName=Amazon Shopping - USA
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: Remove "com.amazon.shoptv.client" *ROOT*
echo.
echo Info: Amazon Store and Media Access
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\amazon\amazon-shopping.apk"
)


cls
%_color% 0e
set appName=Amazon Alexa
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: ???
echo.
echo Info: ???
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\amazon\amazon-alexa.apk"
)


cls
%_color% 0e
set appName=Amazon Drive
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: ???
echo.
echo Info: Remote Storage
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\amazon\amazon-drive.apk"
)


cls
%_color% 0e
set appName=Microsoft One Drive
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: ???
echo.
echo Info: Remote Storage
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\storage\one-drive.apk"
)


cls
%_color% 0e
set appName=Google Drive
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: ???
echo.
echo Info: Remote Storage
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\storage\google-drive.apk"
)


cls
%_color% 0e
set appName=Amazon Prime Now
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: ???
echo.
echo Info: ???
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\amazon\amazon-prime-now.apk"
)


cls
%_color% 0e
set appName=Amazon Music
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: Remove "com.amazon.bueller.music" *ROOT*
echo.
echo Info: Amazon Music App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\amazon\amazon-music.apk"
)


cls
%_color% 0e
set appName=Amazon Video
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: Remove "com.amazon.avod" *ROOT*
echo.
echo Info: Amazon Video App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.

%install% "apps\amazon\amazon-video.apk"
)


cls
%_color% 0e
set appName=Movian
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Showtime Media Player
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\movian.apk"
)


cls
%_color% 0e
set appName=OWN
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Oprah Winfrey Network
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\own.apk"
)


cls
%_color% 0e
set appName=AETV
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: AE TV
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\aetv.apk"
)


cls
%_color% 0e
set appName=BET Now
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: BET Now TV
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\betnow.apk"
)


cls
%_color% 0e
set appName=Cartoon Network
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Cartoon Network
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\cartoonnetwork.apk"
)


cls
%_color% 0e
set appName=Comedy Central
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Comedy Central
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\comedycentral.apk"
)


cls
%_color% 0e
set appName=History Channel
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: History Channel
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\history.apk"
)


cls
%_color% 0e
set appName=MTV
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: MTV
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\mtv.apk"
)


cls
%_color% 0e
set appName=PBS
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: PBS
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\pbs.apk"
)


cls
%_color% 0e
set appName=Plex
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Plex
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\plex.apk"
)


cls
%_color% 0e
set appName=TBS
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: TBS
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\tbs.apk"
)


cls
%_color% 0e
set appName=TNT
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: TNT
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\tnt.apk"
)


cls
%_color% 0e
set appName=Twitch
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Twitch
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\twitch.apk"
)


cls
%_color% 0e
set appName=VH1
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: VH1
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\vh1.apk"
)


cls
%_color% 0e
set appName=Popcorn Time Original
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: MOUSE/KEYBOARD
echo.
echo Info: Movies and TV Shows Streaming App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%extractRAR% "%~dp0apps\media\popcorntime.apk.split" "%temp%\firestick-loader\apps\media"
%sleep% 3
%install% "%temp%\firestick-loader\apps\media\popcorntime.apk"
)


cls
%_color% 0e
set appName=Popcorn Time New
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: MOUSE/KEYBOARD
echo.
echo Info: Movies and TV Shows Streaming App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%extractRAR% "%~dp0apps\media\popcorntime-new.apk.split" "%temp%\firestick-loader\apps\media"
%sleep% 3
%install% "%temp%\firestick-loader\apps\media\popcorntime-new.apk"
)


cls
%_color% 0e
set appName=Popcorn Time io Edition
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Movies and TV Shows Streaming App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\popcorntimeio.apk"
)


cls
%_color% 0e
set appName=Popcorn Time Community Edition
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Movies and TV Shows Streaming App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\popcorntimece.apk"
)


cls
%_color% 0e
set appName=Showbox
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Movies and TV Shows Streaming App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\showbox.apk"
)


cls
%_color% 0e
set appName=VLC TV
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Open Source Multimedia Player
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\vlc-tv-arm.apk"
)


::cls
::%_color% 0e
::set appName=NewPipe Youtube Client
::set apk=
::echo Install %appName%?
::echo.
::echo 1) Yes   2) No
::echo.
::echo.
::%_color% 0b
::echo Requirements: NONE
::echo.
::echo Info: YouTube Player
::echo.
::set /p choice=
::if %choice%==1 (
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\media\newpipe.apk"
::)


cls
%_color% 0e
set appName=Youtube
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: YouTube Player No Play Store
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\youtube.apk"
)


cls
%_color% 0e
set appName=Cyberflix
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Movie and TV App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\cyberflix.apk"
)


cls
%_color% 0e
set appName=Typhoon TV
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Movie and TV App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\typhoon-tv.apk"
)


cls
%_color% 0e
set appName=uSound Ares
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Music Download and Player Client
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\usound.apk"
)


cls
%_color% 0e
set appName=Opera Mini Legacy
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Lightweight Web Browser w Firestick Remote Mouse Support
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\opera-legacy.apk"
)


cls
%_color% 0e
set appName=Opera Mini
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Lightweight Web Browser
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\opera.apk"
)


cls
%_color% 0e
set appName=Firefox
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Web Browser
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\firefox.apk"
)


cls
%_color% 0e
set appName=Servers Ultimate
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Run HTTP, FTP, more from FireStick
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\servers-ultimate\servers-ultimate.apk"
)


cls
%_color% 0e
set appName=Terminal
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE/KEYBOARD?
echo.
echo Info: Run terminal commands
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\system\terminal.apk"
)


cls
%_color% 0e
set appName=Explorer
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: File Manager *NO ROOT PRIVILEDGE*
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\system\explorer.apk"
)


cls
%_color% 0e
set appName=Root Explorer
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: File Manager *ROOT PRIVILEDGED*
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\system\root-explorer.apk"
)


cls
%_color% 0e
set appName=Root Browser
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: File Manager *ROOT PRIVILEDGED*
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\system\root-browser.apk"
)


cls
%_color% 0e
set appName=File Explorer
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: File Manager (Simple UI)
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\system\file-explorer.apk"
)


cls
%_color% 0e
set appName=Teamviewer
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Remote Control Over Network for Android
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\teamviewer.apk"
)


cls
%_color% 0e
set appName=Diode
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Reddit Viewing Client
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\diode.apk"
)


cls
%_color% 0e
set appName=ADB Insecure
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: *ROOT*
echo.
echo Info: Enables Always-On Root Shell Over ADB
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\system\adbd-insecure.apk"
)


cls
%_color% 0e
set appName=ZIP Signer
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Allows Signing of ZIP and APK Files
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\utilities\zipsigner.apk"
)


cls
%_color% 0e
set appName=Mouse Toggle
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Mouse Emulation Using Remote
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\utilities\mouse-toggle.apk"
)


cls
%_color% 0e
set appName=UFC
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Amazon UFC App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\sports\ufc.apk"
)


cls
%_color% 0e
set appName=ESPN
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Amazon ESPN App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\sports\espn.apk"
)


cls
%_color% 0e
set appName=Reboot App
set apk=
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: *REQUIRES ROOT* Reboot App
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\utilities\reboot.apk"
)


:instWP
cls
%_color% 0e
set appName=Wallpaper
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Various Wallpapers
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %appName%...
echo.
%push% "wallpaper" "/%sdcard%/wallpaper"
)



goto end



:bootAni

set bootAniColorChoice=b
set bootAniColor=blue

cls
%_color% 0e
set appName=Custom Boot Animation
echo Install %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: *ROOT*
echo.
echo Info: Custom Boot Animation
echo.
set /p choice=
if %choice%==2 goto end

%_color% 0e
cls
echo Choose Color and Press ENTER [Default: Blue]:
echo.
echo.
echo B: Blue
echo.
echo R: Red
echo.
echo G: Green
echo.
echo Y: Yellow
echo.
echo P1: Pink
echo.
echo P2: Purple
echo.
echo O: Original Stock
echo.
echo.

set /p bootAniColorChoice=

if %bootAniColorChoice%==B set bootAniColor=blue
if %bootAniColorChoice%==b set bootAniColor=blue
if %bootAniColorChoice%==R set bootAniColor=red
if %bootAniColorChoice%==r set bootAniColor=red
if %bootAniColorChoice%==G set bootAniColor=green
if %bootAniColorChoice%==g set bootAniColor=green
if %bootAniColorChoice%==Y set bootAniColor=yellow
if %bootAniColorChoice%==y set bootAniColor=yellow
if %bootAniColorChoice%==P1 set bootAniColor=pink
if %bootAniColorChoice%==p1 set bootAniColor=pink
if %bootAniColorChoice%==P2 set bootAniColor=purple
if %bootAniColorChoice%==p2 set bootAniColor=purple
if %bootAniColorChoice%==O set bootAniColor=original
if %bootAniColorChoice%==o set bootAniColor=original

::echo %push% "%~dp0bootanimation\stock-%bootAniColor%\bootanimation.zip" /data/local/tmp/
::pause

cls
echo Installing %appName%...
echo.
%shell% "rm /data/local/tmp/bootanimation.zip"
%shell% "rm /data/local/tmp/replace-bootanimation.sh"
%push% "%~dp0bootanimation\stock-%bootAniColor%\bootanimation.zip" /data/local/tmp/
%push% "%~dp0scripts\replace-bootanimation.sh" /data/local/tmp/
::%shell% "su -c mount -o remount,rw /system"
%shell% "su -c chmod 755 /data/local/tmp/replace-bootanimation.sh"
%shell% "su -c sh /data/local/tmp/replace-bootanimation.sh"


goto end

:end



