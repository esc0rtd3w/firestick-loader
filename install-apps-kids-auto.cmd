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

cls
%_color% 0e
set appName=Cartoon Network
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\kids\cartoon-network-amazon.apk"

cls
%_color% 0e
set appName=DisneyNow
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\kids\disneynow-amazon.apk"

cls
%_color% 0e
set appName=DisneyPlus
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\kids\disney-plus-amazon.apk"

cls
%_color% 0e
set appName=Nickelodeon
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\kids\nickelodeon-amazon.apk"

cls
%_color% 0e
set appName=Nick Jr
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\kids\nickjr-amazon.apk"

cls
%_color% 0e
set appName=PBS Kids
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\kids\pbs-kids-amazon.apk"

cls
%_color% 0e
set appName=Popcornflix Kids
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\kids\popcornflix-kids.apk"

cls
%_color% 0e
set appName=YouTube Kids
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\media\kids\youtube-kids.apk"



goto end

:end



