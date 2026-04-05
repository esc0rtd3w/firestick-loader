@echo off
color 0e

taskkill /f /im adb.exe

set apk=0
set stuck=0
set twrp=0

cls
echo Type 1 if device is stuck on a loading screen
echo.
echo Otherwise just press ENTER
echo.
echo.

set /p stuck=

if %stuck%==1 adb reboot recovery


:start
cls
echo Drag APK File or Type Path and Press ENTER:
echo.
echo.

set /p apk=

if %apk%==0 goto start
if %stuck%==1 set twrp=1
if %stuck%==1 goto twrp

cls
echo Type 1 and press ENTER if TWRP is Running
echo.
echo Otherwise just press ENTER
echo.
echo.

set /p twrp=

cls
if %twrp%==1 goto twrp

adb push %apk% /sdcard/IconPack.apk
adb shell "su -c mount -o remount,rw /system"
adb shell "su -c rm -rf /system/app/IconPack/"
adb shell "su -c mkdir /system/app/IconPack/"
adb shell "su -c cp /sdcard/IconPack.apk /system/app/IconPack/"
adb shell "su -c chmod 0775 /system/app/IconPack/"
adb shell "su -c chmod 0644 /system/app/IconPack/IconPack.apk"
adb reboot

goto end

:twrp
adb push %apk% /sdcard/IconPack.apk
adb shell "mount -o rw /system"
adb shell "rm -rf /system/app/IconPack/"
adb shell "mkdir /system/app/IconPack/"
adb shell "cp /sdcard/IconPack.apk /system/app/IconPack/"
adb shell "chmod 0775 /system/app/IconPack/"
adb shell "chmod 0644 /system/app/IconPack/IconPack.apk"
adb reboot

:end
color 0a
echo.
echo Finished! Check For Errors!
echo.
echo Press Any Key To Close Window...
echo.
pause>nul


