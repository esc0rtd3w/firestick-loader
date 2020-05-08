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



:mainmenu
color 0e

cls
echo Drop JPEG Picture Here For Kodi Main Screen Background:
echo.
echo.
set /p pic=

%push% %pic% %sdcard%/%pathAndroid%/addons/skin.xonfluence/media/main_menu/main_menu01.jpg

goto end


:movies
color 0e

cls
echo Drop JPEG Picture Here For Kodi Main Screen Background:
echo.
echo.
set /p pic=

%push% %pic% %sdcard%/%pathAndroid%/addons/skin.xonfluence/media/main_menu/main_menu01.jpg



goto end

:end
pause


