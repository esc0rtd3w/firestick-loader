@echo off

title Remote XBMC Script for Amazon Firestick v1.0


set adb="..\..\bin\adb.exe"

set server=http://ps3dg.com/firestick

cls
echo Downloading all required files....
echo.
echo.

::"%cd%\bin\wget.exe -O "%temp%" %server%/remote.zip

::"%cd%\bin\unzip.exe "%temp%\remote.zip" -d "%cd%"


"%cd%\bin\wget.exe" -O "%cd%\apps" %server%/apps/firestarter.apk
"%cd%\bin\wget.exe" -O "%cd%\apps" %server%/apps/kodi-arm.apk
"%cd%\bin\wget.exe" -O "%cd%\apps" %server%/apps/vlc-tv-arm.apk
"%cd%\bin\wget.exe" -O "%cd%\apps" %server%/apps/settings.apk
"%cd%\bin\wget.exe" -O "%cd%\apps\kodi" %server%/apps/kodi/org.xbmc.kodi.zip


echo.
echo.
echo.
echo Installing FireStarter...
echo.
%adb% install "apps\firestarter.apk"


echo.
echo.
echo Installing Kodi...
echo.
%adb% install "apps\kodi-arm.apk"
%adb% push "apps\kodi\org.xbmc.kodi" "/sdcard/Android/data/org.xbmc.kodi"


echo.
echo.
echo Installing VLC TV...
echo.
%adb% install "apps\vlc-tv-arm.apk"


echo.
echo.
echo Installing KitKat Settings App...
echo.
%adb% install "apps\settings.apk"


:end



echo.
echo.
echo Complete! Press Any Key To Finish....
pause>nul

