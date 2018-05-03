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



:: https://forum.xda-developers.com/showthread.php?t=2618158


color 0e
cls
::echo Press ENTER To Install Google Play Store...
::echo.
::echo.
::echo.
::pause>nul


%shell% mkdir -p /sdcard/gtmp/
%shell% mkdir -p /sdcard/gtmp/lib/

set rebootnow=0

cls
echo Pushing ZIP Files To Device...
echo.
echo.
%push% "apps\google\arm\xposed-v89-sdk22-arm.zip" /sdcard/
::%push% "apps\google\arm64\xposed-v89-sdk22-arm64.zip" /sdcard/
%push% "apps\google\arm\open_gapps-arm-5.1-pico-20180427.zip" /sdcard/
::%push% "apps\google\arm64\open_gapps-arm64-5.1-pico-20180423.zip" /sdcard/

echo.
echo.
echo Press R to reboot if this is the 1st time running
echo.
echo.
set /p rebootnow=

if %rebootnow%==R %adb% reboot
if %rebootnow%==r %adb% reboot

cls
echo Once device reboots, boot into recovery, install the 2 zips, and clear cache
echo.
echo.
echo Press a key once device reboots back to home screen
echo.
echo.
if %rebootnow%==R pause>nul
if %rebootnow%==r pause>nul

cls
echo Installing Xposed Framework...
echo.
echo.
%adb% install "apps\google\XposedInstaller.apk"
%adb% install "apps\google\HDXPosed.apk"

cls
echo Pushing Files To Device...
echo.
echo.
%push% "apps\google\PhoneSky.apk" /sdcard/gtmp/
%push% "apps\google\arm\GoogleLoginService.apk" /sdcard/gtmp/
::%push% "apps\google\arm64\GoogleLoginService.apk" /sdcard/gtmp/
%push% "apps\google\arm\PrebuiltGmsCore.apk" /sdcard/gtmp/
::%push% "apps\google\arm64\PrebuiltGmsCore.apk" /sdcard/gtmp/

%push% "apps\google\arm\lib" /sdcard/gtmp/lib
::%push% "apps\google\arm64\lib" /sdcard/gtmp/lib

%shell% "su -c mount -o remount,rw /system"

%shell% "su -c rm -r /system/priv-app/Phonesky/"
%shell% "su -c rm -r /system/priv-app/GoogleLoginService/"
%shell% "su -c rm -r /system/priv-app/PrebuiltGmsCore/"

%shell% "su -c mkdir /system/priv-app/Phonesky"
%shell% "su -c mkdir /system/priv-app/GoogleLoginService"
%shell% "su -c mkdir /system/priv-app/PrebuiltGmsCore"
%shell% "su -c mkdir /system/priv-app/PrebuiltGmsCore/lib"
%shell% "su -c mkdir -p /system/priv-app/PrebuiltGmsCore/lib/arm"
::%shell% "su -c mkdir -p /system/priv-app/PrebuiltGmsCore/lib/arm64"

%shell% "su -c cp /sdcard/gtmp/Phonesky.apk /system/priv-app/Phonesky/"
%shell% "su -c cp /sdcard/gtmp/GoogleLoginService.apk /system/priv-app/GoogleLoginService/"
%shell% "su -c cp /sdcard/gtmp/PrebuiltGmsCore.apk /system/priv-app/PrebuiltGmsCore/"
%shell% "su -c cp /sdcard/gtmp/lib/* /system/priv-app/PrebuiltGmsCore/lib/arm/"
::%shell% "su -c cp /sdcard/gtmp/lib/* /system/priv-app/PrebuiltGmsCore/lib/arm64/"

::%shell% "su -c chmod 755 /system/priv-app/{GoogleLoginService/,Phonesky/,PrebuiltGmsCore/,PrebuiltGmsCore/lib/,PrebuiltGmsCore/lib/arm64/}"

%shell% "su -c chmod 755 /system/priv-app/GoogleLoginService/"
%shell% "su -c chmod 755 /system/priv-app/Phonesky/"
%shell% "su -c chmod 755 /system/priv-app/PrebuiltGmsCore/"
%shell% "su -c chmod 755 /system/priv-app/PrebuiltGmsCore/lib/"
%shell% "su -c chmod 755 /system/priv-app/PrebuiltGmsCore/lib/arm/"
::%shell% "su -c chmod 755 /system/priv-app/PrebuiltGmsCore/lib/arm64/"
%shell% "su -c chmod 644 /system/priv-app/Phonesky/Phonesky.apk"
%shell% "su -c chmod 644 /system/priv-app/GoogleLoginService/GoogleLoginService.apk"
%shell% "su -c chmod 644 /system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk"
%shell% "su -c chmod 644 /system/priv-app/PrebuiltGmsCore/lib/arm/*"
::%shell% "su -c chmod 644 /system/priv-app/PrebuiltGmsCore/lib/arm64/*"


%push% "apps\google\arm\com.google.android.gms.apk" /sdcard/
::%push% "apps\google\arm64\com.google.android.gms.apk" /sdcard/
%push% "apps\google\arm\PlayStore.apk" /sdcard/
::%push% "apps\google\arm64\PlayStore.apk" /sdcard/
::%adb% install "apps\google\arm\com.google.android.gms.apk"
::%adb% install "apps\google\arm64\com.google.android.gms.apk"
%adb% install -r -d "apps\google\com.google.android.gsf.login_4.4.4.apk"

%shell% "su -c mount -o remount,ro /system"


cls
echo Installing Root Browser...
echo.
echo.
echo.
%adb% install -r -d "apps\system\root-browser.apk"

cls
echo Use Root Browser To Install These From /sdcard/
echo.
echo.
echo com.google.android.gms.apk
echo PlayStore.apk
echo.
echo.
pause

cls
echo Press ENTER To Clean Temp Files Used and Reboot...
echo.
echo.
echo.
pause

%shell% rm -r /sdcard/gtmp/

%adb% reboot

:end





