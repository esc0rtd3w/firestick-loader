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


cls
%_color% 0e
set appName=FirePwn Home Debug
set apk=
echo Installing %appName%...
echo.
%install% "apps\home\FirePwnHomeDebug.apk"
%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/

cls
%_color% 0e
set appName=Root Explorer
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\system\root-explorer.apk"


cls
%_color% 0e
set appName=Terminal Emulator
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\system\terminal.apk"


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
set appName=Disk Usage
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\diskusage.apk"


cls
%_color% 0e
set appName=Titanium Backup
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\titanium-backup.apk"


cls
%_color% 0e
set appName=System App Remover
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\system-app-remover.apk"


cls
%_color% 0e
set appName=Show Touches
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\show-touches.apk"


cls
%_color% 0e
set appName=Android System Info
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\android-system-info.apk"


cls
%_color% 0e
set appName=ADB Insecure
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\adbd-insecure.apk"


cls
%_color% 0e
set appName=Droid Examiner
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\droid-examiner.apk"


cls
%_color% 0e
set appName=Link2SD
set apk=
echo.
echo.
echo Installing %appName%...
echo.
::%install% "apps\testing\link2sd.apk"


cls
%_color% 0e
set appName=Ghost Commander
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\ghost-commander.apk"


cls
%_color% 0e
set appName=Ghost Log
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\ghost-log.apk"


cls
%_color% 0e
set appName=Network Log
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\testing\network-log.apk"


cls
%_color% 0e
set appName=ZIP Signer
set apk=
echo.
echo.
echo Installing %appName%...
echo.
::%install% "apps\utilities\zipsigner.apk"


cls
%_color% 0e
set appName=ProxyDroid
set apk=
echo.
echo.
echo Installing %appName%...
echo.
::%install% "apps\proxy\proxydroid.apk"


cls
%_color% 0e
set appName=Proxy Settings
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\proxy\proxysettings.apk"


cls
%_color% 0e
set appName=APK Analyzer
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\proxy\apk-analyzer.apk"


cls
%_color% 0e
set appName=Quick App Manager
set apk=
echo.
echo.
echo Installing %appName%...
echo.
%install% "apps\proxy\quick-app-manager.apk"



goto end

:end



