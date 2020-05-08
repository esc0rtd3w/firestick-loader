@echo off

set _color="%cd%\bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="%~dp0bin\adb.exe"
set adbWait=%adb% wait-for-device

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell



:: Source https://forum.xda-developers.com/amazon-fire/general/how-to-install-google-play-store-fire-t3486603


color 0e
cls
echo Press ENTER To Install Google Play Store...
echo.
echo.
echo.
pause>nul


%install% "apps\google\new\1-com.google.android.gsf.login.apk"
%install% "apps\google\new\2-com.google.android.gsf.apk"
%install% "apps\google\new\3-com.google.android.gms.apk"
%install% "apps\google\new\4-com.android.vending.apk"

%shell% reboot



:end





