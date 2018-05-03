@echo off

set _color="%cd%\bin\cocolor.exe"

set adb="..\..\bin\adb.exe"

set appName=0
set choice=2

set uninstall=%adb% shell pm uninstall
set uninstallKeepSettings=%adb% shell pm uninstall -k
set namespace=


goto broken

:broken
goto end


cls
%_color% 0e
set appName=FireStarter
set namespace=
echo Uninstall %appName%?
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
echo Uninstalling %appName%...
echo.
%uninstall% "apps\system\firestarter.apk"
)


cls
%_color% 0e
set appName=Kodi
set namespace=
echo Uninstall %appName%?
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
echo.
echo.
echo Uninstalling %appName%...
echo.

%uninstall% "apps\media\kodi-arm.apk"

%adb% shell rm -r "/sdcard/Android/data/org.xbmc.kodi"
)


cls
%_color% 0e
set appName=TVMC
set namespace=
echo Uninstall %appName%?
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
echo.
echo.
echo Uninstalling %appName%...
echo.

%uninstall% "apps\media\tvmc.apk"
)


cls
%_color% 0e
set appName=Movian
set namespace=
echo Uninstall %appName%?
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
echo Uninstalling %appName%...
echo.
%uninstall% "apps\media\movian.apk"
)


cls
%_color% 0e
set appName=Youtube
set namespace=
echo Uninstall %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: GOOGLE SERVICES?
echo.
echo Info: NONE
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Uninstalling %appName%...
echo.
%uninstall% "gapps\YouTube6.0.13.apk"
)


cls
%_color% 0e
set appName=Showbox
set namespace=
echo Uninstall %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: MOUSE/KEYBOARD
echo.
echo Info: NONE
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Uninstalling %appName%...
echo.
%uninstall% "apps\media\showbox.apk"
)


cls
%_color% 0e
set appName=Popcorn Time
set namespace=
echo Uninstall %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: MOUSE/KEYBOARD
echo.
echo Info: NONE
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Uninstalling %appName%...
echo.
%uninstall% "apps\media\popcorntime.apk"
)


cls
%_color% 0e
set appName=Viewster
set namespace=
echo Uninstall %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: MOUSE/KEYBOARD
echo.
echo Info: NONE
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Uninstalling %appName%...
echo.
%uninstall% "apps\media\viewster.apk"
)


cls
%_color% 0e
set appName=VH1
set namespace=
echo Uninstall %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: MOUSE/KEYBOARD
echo.
echo Info: NONE
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Uninstalling %appName%...
echo.
%uninstall% "apps\media\vh1.apk"
)


cls
%_color% 0e
set appName=MTV
set namespace=
echo Uninstall %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: MOUSE/KEYBOARD
echo.
echo Info: NONE
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Uninstalling %appName%...
echo.
%uninstall% "apps\media\mtv.apk"
)


cls
%_color% 0e
set appName=VLC TV
set namespace=
echo Uninstall %appName%?
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
echo Uninstalling %appName%...
echo.
%uninstall% "apps\media\vlc-tv-arm.apk"
)


cls
%_color% 0e
set appName=Firefox
set namespace=
echo Uninstall %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: MOUSE/KEYBOARD?
echo.
echo Info: Open Source Web Browser
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Uninstalling %appName%...
echo.
%uninstall% "apps\web\firefox.apk"
)


cls
%_color% 0e
set namespace=
set appName=Servers Ultimate
echo Uninstall %appName%?
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
echo Uninstalling %appName%...
echo.
%uninstall% "apps\system\serversultimate.apk"
)


cls
%_color% 0e
set appName=Terminal
set namespace=
echo Uninstall %appName%?
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
echo Uninstalling %appName%...
echo.
%uninstall% "apps\system\terminal.apk"
)


cls
%_color% 0e
set appName=Root Explorer
set namespace=
echo Uninstall %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: File Manager
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Uninstalling %appName%...
echo.
%uninstall% "apps\system\rootexplorer.apk"
)


cls
%_color% 0e
set appName=Teamviewer
set namespace=
echo Uninstall %appName%?
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
echo Uninstalling %appName%...
echo.
%uninstall% "apps\web\teamviewer.apk"
)


cls
%_color% 0e
set appName=Android Settings App
set namespace=com.settings.android
echo Uninstall %appName%?
echo.
echo 1) Yes   2) No
echo.
echo.
%_color% 0b
echo Requirements: NONE
echo.
echo Info: Android Settings for Bluetooth 3rd Party and more
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Uninstalling %appName%...
echo.
%uninstall% %namespace%
)


cls
%_color% 0e
set appName=Wallpaper
echo Uninstall %appName%?
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
echo Uninstalling %appName%...
echo.
%adb% shell rm -r "/sdcard/wallpaper"
)



:end

