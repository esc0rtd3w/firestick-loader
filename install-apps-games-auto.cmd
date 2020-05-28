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

::cls
::%_color% 0e
::set appName=Freecell
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\games\freecell.apk"

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

::cls
::%_color% 0e
::set appName=Baloon Archery
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\games\balloon-archery.apk"

::cls
::%_color% 0e
::set appName=Fruit Cutter
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\games\fruit-cutter-amazon.apk"

::cls
::%_color% 0e
::set appName=Hovercraft Battle Arena
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\games\hovercraft-battle-arena-amazon.apk"

::cls
::%_color% 0e
::set appName=Memory
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\games\memory.apk"

::cls
::%_color% 0e
::set appName=Snake
::set apk=
::echo.
::echo.
::echo Installing %appName%...
::echo.
::%install% "apps\games\snake.apk"


goto end

:end



