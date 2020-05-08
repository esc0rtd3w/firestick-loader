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
::set appName=FireStarter
::set apk=
::echo Installing %appName%...
::echo.
::%install% "apps\home\firestopper.apk"
::%install% "apps\home\firestarter.apk"
::%push% "apps\home\sdcard\FireStarterBackup.zip" /sdcard/

cls
%_color% 0e
set appName=FirePwn Home
set apk=
echo Installing %appName%...
echo.
%install% "apps\home\FirePwnHome.apk"
%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/


cls
%_color% 0e
set appName=Kodi
set apk=
echo.
echo.
echo Installing %appName%...
echo.

set kodiBuild=default

md "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%"
%extractRAR% "%~dp0apps\media\kodi.apk.split" "%temp%\firestick-loader\apps\media"
%sleep% 3
%install% "%temp%\firestick-loader\apps\media\kodi.apk"

%extractRAR% "%~dp0apps\media\kodi\data\%kodiBuild%\kodi-data.split" "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%"
%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%\addons" "/%sdcard%/%pathAndroid%/addons"
%push% "%temp%\firestick-loader\apps\media\kodi\data\%kodiBuild%\userdata" "/%sdcard%/%pathAndroid%/userdata"

%rm% "%temp%\firestick-loader\apps\media\kodi"


::cls
::%_color% 0e
::set appName=XBMC Launcher
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\system\xbmclauncher.apk"


cls
%_color% 0e
set appName=F-Droid
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\stores\fdroid.apk"


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
set appName=SopCast
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\sopcast.apk"


cls
%_color% 0e
set appName=AceStream
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\acestream.apk"


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
set appName=TubiTV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\tubitv.apk"


cls
%_color% 0e
set appName=PlutoTV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\plutotv.apk"


::cls
::%_color% 0e
::set appName=Popcornflix
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\media\popcornflix.apk"


::cls
::%_color% 0e
::set appName=VidMate HD
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\media\vidmate.apk"


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


::cls
::%_color% 0e
::set appName=Amazon Underground
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\amazon\amazon-underground.apk"


::cls
::%_color% 0e
::set appName=Amazon App Store
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\amazon\amazon-appstore.apk"


::cls
::%_color% 0e
::set appName=Amazon Shopping
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\amazon\amazon-shopping.apk"


::cls
::%_color% 0e
::set appName=Amazon Alexa
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\amazon\amazon-alexa.apk"


::cls
::%_color% 0e
::set appName=Amazon Drive
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\amazon\amazon-drive.apk"


::cls
::%_color% 0e
::set appName=Microsoft One Drive
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\storage\one-drive.apk"


::cls
::%_color% 0e
::set appName=Google Drive
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\storage\google-drive.apk"


::cls
::%_color% 0e
::set appName=Amazon Prime Now
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\amazon\amazon-prime-now.apk"


cls
%_color% 0e
set appName=Amazon Music
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\amazon\amazon-music.apk"


cls
%_color% 0e
set appName=Amazon Video
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\amazon\amazon-video.apk"


::cls
::%_color% 0e
::set appName=Movian
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\media\movian.apk"


cls
%_color% 0e
set appName=Popcorn Time
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%extractRAR% "%~dp0apps\media\popcorntime.apk.split" "%temp%\firestick-loader\apps\media"
%sleep% 3
%install% "%temp%\firestick-loader\apps\media\popcorntime.apk"


::cls
::%_color% 0e
::set appName=Popcorn Time io Edition
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\media\popcorntimeio.apk"


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
set appName=VLC TV
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\vlc-tv-arm.apk"


::cls
::%_color% 0e
::set appName=Firefox
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\web\firefox.apk"


cls
%_color% 0e
set appName=Opera Mini
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\opera.apk"


::cls
::%_color% 0e
::set appName=YouTube -No Play Services-
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\media\youtube.apk"


cls
%_color% 0e
set appName=NewPipe Youtube Client
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\newpipe.apk"


cls
%_color% 0e
set appName=uSound Ares
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\usound.apk"


::cls
::%_color% 0e
::set appName=Terminal Emulator
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\system\terminal.apk"


cls
%_color% 0e
set appName=Root Explorer
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\system\root-explorer.apk"


::cls
::%_color% 0e
::set appName=Explorer
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\system\explorer.apk"


::cls
::%_color% 0e
::set appName=Root Browser
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\system\root-browser.apk"


::cls
::%_color% 0e
::set appName=File Explorer
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\system\file-explorer.apk"


cls
%_color% 0e
set appName=Teamviewer
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\teamviewer.apk"


cls
%_color% 0e
set appName=Diode (Reddit Viewer)
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\web\diode.apk"


cls
%_color% 0e
set appName=Wallpaper
echo.
echo.
echo Installing %appName%...
echo.
%push% "wallpaper" "/%sdcard%/wallpaper"


::cls
::%_color% 0e
::set appName=Custom Boot Animation
::echo.
::echo.
::echo Installing %appName%...
::echo.

::%shell% "rm /data/local/tmp/bootanimation.zip"
::%push% "%~dp0bootanimation\stock-blue\bootanimation.zip" /data/local/tmp/bootanimation.zip
::%push% "%~dp0scripts\replace-bootanimation.sh" /data/local/tmp/
::%shell% "su -c chmod 755 /data/local/tmp/replace-bootanimation.sh"
::%shell% "su -c sh /data/local/tmp/replace-bootanimation.sh"



:: NES
cls
set emuName=NES
echo Installing %emuName% Emulator...
echo.
adb install "emulators\nes.apk"

cls
echo Copying %emuName% Roms...
echo.
md "%cd%\emulators\roms\nes"
"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\nes.zip" -d "%cd%\emulators\roms\nes"
%push% "emulators\roms\nes" "/%sdcard%/roms/nes"
del /f /q "%cd%\emulators\roms\nes\*.*"
rd "%cd%\emulators\roms\nes"


:: Super Nintendo
cls
set emuName=SNES
echo Installing %emuName% Emulator...
echo.
adb install "emulators\snes.apk"

cls
echo Copying %emuName% Roms...
echo.
md "%cd%\emulators\roms\snes"
"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\snes.zip" -d "%cd%\emulators\roms\snes"
%push% "emulators\roms\snes" "/%sdcard%/roms/snes"
del /f /q "%cd%\emulators\roms\snes\*.*"
rd "%cd%\emulators\roms\snes"


:: Gameboy Advance
cls
set emuName=Gameboy Advance
echo Installing %emuName% Emulator...
echo.
adb install "emulators\gba.apk"

cls
echo Copying %emuName% Roms...
echo.
md "%cd%\emulators\roms\gba"
"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\gba.zip" -d "%cd%\emulators\roms\gba"
%push% "emulators\roms\gba" "/%sdcard%/roms/gba"
del /f /q "%cd%\emulators\roms\gba\*.*"
rd "%cd%\emulators\roms\gba"


:: Sega Genesis
cls
set emuName=Sega Genesis
echo Installing %emuName% Emulator...
echo.
adb install "emulators\genesis.apk"

cls
echo Copying %emuName% Roms...
echo.
md "%cd%\emulators\roms\genesis"
"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\genesis.zip" -d "%cd%\emulators\roms\genesis"
%push% "emulators\roms\genesis" "/%sdcard%/roms/genesis"
del /f /q "%cd%\emulators\roms\genesis\*.*"
rd "%cd%\emulators\roms\genesis"


:: Intellivision
cls
set emuName=Intellivision
echo Installing %emuName% Emulator...
echo.
adb install "emulators\intv.apk"

cls
echo Copying %emuName% Roms...
echo.
md "%cd%\emulators\roms\intv"
"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\intv.zip" -d "%cd%\emulators\roms\intv"
%push% "emulators\roms\intv" "/%sdcard%/roms/intv"
del /f /q "%cd%\emulators\roms\intv\*.*"
rd "%cd%\emulators\roms\intv"


:: Colecovision
cls
set emuName=Colecovision
echo Installing %emuName% Emulator...
echo.
adb install "emulators\colecovision.apk"

cls
echo Copying %emuName% Roms...
echo.
md "%cd%\emulators\roms\colecovision"
"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\colecovision.zip" -d "%cd%\emulators\roms\colecovision"
%push% "emulators\roms\colecovision" "/%sdcard%/roms/colecovision"
del /f /q "%cd%\emulators\roms\colecovision\*.*"
rd "%cd%\emulators\roms\colecovision"


:: Atari
cls
set emuName=Atari 2600
echo Installing %emuName% Emulator...
echo.
adb install "emulators\atari2600.apk"

cls
echo Copying %emuName% Roms...
echo.
md "%cd%\emulators\roms\atari2600"
"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\atari2600.zip" -d "%cd%\emulators\roms\atari2600"
%push% "emulators\roms\atari2600" "/%sdcard%/roms/atari2600"
del /f /q "%cd%\emulators\roms\atari2600\*.*"
rd "%cd%\emulators\roms\atari2600"



:end



