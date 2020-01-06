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

set apk=

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

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
set appName=Freecell
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\games\freecell.apk"

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



