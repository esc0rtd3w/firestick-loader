@echo off

:reset

title Amazon FireStick Multi Rooting Downgrade and Hacking Script  [esc0rtd3w]

mode con lines=47

color 0e

set pathBin="%~dp0bin"
set pathScripts="%~dp0scripts"
set pathScriptsConfig="%~dp0config\scripts"

:: Config Menu UI
set configMain="%~dp0config\menu.ini"
set iniRead="%pathScriptsConfig%\ini-read.cmd"
set iniWrite="%pathScriptsConfig%\ini-write.cmd"

set twrpActive=0

set doNothing=0

set runShellNoTerminateAndWait=cmd /k
set runShellNoTerminate=start cmd /k
set runShellWaitNoTerminate=start /wait cmd /k
set runShellTerminateAndWait=cmd /c
set runShellTerminate=start cmd /c
set runShellWaitTerminate=start /wait cmd /c

set _color="%~dp0bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractRAR="%~dp0bin\rar.exe" -y x

set checkRoot=call "%~dp0scripts\misc\check-root.cmd"

set teamviewer="%~dp0bin\teamviewer.exe"

set virtualRouterCMD="%~dp0bin\virtualrouter.exe"
set virtualRouterGUI="%~dp0bin\virtualrouter-gui.exe"


set kingrootAPK="%~dp0rooting\king\kingroot.apk"
set kingrootAPKAlt1="%~dp0rooting\king\kingroot-alt1.apk"
set kingrootAPKAlt2="%~dp0rooting\king\kingroot-alt2.apk"
set kingrootPC="%~dp0rooting\king\kingroot-pc.exe"
set kingrootPCAlt1="%~dp0rooting\king\kingroot-alt1.exe"
set kingrootPCAlt2="%~dp0rooting\king\kingroot-alt2.exe"

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="%~dp0bin\adb.exe"
set adbKill=%adb% kill-server
set adbStart="%adb% start-server
set adbWait=%adb% wait-for-device

set msgbox="%~dp0bin\msgbox.exe"

set capDevice=/sdcard/cap.png

set tempHost=%temp%
set capHost="%temp%\cap.png"

set ssViewer=0

set waitTime=5

set doBlockAdsWithMenuOption=0

set doAcceptSuAfterRequest=0

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set tap=%adb% shell input tap
set swipe=%shell% input swipe
set key=%shell% input keyevent

set swipeUp=%shell% input swipe 200 900 200 300
set keyEnter=%shell% input keyevent 66
set keyOk=%shell% input keyevent 23
set keyTab=%shell% input keyevent 61
set keyArrowUp=%shell% input keyevent 19
set keyArrowDown=%shell% input keyevent 20
set keyArrowLeft=%shell% input keyevent 21
set keyArrowRight=%shell% input keyevent 22

set keyBack=%shell% input keyevent 3
set keyHome=%shell% input keyevent 4

set amStart=%shell% am start -a android.intent.action.MAIN -n

set bloatAction=disable

set rebootAfterClearCache=0
set rebootAfterBloatRemovalChoice=0

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

set dgNoRoot=0

set bootAnimationPath=%~dp0custom\bootanimation

set fireOsVersion=0.0.0.0
set checkKitKat=0

set buildDotProp=/system/build.prop

set rootable=0
set rootableText=NOT EXPLOITABLE
set firstCheck=0
set firstTimeRootAttempt=1
set rooted=0

set rootFromDG=1

set factoryReset=0

set msgbox=%~dp0bin\msgbox.exe

set busyboxScriptInstall=0

set mountRW=%shell% "su -c mount -o rw,remount /system"
set mountRO=%shell% "su -c mount -o ro,remount /system"

set kill=%shell% am kill

:: Must use double quotes after process/package for Super Kill
set killSuper=%shell% "su -c am kill

:: Must use double quotes after process/package for Super Kill
set rmSuper=%shell% "su -c rm


set cleanEntireSdCard=0

set doLaunchTWRPInstaller=1

:: File Commands (Unix-Like)
set cp=xcopy /e /y
set cp2=xcopy /y
set cp3=xcopy /e /y /h /d /c /r /i
set cp4=xcopy /e /y /h /d /c /r /i /s
set copy=copy /y
set copyNoClobber=copy
set del=del /f /q
set rm=del /f /q
set rmsubNoForce=del /s /q
set rmsub=del /f /s /q
set rmdir=rd /s /q
set mkdir=md
set kill=taskkill /f /im


:: Direct Invoking

:: Settings -> Main
set showSettingsMain=%amStart% com.amazon.tv.launcher/.ui.SettingsActivity

:: Settings -> Display & Sounds
set showSettingsDisplay=%amStart% com.amazon.tv.settings/.tv.BuellerDisplayAndSoundsSettingsActivity

:: Settings -> Parental Controls
set showSettingsParental=%amStart% com.amazon.tv.parentalcontrols/.PCONSettingsActivity

:: Settings -> Controllers and Bluetooth Devices
set showSettingsControllers=%amStart% com.amazon.tv.settings/.tv.BuellerControllersSettingsActivity

:: Find Amazon Remote
set showControllersAmazonRemote=%shell% "su -c am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.devices.BuellerRemoteDiscoveryActivity"

:: Find Gamepad
set showControllersFindGamepad=%shell% "su -c am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.devices.BuellerGamepadDiscoveryActivity"

:: Find Bluetooth Device
::set showControllersFindBluetooth=%shell% "su -c am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.devices.BuellerInputDeviceDiscoveryActivity"
set showControllersFindBluetooth=%shell% com.amazon.tv.settings/.tv.devices.BuellerInputDeviceDiscoveryActivity

:: Settings -> Applications
set showSettingsApplications=%amStart% com.amazon.tv.settings/.tv.BuellerApplicationsSettingsActivity
set showSettingsApplicationsManage=%amStart% com.amazon.tv.settings/.tv.AllApplicationsSettingsActivity

:: Settings -> System
set showSettingsSystemMain=%amStart% com.amazon.tv.settings/.tv.BuellerSystemSettingsActivity
set showSettingsSystemDeveloper=%amStart% com.amazon.tv.settings/.tv.BuellerDevelopmentSettingsActivity
set showSettingsSystemFactoryReset=%amStart% com.amazon.tv.settings/.tv.FactoryResetActivity
set showSettingsSystemFactoryReset=%amStart% com.amazon.tv.settings.tv.FactoryResetService.masterClear
::set showSettingsSystemFactoryResetNow=%amStart% com.amazon.tv.settings/.tv.FactoryResetActivity

:: Settings -> System -> Network
set showSettingsSystemNetwork=%amStart% com.amazon.tv.settings/.wifi.BuellerNetworkSettingsActivity

:: Settings -> My Account
set showSettingsMyAccount=%amStart% com.amazon.tv.settings/.tv.BuellerAccountSettingsActivity

:: Misc Invokes
set showDeviceNotifications=%amStart% com.amazon.bueller.notification/com.amazon.bueller.notification.BuellerDeviceService

set deregisterAmazonAccount=%shell% am start -a com.amazon.tv.oobe/.DeregistrationActivity -n com.amazon.tv.oobe/.DeregistrationActivity


:: Misc Activities Found

set clearUserAppData=%amStart% com.amazon.tv.settings/.tv.BuellerClearUserApplicationDataActivity
set showAppFilter=%amStart% com.amazon.tv.settings/.tv.ApplicationsFilterActivity
set scanForWPS=%amStart% com.amazon.tv.settings/.wifi.BuellerWifiWpsSettingsActivity


set showHomeLongPressHUD=%amStart% com.amazon.tv.settings/.hud.HudActivity

:: android.content.ContextWrapper.startService

:: com.amazon.tv.settings.tv.accounts.AccountHelpers.startOOBEDeregistrationForFactoryReset

:: com.amazon.tv.settings.tv.FactoryResetService.deregisterAccount

:: com.amazon.tv.settings.tv.FactoryResetActivity.factoryReset

set voicePromptOpen=%shell% am start -a com.amazon.intent.action.SEARCH -n com.amazon.vizzini/com.amazon.vizzini.vim.VIMOverlayActivity
::set voicePromptOpen=%amStart% com.amazon.vizzini/.vim.VIMOverlayActivity

set amazonLauncherHome=%shell% am start -a com.amazon.device.intent.category.LAUNCHER_MENU com.amazon.tv.launcher/.ui.HomeActivity

set amazonLauncherDeviceActivity=%shell% am start -a com.amazon.device.settings.action.DEVICE -n com.amazon.tv.settings/.tv.device.DeviceActivity


:: Launch Different Apps
set launchFireStarter=%amStart% de.belu.firestopper/.gui.MainActivity
set launchFirePwnHome=%amStart% com.firepwn.home.montoya/.gui.MainActivity
set launchSuperSU=%amStart% com.koushikdutta.superuser/.MainActivity
set launchAceStream=%amStart% org.acestream/.player.gui.MainActivity
set launchSopCast=%amStart% org.sopcast.android/.SopCast
set launchNetflix=%amStart% com.netflix.mediaclient/.ui.launch.NetflixComLaunchActivity
set launchHulu=%amStart% com.hulu.livingroomplus/.MainActivity
set launchMobdro=%amStart% com.mobdro.android/.DashBoardActivity
set launchKodi=%amStart% org.xbmc.kodi/.Splash
set launchVLC=%amStart% org.videolan.vlc/.gui.tv.MainTvActivity
set launchPopcornTime=%amStart% dp.ws.popcorntime/se.popcorn_time.mobile.ui.MainActivity
set launchMovian=%amStart% com.lonelycoder.mediaplayer/.GLWActivity
set launchOperaMini=%amStart% com.opera.mini.android/.Browser
set launchRootExplorer=%amStart% com.speedsoftware.rootexplorer/.RootExplorer
set launchBusybox=%amStart% stericson.busybox/.Activity.MainActivity
set launchTerminal=%amStart% jackpal.androidterm/.Term


::set suRequest=%amStart% com.android.internal.os.RuntimeInit uid 0

::set usbPowerWarning=Window{24f60778 u0 com.amazon.tv.settings/com.amazon.tv.settings.tv.BuellerAboutSettingsActivity

set launchScreenSaver=%amStart% com.amazon.bueller.photos/com.amazon.bueller.photos.daydream.ScreenSaverService


set appLauncher=%amStart% com.amazon.venezia/.grid.AppsGridLauncherActivity

set removeSuperSU=%uninstall% eu.chainfire.supersu


set firestopperUpdater=%amStart% de.belu.firestopper.tools.FireStarterUpdater

:: com.amazon.bueller.photos/.activity.ElizaVideoPlaybackActivity

:: com.opera.mini.android/.Browser

set test1=%shell% am start -a android.content.ContextWrapper.startService -n com.amazon.tv.launcher.Navigator.gotoMenu



set cleanPackages=%shell% "su -c dumpsys package"


:: Misc
set showFireTvRemotePin=%shell% am start -a com.amazon.storm.lightning.tutorial.authentication.SHOW -n com.amazon.storm.lightning.tutorial/.authentication.JpakePinActivity


:: Downgrade Version Options
set dgVersion=5.0.5
::set dgVersion=5.0.5.1
::set dgVersion=5.2.1.0

set writeFreeMemFireStick=%shell% "cat proc/meminfo | grep MemAvailable>/sdcard/freeMemory.txt"
set pullFreeMemFireStick=%pull% /sdcard/freeMemory.txt %temp%
::set showFreeMemFireStick=%runShellTerminate% notepad.exe "%temp%\freeMemory.txt"
::set /p readFreeMemFireStick=<"%temp%\freeMemory.txt"

set writeFreeStorageDataFireStick=%shell% "df /data/ | grep G>/sdcard/freeStorageData.txt"
set pullFreeStorageDataFireStick=%pull% /sdcard/freeStorageData.txt %temp%

set writeFreeStorageSystemFireStick=%shell% "df /system/ | grep M>/sdcard/freeStorageSystem.txt"
set pullFreeStorageSystemFireStick=%pull% /sdcard/freeStorageSystem.txt %temp%

set fullAutoMode=0
set fullAutoModeDG=0

set doFullAutoMode=0

set rootAfterInstall=0

set superSuReinstall=0


set installFireStopperSetting=0
set installTerminalSetting=0

set rebootAfterBloatRemoval=0

set restoreAmazonFiles=0

set adbServerAction=0

set checkFireOsInfoText=0

set unhideAllOTA=0

:: Default SU Types (kingroot / supersu)
set suType=kingroot
::set suType=supersu

set forceRecoveryBoot=%shell% "su -c echo 0>/cache/bootmenu_recovery"


:: Setting Default Available Boot Animation Colors
set bootAnimationBlue="%~dp0bootanimation\stock-blue\bootanimation.zip"
set bootAnimationGreen="%~dp0bootanimation\stock-green\bootanimation.zip"
set bootAnimationOriginal="%~dp0bootanimation\stock-original\bootanimation.zip"
set bootAnimationPink="%~dp0bootanimation\stock-pink\bootanimation.zip"
set bootAnimationPurple="%~dp0bootanimation\stock-purple\bootanimation.zip"
set bootAnimationRed="%~dp0bootanimation\stock-red\bootanimation.zip"
set bootAnimationYellow="%~dp0bootanimation\stock-yellow\bootanimation.zip"


:: Busybox Commands

::arp -a -v -i wlan0


:: Amazon APK Patching Flags
set patchAllSystemAPKs=0
set patchPhotosAPK=0
set patchSettingsAPK=0


set returnTo=menu




:menu

%adbKill%

%_color% 0e
cls
::if %checkFireOsInfoText%==0 echo Getting Storage and Memory Info From Device....
::if %checkFireOsInfoText%==1 echo Getting FireOS Version From Device....
::if %checkFireOsInfoText%==1 set checkFireOsInfoText=0
echo Getting Storage and Memory Info From Device....
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
%_color% 0b
echo Visit My GitHub Page To See All of My Other Projects:
echo.
::echo https://github.com/esc0rtd3w/firestick-loader/
echo https://github.com/esc0rtd3w/
echo.
echo.
%_color% 0e
echo.
echo.

del /f /s /q "%temp%\freeMemory.txt">nul
del /f /s /q "%temp%\freeStorageData.txt">nul
del /f /s /q "%temp%\freeStorageSystem.txt">nul


:: Get Memory Available From FireStick
%writeFreeMemFireStick%>nul
%pullFreeMemFireStick%>nul
for /f "tokens=2 delims= " %%f in ('type "%temp%\freeMemory.txt"') do set readFreeMemFireStick=%%f


:: Get Storage Space Available From FireStick
%writeFreeStorageDataFireStick%>nul
%pullFreeStorageDataFireStick%>nul
for /f "tokens=4 delims= " %%f in ('type "%temp%\freeStorageData.txt"') do set readStorageDataFireStick=%%f

%writeFreeStorageSystemFireStick%>nul
%pullFreeStorageSystemFireStick%>nul
for /f "tokens=4 delims= " %%f in ('type "%temp%\freeStorageSystem.txt"') do set readStorageSystemFireStick=%%f

%adb% shell "rm /sdcard/freeMemory.txt"
%adb% shell "rm /sdcard/freeStorageData.txt"
%adb% shell "rm /sdcard/freeStorageSystem.txt"


set dgchoice=m



cls
%_color% 0e
echo Checking Root Status On Device....
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
%_color% 0b
echo Visit My GitHub Page To See All of My Other Projects:
echo.
::echo https://github.com/esc0rtd3w/firestick-loader/
echo https://github.com/esc0rtd3w/
echo.
echo.
%_color% 0e
echo.
echo.

:: Check Root Status On Device
::%checkRoot%

:: Clean Before Checking
if exist "%temp%\rootAccess.txt" del /f /q "%temp%\rootAccess.txt"

%push% "%pathScripts%\check-root.sh" /data/local/tmp/
%shell% "chmod 777 /data/local/tmp/check-root.sh"
%shell% "sh /data/local/tmp/check-root.sh"

%pull% /%sdcard%/rootAccess.txt "%temp%"

for /f "tokens=* delims=*" %%r in ('type "%temp%\rootAccess.txt"') do set rootStatus=%%r

%sleep% 2

:: Remove Temp File On SD Card
%shell% "rm /%sdcard%/rootAccess.txt"

set /p rooted=<"%temp%\rootAccess.txt"

:: Remove Temp File
if exist "%temp%\rootAccess.txt" del /f /q "%temp%\rootAccess.txt"



:: Check FireOS Version

::if %firstCheck%==0 goto checkCanRoot

set firstCheck=1

set checkFireOsInfoText=1

%_color% 0e
cls
echo Getting FireOS Version From Device....
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
%_color% 0b
echo Visit My GitHub Page To See All of My Other Projects:
echo.
::echo https://github.com/esc0rtd3w/firestick-loader/
echo https://github.com/esc0rtd3w/
echo.
echo.
%_color% 0e
echo.
echo.


:: Get FireOS Info
%shell% "cat /system/build.prop | grep ro.build.version.name>/sdcard/fireos-version.txt"

%pull% /sdcard/fireos-version.txt "%temp%"

for /f "tokens=3 delims= " %%f in ('type "%temp%\fireos-version.txt"') do set fireOsVersion=%%f

if %fireOsVersion%==0.0.0.0 (
set rootable=0
set rootableColor=0c
set rootableText=INVALID
)

if %fireOsVersion%==5.0.0 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.0.2.1 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.0.2.2 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.0.3 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.0.3.1 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.0.3.2 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.0.3.3 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.0.4 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.0.5 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.0.5.1 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.2.1.0 (
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

if %fireOsVersion%==5.2.1.1 (
set rootable=0
set rootableColor=0c
set rootableText=NOT EXPLOITABLE
)

if %fireOsVersion%==5.2.1.2 (
set rootable=0
set rootableColor=0c
set rootableText=NOT EXPLOITABLE
)

if %fireOsVersion%==5.2.2.0 (
set rootable=0
set rootableColor=0c
set rootableText=NOT EXPLOITABLE
)

if %fireOsVersion%==5.2.4.0 (
set rootable=0
set rootableColor=0c
set rootableText=NOT EXPLOITABLE
)

if %fireOsVersion%==5.2.4.1 (
set rootable=0
set rootableColor=0c
set rootableText=NOT EXPLOITABLE
)

if %fireOsVersion%==5.2.6.0 (
set rootable=0
set rootableColor=0c
set rootableText=NOT EXPLOITABLE
)

if %fireOsVersion%==5.2.6.2 (
set rootable=0
set rootableColor=0c
set rootableText=NOT EXPLOITABLE
)

:: Check For Pre-FireOS Builds (4.2.2 KitKat)
if %fireOsVersion%==0.0.0.0 (
%shell% "cat /system/build.prop | grep JDQ39 | grep ro.build.id>/sdcard/fireos-version.txt"
%pull% /sdcard/fireos-version.txt "%temp%"
)

:: If KitKat 4.4.2 Build The Next Line Will Trigger
if %fireOsVersion%==0.0.0.0 for /f "tokens=2 delims=^=" %%f in ('type "%temp%\fireos-version.txt"') do set checkKitKat=%%f

:: Set Proper Text ONLY If Pre-FireOS Build
if %checkKitKat%==JDQ39 (
set fireOsVersion=4.2.2
set rootable=1
set rootableColor=0a
set rootableText=EXPLOITABLE
)

del /f /s /q "%temp%\fireos-version.txt"

%adbKill%


cls
%_color% 0e
echo Checking OTA Recommendations For Version %fireOsVersion%....
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
%_color% 0b
echo Visit My GitHub Page To See All of My Other Projects:
echo.
::echo https://github.com/esc0rtd3w/firestick-loader/
echo https://github.com/esc0rtd3w/
echo.
echo.
%_color% 0e
echo.
echo.


:: Set MessageBox Text To Display
if %fireOsVersion%==4.2.2 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nThis is a KitKat Build and Precedes FireOS.\n\nThis Build May Be Rootable and Is Still In Testing." "FirePwn Loader"
)

if %fireOsVersion%==5.0.0 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to ROOT and then update to version 5.0.5" "FirePwn Loader"
)

if %fireOsVersion%==5.0.2.1 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to ROOT and then update to version 5.0.5" "FirePwn Loader"
)

if %fireOsVersion%==5.0.2.2 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to ROOT and then update to version 5.0.5" "FirePwn Loader"
)

if %fireOsVersion%==5.0.3 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to ROOT and then update to version 5.0.5" "FirePwn Loader"
)

if %fireOsVersion%==5.0.3.1 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to ROOT and then update to version 5.0.5" "FirePwn Loader"
)

if %fireOsVersion%==5.0.3.2 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to ROOT and then update to version 5.0.5" "FirePwn Loader"
)

if %fireOsVersion%==5.0.3.3 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to ROOT and then update to version 5.0.5" "FirePwn Loader"
)

if %fireOsVersion%==5.0.4 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to ROOT and then update to version 5.0.5" "FirePwn Loader"
)

if %fireOsVersion%==5.0.5 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to:\n\n- Root Device\n- Install Busybox\n- Disable and Remove All Amazon Bloat\n- Block Ads Using Modified HOSTS File\n- Replace or Modify Boot Animation *OPTIONAL*\n- Remove Root Access *OPTIONAL*\n\n\n*** THIS IS CURRENTLY THE RECOMMENDED VERSION TO USE ***" "FirePwn Loader"
)

if %fireOsVersion%==5.0.5.1 (
%msgbox% "This device has version %fireOsVersion% installed.\nThere will probably be mixed results trying to root this version!\n\nIt is recommended updating to version 5.2.1.0 for rooting.\n\n\nAmazon OTA Updates are incremental.\n\nThe available version under SETTINGS - ABOUT should be 5.2.1.0.\n\n\n*** DO NOT UPDATE IF AVAILABLE VERSION IS 5.2.1.1 OR HIGHER ***" "FirePwn Loader"
)

if %fireOsVersion%==5.2.1.0 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\nIt is recommended to:\n\n- Disable Amazon OTA Updates\n- Root Device\n- Downgrade To Version 5.0.5.\n\n\nThe Update Loop Protection Script and Block OTA Virtual WiFi Hotspot Will Run After This Dialog Is Closed!\n\n\n* IF THE DEVICE UPDATES, IT MAY NOT BE EXPLOITABLE!\n\n*** YOU HAVE BEEN WARNED ***" "FirePwn Loader"

%runShellNoTerminate% "%pathScripts%\misc\update-protection-loop.cmd"
%runShellTerminate% %virtualRouterGUI%
)

if %fireOsVersion%==5.2.1.1 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\n*** THIS VERSION IS CURRENTLY NOT EXPLOITABLE ***" "FirePwn Loader"
)

if %fireOsVersion%==5.2.1.2 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\n*** THIS VERSION IS CURRENTLY NOT EXPLOITABLE ***" "FirePwn Loader"
)

if %fireOsVersion%==5.2.2.0 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\n*** THIS VERSION IS CURRENTLY NOT EXPLOITABLE ***" "FirePwn Loader"
)

if %fireOsVersion%==5.2.4.0 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\n*** THIS VERSION IS CURRENTLY NOT EXPLOITABLE ***" "FirePwn Loader"
)

if %fireOsVersion%==5.2.4.1 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\n*** THIS VERSION IS CURRENTLY NOT EXPLOITABLE ***" "FirePwn Loader"
)

if %fireOsVersion%==5.2.6.0 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\n*** THIS VERSION IS CURRENTLY NOT EXPLOITABLE ***" "FirePwn Loader"
)

if %fireOsVersion%==5.2.6.2 (
%msgbox% "This device has version %fireOsVersion% installed.\n\n\n*** THIS VERSION IS CURRENTLY NOT EXPLOITABLE ***" "FirePwn Loader"
)


:: Begin Main Menu
cls

:: Change Colors To Match Exploitable Status
%_color% 0e
if %rootable%==0 %_color% %rootableColor%
if %rootable%==1 %_color% %rootableColor%

:: If Rooted Set New Text
if %rooted%==1 (
set rootableText=ROOTED
)

echo *** Device is currently on version %fireOsVersion% and is %rootableText% ***
echo.
echo.
%_color% 0b
echo [Free Memory: %readFreeMemFireStick%KB]   [Free Space (/data/): %readStorageDataFireStick%  (/system/): %readStorageSystemFireStick%]
echo.
echo.
echo.
%_color% 0e
echo Press Y To Use Full Automatic Mode (also use YD to include downgrade)
%_color% 0e
echo.
echo.
echo Press I to install kingroot (also use IR to install and root)
echo.
echo Press R to root (also use R1 to Skip Wait or R2 to Skip Wait/Swipe)
echo.
echo Press T to install TWRP and pre-rooted rom (thanks to rbox) (TR copy rom)
echo.
::echo Press S to issue an "su" request (also use SA to auto accept request)
::echo.
echo Press G to install Google Play Store (*root required*)
echo.
echo.
::echo Press P to replace kingroot with SuperSU (Not Working Correctly!)
::echo.
%_color% 0e
echo Press D to downgrade firmware (also use DN for no root method *see tweaks*)
echo.
echo Press B to install busybox (also use BA to use auto scripting method)
echo.
echo Press A to disable Amazon Bloatware (also use AR to remove or ARA w/adblock)
echo.
echo Press U to unroot (kingroot binary and apk removal)
echo.
echo.
echo Press C to clear all caches on device (also use CR to reboot after)
echo.
echo Press K to clean kodi data (also use KS to clean entire sd card)
echo.
echo Press F to factory reset (also use FR for root reset to save config files)
echo.
echo.
echo Press W to run fixes, tweaks, and misc options
echo.
echo Press Z to directly invoke Amazon Settings menu items
echo.
echo.
echo Press X to exit (also use XR to reload main menu)
echo.
echo.
echo Make a choice and press ENTER....
echo.

set /p dgchoice=

if %dgchoice%==AB goto antiBrick
if %dgchoice%==Ab goto antiBrick
if %dgchoice%==aB goto antiBrick
if %dgchoice%==ab goto antiBrick

::if %dgchoice%==G goto gplay
::if %dgchoice%==g goto gplay
if %dgchoice%==G %runShellTerminate% "extras-install-play-store.cmd"
if %dgchoice%==g %runShellTerminate% "extras-install-play-store.cmd"

if %dgchoice%==B goto busybox
if %dgchoice%==b goto busybox
if %dgchoice%==BA set busyboxScriptInstall=1&&goto busybox
if %dgchoice%==Ba set busyboxScriptInstall=1&&goto busybox
if %dgchoice%==bA set busyboxScriptInstall=1&&goto busybox
if %dgchoice%==ba set busyboxScriptInstall=1&&goto busybox
::if %dgchoice%==F goto launchFS
::if %dgchoice%==f goto launchFS
if %dgchoice%==W goto fixesMenu
if %dgchoice%==w goto fixesMenu
if %dgchoice%==U goto unrootKing
if %dgchoice%==u goto unrootKing
if %dgchoice%==I goto installRoot
if %dgchoice%==i goto installRoot
if %dgchoice%==IR set rootAfterInstall=1&&goto installRoot
if %dgchoice%==Ir set rootAfterInstall=1&&goto installRoot
if %dgchoice%==iR set rootAfterInstall=1&&goto installRoot
if %dgchoice%==ir set rootAfterInstall=1&&goto installRoot
if %dgchoice%==D goto downgrade
if %dgchoice%==d goto downgrade
if %dgchoice%==DN set dgNoRoot=1&&goto downgrade
if %dgchoice%==Dn set dgNoRoot=1&&goto downgrade
if %dgchoice%==dN set dgNoRoot=1&&goto downgrade
if %dgchoice%==dn set dgNoRoot=1&&goto downgrade
if %dgchoice%==R goto root
if %dgchoice%==r goto root
if %dgchoice%==R1 goto root1
if %dgchoice%==r1 goto root1
if %dgchoice%==R2 goto root2
if %dgchoice%==r2 goto root2
if %dgchoice%==S goto doSU
if %dgchoice%==s goto doSU
if %dgchoice%==T goto doTWRP
if %dgchoice%==t goto doTWRP
if %dgchoice%==TR goto onlyRom
if %dgchoice%==Tr goto onlyRom
if %dgchoice%==tR goto onlyRom
if %dgchoice%==tr goto onlyRom
if %dgchoice%==TM goto adbMouse
if %dgchoice%==Tm goto adbMouse
if %dgchoice%==TM goto adbMouse
if %dgchoice%==tM goto adbMouse
if %dgchoice%==SA set doAcceptSuAfterRequest=1&&goto doSU
if %dgchoice%==Sa set doAcceptSuAfterRequest=1&&goto doSU
if %dgchoice%==sa set doAcceptSuAfterRequest=1&&goto doSU
if %dgchoice%==sA set doAcceptSuAfterRequest=1&&goto doSU
if %dgchoice%==A set bloatAction=disable&&goto bloatDisable
if %dgchoice%==a set bloatAction=disable&&goto bloatDisable
if %dgchoice%==AR goto removeBloat
if %dgchoice%==Ar goto removeBloat
if %dgchoice%==ar goto removeBloat
if %dgchoice%==aR goto removeBloat
if %dgchoice%==ARA set doBlockAdsWithMenuOption=1&&goto removeBloat
if %dgchoice%==ara set doBlockAdsWithMenuOption=1&&goto removeBloat
if %dgchoice%==ARa set doBlockAdsWithMenuOption=1&&goto removeBloat
if %dgchoice%==arA set doBlockAdsWithMenuOption=1&&goto removeBloat
if %dgchoice%==Ara set doBlockAdsWithMenuOption=1&&goto removeBloat
if %dgchoice%==aRA set doBlockAdsWithMenuOption=1&&goto removeBloat
if %dgchoice%==aRa set doBlockAdsWithMenuOption=1&&goto removeBloat
if %dgchoice%==ArA set doBlockAdsWithMenuOption=1&&goto removeBloat
if %dgchoice%==E goto bloatEnable
if %dgchoice%==e goto bloatEnable
if %dgchoice%==C goto clearCaches
if %dgchoice%==c goto clearCaches
if %dgchoice%==K goto cleanSD
if %dgchoice%==k goto cleanSD
if %dgchoice%==KS set cleanEntireSdCard=1&&goto cleanSD
if %dgchoice%==Ks set cleanEntireSdCard=1&&goto cleanSD
if %dgchoice%==kS set cleanEntireSdCard=1&&goto cleanSD
if %dgchoice%==ks set cleanEntireSdCard=1&&goto cleanSD
if %dgchoice%==CR set rebootAfterClearCache=1&&goto clearCaches
if %dgchoice%==Cr set rebootAfterClearCache=1&&goto clearCaches
if %dgchoice%==cr set rebootAfterClearCache=1&&goto clearCaches
if %dgchoice%==cR set rebootAfterClearCache=1&&goto clearCaches
if %dgchoice%==P goto superSU
if %dgchoice%==p goto superSU
if %dgchoice%==Z goto invoke
if %dgchoice%==z goto invoke
if %dgchoice%==F set factoryReset=1&&goto fReset
if %dgchoice%==f set factoryReset=1&&goto fReset
if %dgchoice%==FR set factoryReset=2&&goto fReset
if %dgchoice%==Fr set factoryReset=2&&goto fReset
if %dgchoice%==fr set factoryReset=2&&goto fReset
if %dgchoice%==fR set factoryReset=2&&goto fReset
if %dgchoice%==Y goto fullAuto
if %dgchoice%==y goto fullAuto
if %dgchoice%==YD set fullAutoModeDG=1&&goto fullAuto
if %dgchoice%==Yd set fullAutoModeDG=1&&goto fullAuto
if %dgchoice%==yd set fullAutoModeDG=1&&goto fullAuto
if %dgchoice%==yD set fullAutoModeDG=1&&goto fullAuto
if %dgchoice%==X goto end
if %dgchoice%==x goto end
if %dgchoice%==XR goto menu
if %dgchoice%==Xr goto menu
if %dgchoice%==xr goto menu
if %dgchoice%==xR goto menu
if %dgchoice%==M goto menu
if %dgchoice%==m goto menu

:: Fix Amazon Android Remote App (Only if loaded from 20160802 and earlier builds)
::if %dgchoice%==V goto fixRemote
::if %dgchoice%==v goto fixRemote

goto menu


:invoke

%_color% 0e

set ichoice=y

cls
echo Direct Activity Invoker Menu [FireTV Stick]
echo.
echo.
if %rootable%==0 %_color% 0c
if %rootable%==1 %_color% 0a
echo Device is currently %rootableText%
%_color% 0e
echo.
echo.
echo Press Y to Show Settings -- Main Window
echo.
echo Press D to Show Settings -- Display Window
echo.
echo Press P to Show Settings -- Parental Controls Window
echo.
echo Press C to Show Settings -- Controllers and Bluetooth Window
echo.
echo Press A to Show Settings -- Applications Window
echo.
echo Press S to Show Settings -- System Window
echo.
echo Press M to Show Settings -- My Account Window
echo.
echo.
echo Press Z to open advanced direct activies
echo.
echo Press B to go back to previous page
echo.
echo Press X to exit
echo.
echo.
echo Make a choice and press ENTER....
echo.

set /p ichoice=

if %ichoice%==Y %showSettingsMain%
if %ichoice%==y %showSettingsMain%
if %ichoice%==D %showSettingsDisplay%
if %ichoice%==d %showSettingsDisplay%
if %ichoice%==P %showSettingsParental%
if %ichoice%==p %showSettingsParental%
if %ichoice%==C %showSettingsControllers%
if %ichoice%==c %showSettingsControllers%
if %ichoice%==A %showSettingsApplications%
if %ichoice%==a %showSettingsApplications%
if %ichoice%==S %showSettingsSystemMain%
if %ichoice%==s %showSettingsSystemMain%
if %ichoice%==M %showSettingsMyAccount%
if %ichoice%==m %showSettingsMyAccount%
if %ichoice%==Z goto advInvoke
if %ichoice%==z goto advInvoke
if %ichoice%==B goto menu
if %ichoice%==b goto menu
if %ichoice%==X goto end
if %ichoice%==x goto end
if %ichoice%==Y goto invoke
if %ichoice%==y goto invoke

goto invoke


:advInvoke

%_color% 0e

set achoice=y

cls
echo Advanced Direct Activity Invoker Menu [FireTV Stick]
echo.
echo.
if %rootable%==0 %_color% 0c
if %rootable%==1 %_color% 0a
echo Device is currently %rootableText%
%_color% 0e
echo.
echo.
echo Press A to Show Settings -- Applications -- Manage Window
echo.
echo Press R to Show Settings -- Controllers -- Add Amazon Remote
echo.
echo Press G to Show Settings -- Controllers -- Add Gamepad
echo.
echo Press H to Show Settings -- Controllers -- Add Bluetooth Device
echo.
echo Press D to Show Settings -- System -- Developer Options Window
echo.
echo Press F to Show Settings -- System -- Factory Reset Window
echo.
echo Press Y to Show Settings -- System -- Network
echo.
echo Press N to Show Device Notifications
echo.
echo.
echo Press B to go back to previous page
echo.
echo Press X to exit
echo.
echo.
echo Make a choice and press ENTER....
echo.

set /p achoice=

if %achoice%==A %showSettingsApplicationsManage%
if %achoice%==a %showSettingsApplicationsManage%
if %achoice%==D %showSettingsSystemDeveloper%
if %achoice%==d %showSettingsSystemDeveloper%
if %achoice%==F %showSettingsSystemFactoryReset%
if %achoice%==f %showSettingsSystemFactoryReset%
if %achoice%==Y %showSettingsSystemNetwork%
if %achoice%==y %showSettingsSystemNetwork%
if %achoice%==R %showControllersAmazonRemote%
if %achoice%==r %showControllersAmazonRemote%
if %achoice%==G %showControllersFindGamepad%
if %achoice%==g %showControllersFindGamepad%
if %achoice%==H %showControllersFindBluetooth%
if %achoice%==h %showControllersFindBluetooth%
if %achoice%==N %showDeviceNotifications%
if %achoice%==n %showDeviceNotifications%
if %achoice%==B goto invoke
if %achoice%==b goto invoke
if %achoice%==X goto end
if %achoice%==x goto end
if %ichoice%==Y goto advInvoke
if %ichoice%==y goto advInvoke

goto advInvoke



:fixesMenu

%_color% 0e

set fchoice=y

cls
echo Fixes, Tweaks, and Misc Menu [FireTV Stick]
echo.
echo.
echo.
%_color% 0b
echo 1) Patch Downgrade Process For Use Without Root *ROOT REQUIRED*
::echo 1) Fix Connectivity To Android FireTV Remote App
echo.
::%_color% 05
echo 2) Launch Android Event Keymap (Press Keys and Send Text Over ADB)
echo.
::%_color% 09
::echo 3) Remove Boot Animation (Leaves Stock FIRE Text)
echo 3) Replace Boot Animation (Replaces Stock Boot Animation)
echo 4) Restore Boot Animation (Restores Stock Boot Animation)
echo.
::echo 6) Replace Boot Fallback Images (Replaces Stock FIRE Text)
::echo 7) Restore Boot Fallback Images (Restores framework-res.apk)
echo.
echo 5) Launch Boot Animation Factory
echo.
echo.
%_color% 0a
echo P) Patch Amazon APKs (also use P1 for photos, P2 for settings, P*R to restore)
echo.
%_color% 0d
echo H) Hide Amazon OTA Updates (also use HU to unhide or HA or HUA for all)
echo.
%_color% 09
echo S) Take Screenshot (also use SV to use rapid viewer mode)
echo.
%_color% 01
echo A) Allow Superuser Permission On Device (AK/King) (AS/SuperSU)
echo.
%_color% 0c
echo D) Disable/Block Ads (uses modified /system/etc/HOSTS)
echo.
%_color% 06
echo L) Accept Opera Mini License Agreement
echo.
%_color% 03
echo F) FireStopper Launch (also use FI to install or FIS to install as /system/)
echo.
echo.
%_color% 02
::echo T) Terminal Launch (also use TI to install or TIS to install as /system/)
echo V) Launch Virtual WiFi Hotspot (Blocks Amazon OTA Updates)
echo.
echo.
%_color% 07
echo Z) Reset ADB Server (also use ZS to start or ZK to kill server)
echo.
%_color% 08
echo R) Reboot Device (also use RR for recovery or RB for bootloader modes)
echo.
echo.
echo.
%_color% 0e
echo Press B to go back to previous page
::echo.
::echo Press X to exit
echo.
echo.
echo Make a choice and press ENTER....
echo.

set /p fchoice=

::if %fchoice%==1 goto fixRemote
if %fchoice%==1 goto cacheFix
if %fchoice%==2 goto eventmap
::if %fchoice%==3 goto bootanimRemove
if %fchoice%==3 goto bootanimReplace
if %fchoice%==4 goto bootanimRestore
::if %fchoice%==6 goto bootanimReplaceFBI
::if %fchoice%==7 goto bootanimRestoreFBI
if %fchoice%==5 "%~dp0bin\boot-animation-factory.exe"
if %fchoice%==L %tap% 20 1030
if %fchoice%==l %tap% 20 1030
if %fchoice%==A goto allowSU
if %fchoice%==a goto allowSU
if %fchoice%==AK set suType=kingroot&&goto allowSU
if %fchoice%==ak set suType=kingroot&&goto allowSU
if %fchoice%==Ak set suType=kingroot&&goto allowSU
if %fchoice%==aK set suType=kingroot&&goto allowSU
if %fchoice%==AS set suType=supersu&&goto allowSU
if %fchoice%==as set suType=supersu&&goto allowSU
if %fchoice%==As set suType=supersu&&goto allowSU
if %fchoice%==aS set suType=supersu&&goto allowSU
if %fchoice%==H goto hideOTA
if %fchoice%==h goto hideOTA
if %fchoice%==HA set hideAllOTA=1&&goto hideOTA
if %fchoice%==Ha set hideAllOTA=1&&goto hideOTA
if %fchoice%==hA set hideAllOTA=1&&goto hideOTA
if %fchoice%==ha set hideAllOTA=1&&goto hideOTA
if %fchoice%==HUA set unhideAllOTA=1&&goto unhideOTA
if %fchoice%==HuA set unhideAllOTA=1&&goto unhideOTA
if %fchoice%==Hua set unhideAllOTA=1&&goto unhideOTA
if %fchoice%==hUA set unhideAllOTA=1&&goto unhideOTA
if %fchoice%==hUa set unhideAllOTA=1&&goto unhideOTA
if %fchoice%==huA set unhideAllOTA=1&&goto unhideOTA
if %fchoice%==hua set unhideAllOTA=1&&goto unhideOTA
if %fchoice%==HU goto unhideOTA
if %fchoice%==Hu goto unhideOTA
if %fchoice%==hU goto unhideOTA
if %fchoice%==hu goto unhideOTA
::if %fchoice%==P goto cacheFix
::if %fchoice%==p goto cacheFix

if %fchoice%==P set restoreAmazonFiles=0&&set patchPhotosAPK=1&&set patchSettingsAPK=1&&goto patchAmz
if %fchoice%==p set restoreAmazonFiles=0&&set patchPhotosAPK=1&&set patchSettingsAPK=1&&goto patchAmz

if %fchoice%==P1 set restoreAmazonFiles=0&&set patchPhotosAPK=1&&goto patchAmz
if %fchoice%==p1 set restoreAmazonFiles=0&&set patchPhotosAPK=1&&goto patchAmz

if %fchoice%==P1R set restoreAmazonFiles=1&&set patchPhotosAPK=1&&goto patchAmz
if %fchoice%==P1r set restoreAmazonFiles=1&&set patchPhotosAPK=1&&goto patchAmz
if %fchoice%==p1R set restoreAmazonFiles=1&&set patchPhotosAPK=1&&goto patchAmz
if %fchoice%==p1r set restoreAmazonFiles=1&&set patchPhotosAPK=1&&goto patchAmz

if %fchoice%==P2 set restoreAmazonFiles=0&&set patchSettingsAPK=1&&goto patchAmz
if %fchoice%==p2 set restoreAmazonFiles=0&&set patchSettingsAPK=1&&goto patchAmz

if %fchoice%==P2R set restoreAmazonFiles=1&&set patchSettingsAPK=1&&goto patchAmz
if %fchoice%==P2r set restoreAmazonFiles=1&&set patchSettingsAPK=1&&goto patchAmz
if %fchoice%==p2R set restoreAmazonFiles=1&&set patchSettingsAPK=1&&goto patchAmz
if %fchoice%==p2r set restoreAmazonFiles=1&&set patchSettingsAPK=1&&goto patchAmz

if %fchoice%==Z goto resetADB
if %fchoice%==z goto resetADB
if %fchoice%==ZS set adbServerAction=1&&goto resetADB
if %fchoice%==Zs set adbServerAction=1&&goto resetADB
if %fchoice%==zS set adbServerAction=1&&goto resetADB
if %fchoice%==zs set adbServerAction=1&&goto resetADB
if %fchoice%==ZK set adbServerAction=2&&goto resetADB
if %fchoice%==Zk set adbServerAction=2&&goto resetADB
if %fchoice%==zK set adbServerAction=2&&goto resetADB
if %fchoice%==zk set adbServerAction=2&&goto resetADB
if %fchoice%==R %adb% reboot
if %fchoice%==r %adb% reboot
::if %fchoice%==11 %adb% shell setprop sys.powerctl reboot
if %fchoice%==Rr %adb% reboot recovery
if %fchoice%==RR %adb% reboot recovery
if %fchoice%==rR %adb% reboot recovery
if %fchoice%==rr %adb% reboot recovery
if %fchoice%==Rb %adb% reboot bootloader
if %fchoice%==RB %adb% reboot bootloader
if %fchoice%==rB %adb% reboot bootloader
if %fchoice%==rb %adb% reboot bootloader
::if %fchoice%==12 %adb% shell setprop sys.powerctl reboot,recovery
if %fchoice%==S goto takeSS
if %fchoice%==s goto takeSS
if %fchoice%==SV set ssViewer=1&&goto takeSS
if %fchoice%==Sv set ssViewer=1&&goto takeSS
if %fchoice%==sV set ssViewer=1&&goto takeSS
if %fchoice%==sv set ssViewer=1&&goto takeSS
if %fchoice%==D goto killAds
if %fchoice%==d goto killAds
if %fchoice%==F goto fsInstall
if %fchoice%==f goto fsInstall
if %fchoice%==FI set installFireStopperSetting=1&&goto fsInstall
if %fchoice%==Fi set installFireStopperSetting=1&&goto fsInstall
if %fchoice%==fI set installFireStopperSetting=1&&goto fsInstall
if %fchoice%==fi set installFireStopperSetting=1&&goto fsInstall
if %fchoice%==FIS set installFireStopperSetting=2&&goto fsInstall
if %fchoice%==FIs set installFireStopperSetting=2&&goto fsInstall
if %fchoice%==Fis set installFireStopperSetting=2&&goto fsInstall
if %fchoice%==fIs set installFireStopperSetting=2&&goto fsInstall
if %fchoice%==fiS set installFireStopperSetting=2&&goto fsInstall
if %fchoice%==fis set installFireStopperSetting=2&&goto fsInstall
::if %fchoice%==T goto termInstall
::if %fchoice%==t goto termInstall
::if %fchoice%==TI set installTerminalSetting=1&&goto termInstall
::if %fchoice%==Ti set installTerminalSetting=1&&goto termInstall
::if %fchoice%==tI set installTerminalSetting=1&&goto termInstall
::if %fchoice%==ti set installTerminalSetting=1&&goto termInstall
::if %fchoice%==TIS set installTerminalSetting=2&&goto termInstall
::if %fchoice%==TIs set installTerminalSetting=2&&goto termInstall
::if %fchoice%==Tis set installTerminalSetting=2&&goto termInstall
::if %fchoice%==tIs set installTerminalSetting=2&&goto termInstall
::if %fchoice%==tiS set installTerminalSetting=2&&goto termInstall
::if %fchoice%==tis set installTerminalSetting=2&&goto termInstall
if %fchoice%==V goto hotspot
if %fchoice%==v goto hotspot
if %fchoice%==B goto menu
if %fchoice%==b goto menu
if %fchoice%==X goto end
if %fchoice%==x goto end

goto fixesMenu


:gplay

%runShellTerminate% "extras-install-play-store.cmd"

goto reset

:onlyRom

set doLaunchTWRPInstaller=0

goto twrpMenu


:hotspot

taskkill /f /im VirtualRouter.exe
taskkill /f /im VirtualRouterHostConsole.exe

::%runShellTerminate% %virtualRouterCMD%
%runShellTerminate% %virtualRouterGUI%

goto fixesMenu


:antiBrick

%_color% 0a

cls
echo Running Anti-Brick Protection Commands....
echo.
echo.
echo.

:: Modify Permissions

:: /data/
%shell% "su -c chmod 777 /data/"
%shell% "su -c chmod 777 /data/app/"
%shell% "su -c chmod 777 /data/dalvik-cache/"
%shell% "su -c chmod 777 /data/data/"
%shell% "su -c chmod 777 /data/local/"
%shell% "su -c chmod 777 /data/media"
%shell% "su -c chmod 777 /data/media/0"
%shell% "su -c chmod 777 /data/misc/wifi"
%shell% "su -c chmod 777 /data/misc/wifi/*.*"
%shell% "su -c chmod 777 /data/system/cache/"
%shell% "su -c chmod 777 /data/system/users/"
%shell% "su -c chmod 777 /data/system/users/0"
%shell% "su -c chmod 777 /data/system/users/0/*.*"
%shell% "su -c chmod 777 /data/user/"
%shell% "su -c chmod 777 /data/user/0"

%shell% "su -c chmod -R 777 /data/app/"
%shell% "su -c chmod -R 777 /data/dalvik-cache/"
%shell% "su -c chmod -R 777 /data/data/"
%shell% "su -c chmod -R 777 /data/user/0"



:: /system/
%shell% "su -c chmod 777 /system/bin/"
%shell% "su -c chmod 777 /system/xbin/"


:: /cache/
:: Try Recursive First
%shell% "su -c chmod -R 777 /cache/"

:: Safety Net
%shell% "su -c chmod 777 /cache/"
%shell% "su -c chmod 777 /cache/dalvik-cache/"
%shell% "su -c chmod 777 /cache/dalvik-cache/arm/"
%shell% "su -c chmod 777 /cache/lost+found/"
%shell% "su -c chmod 777 /cache/recovery/"

goto menu


:doTWRP
%_color% 0b
if not exist "%temp%\firestick-loader\roms" md  "%temp%\firestick-loader\roms"
if not exist "%temp%\firestick-loader\roms\stick" md  "%temp%\firestick-loader\roms\stick"

cls
echo Copying TWRP Custom Recovery To Device....
echo.
echo.
echo Thanks to rbox!
echo forum.xda-developers.com
echo /fire-tv/development/firetv-stick-montoya-twrp-recovery-t3521805
echo.
echo.

if %doLaunchTWRPInstaller%==1 %push% "%~dp0recovery\stick\montoya_recovery_v1.zip" /%sdcard%/
::%push% "%~dp0recovery\stick\montoya_recovery_v1.zip" /data/local/tmp/


:twrpMenu
%_color% 0b
if not exist "%temp%\firestick-loader\roms" md  "%temp%\firestick-loader\roms"
if not exist "%temp%\firestick-loader\roms\stick" md  "%temp%\firestick-loader\roms\stick"

set twrpChoice=1
set twrpVersion=5.0.5

cls
%_color% 0e
echo Choose a pre-rooted stock ROM to copy to device and press ENTER:
echo.
echo Default Version: 5.0.5
echo.
echo.
%_color% 0b
echo 1) 5.0.5
echo.
echo 2) 5.2.1.1
echo.
echo 3) 5.2.4.1
echo.
echo 4) 5.2.6.0
echo.
echo 5) 5.2.6.2
echo.
echo.
set /p twrpChoice=

if %twrpChoice% gtr 5 goto twrpMenu

if %twrpChoice%==1 set twrpVersion=5.0.5
if %twrpChoice%==1 goto trwp505
if %twrpChoice%==2 set twrpVersion=5.2.1.1
if %twrpChoice%==2 goto trwp5211
if %twrpChoice%==3 set twrpVersion=5.2.4.1
if %twrpChoice%==3 goto trwp5241
if %twrpChoice%==4 set twrpVersion=5.2.6.0
if %twrpChoice%==4 goto trwp5260
if %twrpChoice%==5 set twrpVersion=5.2.6.2
if %twrpChoice%==5 goto trwp5262

:: Default choice safety net
goto trwp505


:trwp505
cls
echo Copying Pre-Rooted 5.0.5 Rom To Device....
echo.
echo.
echo Thanks to rbox!
echo forum.xda-developers.com
echo /fire-tv/development/firetv-stick-montoya-twrp-recovery-t3521805
echo.
echo.

%extractRAR% "%~dp0roms\stick\5.0.5\5.0.5-stock-rooted.split" "%temp%\firestick-loader\roms\stick"
%push% "%temp%\firestick-loader\roms\stick\montoya-5.0.5-rooted_r1.zip" /%sdcard%/
goto twrpGo


:trwp5211
cls
echo Copying Pre-Rooted 5.2.1.1 Rom To Device....
echo.
echo.
echo Thanks to rbox!
echo forum.xda-developers.com
echo /fire-tv/development/firetv-stick-montoya-twrp-recovery-t3521805
echo.
echo.
::pause
%extractRAR% "%~dp0roms\stick\5.2.1.1\5.2.1.1-stock-rooted.split" "%temp%\firestick-loader\roms\stick"
%push% "%temp%\firestick-loader\roms\stick\montoya-5.2.1.1-rooted_r1.zip" /%sdcard%/
goto twrpGo


:trwp5241
cls
echo Copying Pre-Rooted 5.2.4.1 Rom To Device....
echo.
echo.
echo Thanks to rbox!
echo forum.xda-developers.com
echo /fire-tv/development/firetv-stick-montoya-twrp-recovery-t3521805
echo.
echo.
::pause
%extractRAR% "%~dp0roms\stick\5.2.4.1\5.2.4.1-stock-rooted.split" "%temp%\firestick-loader\roms\stick"
%push% "%temp%\firestick-loader\roms\stick\montoya-5.2.4.1-rooted_r2.zip" /%sdcard%/
goto twrpGo


:trwp5260
cls
echo Copying Pre-Rooted 5.2.6.0 Rom To Device....
echo.
echo.
echo Thanks to rbox!
echo forum.xda-developers.com
echo /fire-tv/development/firetv-stick-montoya-twrp-recovery-t3521805
echo.
echo.
::pause
%extractRAR% "%~dp0roms\stick\5.2.6.0\5.2.6.0-stock-rooted.split" "%temp%\firestick-loader\roms\stick"
%push% "%temp%\firestick-loader\roms\stick\montoya-5.2.6.0-rooted_r1.zip" /%sdcard%/
goto twrpGo


:trwp5262
cls
echo Copying Pre-Rooted 5.2.6.2 Rom To Device....
echo.
echo.
echo Thanks to rbox!
echo forum.xda-developers.com
echo /fire-tv/development/firetv-stick-montoya-twrp-recovery-t3521805
echo.
echo.
::pause
%extractRAR% "%~dp0roms\stick\5.2.6.2\5.2.6.2-stock-rooted.split" "%temp%\firestick-loader\roms\stick"
%push% "%temp%\firestick-loader\roms\stick\montoya-5.2.6.2-rooted_r1.zip" /%sdcard%/
goto twrpGo


:twrpGo
%sleep% 10

cls
echo Launching TWRP Custom Recovery....
echo.
echo.
echo Thanks to rbox!
echo forum.xda-developers.com
echo /fire-tv/development/firetv-stick-montoya-twrp-recovery-t3521805
echo.
echo.
if %doLaunchTWRPInstaller%==1 %shell% "su -c sh /data/media/0/montoya_recovery_v1.zip"
::pause
%sleep% 5

:: Boot Into TWRP Recovery
%adb% reboot

%sleep% 6

:adbMouse
:: Trying to issue ADB Mouse command
::%shell% mouse
%runShellNoTerminateAndWait% %shell%

%_color% 0b

cls
echo Once in TWRP Recovery Take The Following Actions:
echo.
echo.
echo ** Get MOUSE Control Over ADB Connection **
echo.
echo.** Type "mouse" Without Quotes Into Spawned Shell Window
echo.
echo.
%_color% 0e
echo - Make A Backup of Current System
echo.
echo - Wipe system, data, and cache Partitions
echo.
echo - Install One of These Roms or a Custom One
echo.
echo     - "montoya-5.0.5-rooted_r1.zip"
echo     - "montoya-5.2.1.1-rooted_r1.zip"
echo.
echo - Reboot
echo.
echo.
echo.
echo.
%_color% 0d
echo Press "M" to get mouse control if it fails
echo.
%_color% 0a
echo Press "D" and ENTER Once All Steps Are Completed
echo.
echo.

set /p twrpActive=

if %twrpActive%==M goto adbMouse
if %twrpActive%==m goto adbMouse

if %twrpActive%==D set doNothing=1
if %twrpActive%==d set doNothing=1

%adbWait%

goto menu


:cacheFix

:: Try Recursive First
%shell% "su -c chmod -R 777 /cache/"

:: Safety Net
%shell% "su -c chmod 777 /cache"
%shell% "su -c chmod 777 /cache/dalvik-cache"
%shell% "su -c chmod 777 /cache/dalvik-cache/arm"
%shell% "su -c chmod 777 /cache/lost+found"
%shell% "su -c chmod 777 /cache/recovery"

goto fixesMenu



:patchAmz

::cls
::echo patchPhotosAPK: %patchPhotosAPK%
::echo patchSettingsAPK: %patchSettingsAPK%
::echo.
::echo restoreAmazonFiles: %restoreAmazonFiles%
::echo.
::echo.
::pause

if %patchPhotosAPK%==1 (

	goto patchPhotos

)

if %patchSettingsAPK%==1 (

	goto patchSettings

)

:: Reset Patch Flags
set patchPhotosAPK=0
set patchSettingsAPK=0

goto fixesMenu



:patchPhotos

if %restoreAmazonFiles%==0 (

	%push% "%~dp0config\system\priv-app\com.amazon.bueller.photos\orig\com.amazon.bueller.photos__5.2.1.1.apk" /data/local/tmp/com.amazon.bueller.photos.apk

)

if %restoreAmazonFiles%==1 (

	%push% "%~dp0config\system\priv-app\com.amazon.bueller.photos\orig\com.amazon.bueller.photos__5.0.5.apk" /data/local/tmp/com.amazon.bueller.photos.apk

)

%push% "%~dp0scripts\patch-amazon-photos-apk.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/patch-amazon-photos-apk.sh"
%shell% "su -c sh /data/local/tmp/patch-amazon-photos-apk.sh"

set restoreAmazonFiles=0

:: Reset Patch Flags
set patchPhotosAPK=0

goto patchAmz



:patchSettings

if %restoreAmazonFiles%==0 (

	%push% "%~dp0config\system\priv-app\com.amazon.tv.settings\com.amazon.tv.settings__5.0.5.apk" /data/local/tmp/com.amazon.tv.settings.apk

)

if %restoreAmazonFiles%==1 (

	%push% "%~dp0config\system\priv-app\com.amazon.tv.settings\orig\com.amazon.tv.settings__5.0.5.apk" /data/local/tmp/com.amazon.tv.settings.apk

)

%push% "%~dp0scripts\patch-amazon-settings-apk.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/patch-amazon-settings-apk.sh"
%shell% "su -c sh /data/local/tmp/patch-amazon-settings-apk.sh"

set restoreAmazonFiles=0

:: Reset Patch Flags
set patchSettingsAPK=0

goto patchAmz



:resetADB

if %adbServerAction%==0 (

	%adb% kill-server

	%sleep% 3

	%adb% start-server

)

if %adbServerAction%==1 (

	%adb% start-server

)

if %adbServerAction%==2 (

	%adb% kill-server

)

set adbServerAction=0


goto fixesMenu



:fsInstall

if %installFireStopperSetting%==1 (

	%uninstall% com.firepwn.home.montoya
	
	%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/
	
	%install% "%~dp0apps\home\FirePwnHome.apk"
	
	set installFireStopperSetting=0

)

if %installFireStopperSetting%==2 (

	%uninstall% com.firepwn.home.montoya

	%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/

	%push% "%~dp0apps\home\FirePwnHome.apk" /data/local/tmp/

	%push% "%~dp0scripts\firepwn-home-as-system.sh" /data/local/tmp/
	%shell% "su -c chmod 755 /data/local/tmp/firepwn-home-as-system.sh"
	%shell% "su -c sh /data/local/tmp/firepwn-home-as-system.sh"
	
	set installFireStopperSetting=0

)

::%launchFireStarter%
%launchFirePwnHome%

goto fixesMenu


:termInstall

if %installTerminalSetting%==1 (

	%uninstall% jackpal.androidterm
	
	%install% "%~dp0apps\system\terminal.apk"
	
	set installTerminalSetting=0

)

if %installTerminalSetting%==2 (

	%uninstall% jackpal.androidterm

	%push% "%~dp0apps\system\terminal.apk" /data/local/tmp/

	%push% "%~dp0scripts\terminal-as-system.sh" /data/local/tmp/
	%shell% "su -c chmod 755 /data/local/tmp/terminal-as-system.sh"
	%shell% "su -c sh /data/local/tmp/terminal-as-system.sh"
	
	set installTerminalSetting=0

)

%launchTerminal%

goto fixesMenu



:allowSU

if %suType%==kingroot (

	%sleep% 1
	%keyArrowRight%
	%keyArrowRight%
	%keyArrowRight%
	%keyArrowRight%
	%keyArrowRight%
	%sleep% 1
	%keyEnter%

)

if %suType%==supersu (

	%sleep% 1
	%keyArrowDown%
	%sleep% 1
	%keyArrowRight%
	%keyArrowRight%
	%sleep% 1
	%keyEnter%

)


goto fixesMenu



:takeSS


if %ssViewer%==0 ( 
	cls
	echo Capturing Device Screen....
	echo.
	echo.


	%adb% shell screencap %capDevice%

	%sleep% 1

	%adb% pull %capDevice% %tempHost%

	%capHost%
	
	goto fixesMenu
)

if %ssViewer%==1 ( 
	
	%runShellTerminate% "%~dp0scripts\misc\screen-viewer.cmd"
	set ssViewer=0
	
)

goto fixesMenu



:killAds

cls
%shell% "rm /data/local/tmp/hosts"
::%push% "%~dp0misc\hosts.adfree" /data/local/tmp/hosts
%push% "%~dp0misc\hosts.adfree.ota.disabled" /data/local/tmp/hosts
%push% "%~dp0scripts\disable-ads.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/disable-ads.sh"
%shell% "su -c sh /data/local/tmp/disable-ads.sh"

goto fixesMenu



:eventmap

%runShellTerminate% "%~dp0eventmap.cmd"

goto fixesMenu


:cleanSD

if %cleanEntireSdCard%==0 (

	cls
	echo Cleaning /%sdcard%/Android/data/org.xbmc.kodi/ Directory....
	echo.
	echo.

	%sleep% 2

	%adb% shell rm -rf /%sdcard%/Android/data/org.xbmc.kodi/*
	
	set cleanEntireSdCard=0
	
	goto menu

)

if %cleanEntireSdCard%==1 (

	cls
	echo Cleaning /%sdcard%/ Partition....
	echo.
	echo.

	%sleep% 2

	%adb% shell rm -rf /%sdcard%/*
	
	set cleanEntireSdCard=0
	
	goto menu

)

goto menu


:checkCanRoot

set firstCheck=1

set checkFireOsInfoText=1

::%pull% %buildDotProp% "%temp%"

%shell% "cat /system/build.prop | grep ro.build.version.name>/sdcard/fireos-version.txt"

%pull% /sdcard/fireos-version.txt "%temp%"

::findstr 5.2.1.1 "%temp%\fireos-version.txt"

for /f "tokens=3 delims= " %%f in ('type "%temp%\fireos-version.txt"') do set fireOsVersion=%%f

if %fireOsVersion%==0.0.0.0 set rootable=0
if %fireOsVersion%==0.0.0.0 set rootableColor=0c
if %fireOsVersion%==0.0.0.0 set rootableText=INVALID

if %fireOsVersion%==5.0.0 set rootable=1
if %fireOsVersion%==5.0.0 set rootableColor=0a
if %fireOsVersion%==5.0.0 set rootableText=EXPLOITABLE

if %fireOsVersion%==5.0.5 set rootable=1
if %fireOsVersion%==5.0.5 set rootableColor=0a
if %fireOsVersion%==5.0.5 set rootableText=EXPLOITABLE

if %fireOsVersion%==5.0.5.1 set rootable=1
if %fireOsVersion%==5.0.5.1 set rootableColor=0a
if %fireOsVersion%==5.0.5.1 set rootableText=EXPLOITABLE

if %fireOsVersion%==5.2.1.0 set rootable=1
if %fireOsVersion%==5.2.1.0 set rootableColor=0a
if %fireOsVersion%==5.2.1.0 set rootableText=EXPLOITABLE

if %fireOsVersion%==5.2.1.1 set rootable=0
if %fireOsVersion%==5.2.1.1 set rootableColor=0c
if %fireOsVersion%==5.2.1.1 set rootableText=NOT EXPLOITABLE

if %fireOsVersion%==5.2.4.0 set rootable=0
if %fireOsVersion%==5.2.4.0 set rootableColor=0c
if %fireOsVersion%==5.2.4.0 set rootableText=NOT EXPLOITABLE

del /f /s /q "%temp%\fireos-version.txt"

goto menu



:installRoot
cls
%_color% 0c
echo DO NOT TOUCH ANY KEYS ON THE FIRESTICK REMOTE UNTIL FINISHED!!!
echo.
echo.
%_color% 0e

:: Install KingoRoot
cls
echo Installing KingRoot....
echo.
echo.

%install% %kingrootAPK%

%sleep% 8

if %rootAfterInstall%==1 goto root

if %fullAutoMode%==1 goto root

::pause

goto menu


:root

cls
%_color% 0c
echo DO NOT TOUCH ANY KEYS ON THE FIRESTICK REMOTE UNTIL FINISHED!!!
echo.
echo.
%_color% 0e

%amStart% com.kingroot.kinguser/.activitys.SliderMainActivity
::%amStart% com.firepwn.firestick/.activitys.SliderMainActivity

if %firstTimeRootAttempt%==1 (

	%sleep% 10
)

if %firstTimeRootAttempt%==0 (

	%sleep% 5
)

:root1
cls
%_color% 0c
echo DO NOT TOUCH ANY KEYS ON THE FIRESTICK REMOTE UNTIL FINISHED!!!
echo.
echo.
echo.
%_color% 0b
echo *** IF THE USB CONNECTION IS LOST, NAVIGATE ON THE FIRESTICK
echo TO SETTINGS - SYSTEM - DEVELOPER OPTIONS - ADB DEBUGGING AND TURN
echo THIS OPTION OFF AND BACK ON AGAIN TO CONTINUE ***
echo.
echo.
%_color% 0e

:: Swipe 1st Page Up
if %firstTimeRootAttempt%==1 (

	%swipeUp%
	%sleep% 5
)

:: Swipe 2nd Page Up
if %firstTimeRootAttempt%==1 (

	%swipeUp%
	%sleep% 5
)

:: Tab over to button
if %firstTimeRootAttempt%==1 (

	%keyTab%
	%sleep% 2
)

:: Press ENTER on button
if %firstTimeRootAttempt%==1 (

	%keyEnter%
)

:: Wait for app to load
if %firstTimeRootAttempt%==1 (

	%sleep% 15
)

:: Wait for app to load
if %firstTimeRootAttempt%==0 (

	%sleep% 5
)

:root2
%swipeUp%
%swipeUp%
%swipeUp%
%swipeUp%

:: Tab over to button
%keyTab%
%sleep% 2

:: Press ENTER on button
%keyEnter%
%sleep% 2

%sleep% 5

%keyTab%
%sleep% 1

%keyEnter%
%sleep% 1

set firstTimeRootAttempt=0

:rootActive
set check=0
cls
%_color% 0e
echo KingRoot should be rooting device!
echo.
echo.
echo When you see the "Security Index 78" screen, press ENTER....
echo.
echo.
echo If this is not the case, close script and any active apps, then re-run script!
echo.
echo.
%_color% 0c
echo *** IF IT REBOOTS, DO NOT CONTINUE UNTIL A PASS/FAIL MESSAGE IS SEEN!! ***
echo.
echo.
echo *** IF THE ROOTING FAILS, OR GETS STUCK, 
echo PRESS ENTER TO RETURN TO MENU AND TRY AGAIN ***
echo.
echo.
%_color% 0b
echo *** YOU MAY ALSO PRESS "S" TO SPAWN A NEW CMD WINDOW AND
echo ISSUE AN "ADB SHELL" and "SU" COMMAND AROUND 27%% TO SPEED THINGS UP***
echo.
echo *** IF THE WINDOW IMMEDIATELY DISAPPEARS, THEN
echo THAT MEANS THE ROOTING HAS NOT YET FINISHED, IF SO, JUST WAIT ***
echo.
echo.
%_color% 0c
echo *** BE SURE TO ALLOW SU PERMISSIONS WHEN REQUESTED FOR ADB ***
echo.
echo.
%_color% 0b
echo *** TO RE-LAUNCH KINGROOT AND CLICK BUTTON, TYPE "R" AND PRESS ENTER ***
echo.
%_color% 0b
echo *** TO CLEAR CACHE (REMOVE DOWNLOADED UPDATE), TYPE "C" AND PRESS ENTER ***
echo.
echo.
echo.
%_color% 0e
echo *** TO LAUNCH PC VERSION, TYPE "PC" AND PRESS ENTER ***
echo.
echo.
%_color% 0e

set /p check=

if %check%==S %runShellTerminate% ""%~dp0bin\adb.exe" shell "su""
if %check%==s %runShellTerminate% ""%~dp0bin\adb.exe" shell "su""
if %check%==S goto rootActive
if %check%==s goto rootActive

if %check%==C %runShellTerminate% ""%~dp0bin\adb.exe" shell "su rm -f /cache/*.*""
if %check%==c %runShellTerminate% ""%~dp0bin\adb.exe" shell "su rm -f /cache/*.*""
if %check%==C goto rootActive
if %check%==c goto rootActive

if %check%==R %keyHome%
if %check%==r %keyHome%
if %check%==R %sleep% 1
if %check%==r %sleep% 1
if %check%==R %amStart% com.kingroot.kinguser/.activitys.SliderMainActivity
if %check%==r %amStart% com.kingroot.kinguser/.activitys.SliderMainActivity
if %check%==R %sleep% 5
if %check%==r %sleep% 5
if %check%==R %amStart% com.kingroot.kinguser/.activitys.SliderMainActivity
if %check%==r %amStart% com.kingroot.kinguser/.activitys.SliderMainActivity
if %check%==R goto root2
if %check%==r goto root2

if %check%==pc taskkill /f /im KingRoot.exe
if %check%==pc taskkill /f /im doom.exe
if %check%==pc taskkill /f /im kdriver.exe
if %check%==pc taskkill /f /im SuInstall.exe
if %check%==pc taskkill /f /im winencrypt.exe
if %check%==pc %kingrootPC%
if %check%==pc goto rootActive

::if %check%==0 goto menu
::goto downgrade

::%keyBack%
%keyHome%

:: Removing Purify
%uninstall% com.kingstudio.purify

:: Removing Tencent Video Crap
%uninstall% com.tencent.qqlive

:: Removing PC Helper Files
%uninstall% com.kingroot.krhelper4pc

%sleep% 3

"%~dp0bin\adb.exe" shell "su rm -f /cache/*.*"

%keyHome%

%adbKill%

taskkill /f /im KingRoot.exe
taskkill /f /im doom.exe
taskkill /f /im kdriver.exe
taskkill /f /im SuInstall.exe
taskkill /f /im winencrypt.exe

if %fullAutoMode%==1 goto doSU
if %fullAutoModeDG%==1 goto doSU
if %fullAutoModeDG%==2 goto doSU

%adb% reboot

goto menu


:doSU

%amStart% com.kingroot.kinguser/.activitys.SliderMainActivity

%sleep% 5

::%shell% "su"
%runShellTerminate% ""%~dp0bin\adb.exe" shell "su""

if %doAcceptSuAfterRequest%==1 (
	
	cls
	%_color% 0e
	echo Find the new open window!
	echo.
	echo.
	echo.
	echo The request should be accepted automatically.
	echo.
	echo.
	%_color% 0b
	echo *** IF REQUEST IS NOT AUTO ACCEPTED YOU CAN CLICK ALLOW MANUALLY ***
	echo.
	echo.
	echo.
	%_color% 0e
	echo You can the new window after you see a hash [#] symbol
	echo.
	echo.
	%sleep% 5
	%keyArrowRight%
	%keyArrowRight%
	%keyArrowRight%
	%keyArrowRight%
	%keyArrowRight%
	%keyEnter%
	
	set doAcceptSuAfterRequest=0
	
	goto menu

)

cls
%_color% 0e
echo Find the new open window!
echo.
echo.
%_color% 0c
echo *** BE SURE TO ALLOW SU PERMISSIONS WHEN REQUESTED FOR ADB ***
echo.
echo.
%_color% 0e
echo It should display a hash symbol [#]
echo.
echo If a dollar sign [$] is shown or an error occurs, restart device and try again
echo.
echo If the hash is displayed, you may close the window and continue
echo.
echo.
%_color% 0b
echo *** IF THE USB CONNECTION IS LOST, NAVIGATE ON THE FIRESTICK
echo TO SETTINGS - SYSTEM - DEVELOPER OPTIONS - ADB DEBUGGING AND TURN
echo THIS OPTION OFF AND BACK ON AGAIN TO CONTINUE ***
echo.
%_color% 0e
echo.
echo.
echo Press ENTER when you are ready to continue....
echo.
echo.

pause>nul

:: Root Authorization Button
::%tap% 100 1100

%keyHome%

:: Temp Fix Until SuperSU Works Properly
::if %fullAutoMode%==1 goto superSU
::if %fullAutoModeDG%==1 goto superSU
if %fullAutoModeDG%==1 goto downgrade
if %fullAutoModeDG%==2 goto noOTA
if %fullAutoMode%==1 goto noOTA

goto menu



:superSU

:: Install SuperSu
set apk="rooting\king2su\Superuser.apk"
set app=SuperSU

cls
echo Installing %app%....
echo.
echo.
echo.
%_color% 0c
echo *** BE SURE TO ALLOW SU PERMISSIONS WHEN REQUESTED FOR ADB ***
%_color% 0e
echo.
echo.

%push% "%~dp0rooting\king2su\busybox" /data/local/tmp/
%push% "%~dp0rooting\king2su\su" /data/local/tmp/
%push% "%~dp0rooting\king2su\superuser.apk" /data/local/tmp/
%push% "%~dp0rooting\king2su\99-supersu.sh" /data/local/tmp/
%push% "%~dp0rooting\king2su\99SuperSUDaemon" /data/local/tmp/
%push% "%~dp0rooting\king2su\chattr" /data/local/tmp/
%push% "%~dp0rooting\king2su\chattr.arm" /data/local/tmp/
%push% "%~dp0rooting\king2su\chattr.pie" /data/local/tmp/
%push% "%~dp0rooting\king2su\install-recovery.sh" /data/local/tmp/
%push% "%~dp0rooting\king2su\otasurvival.sh" /data/local/tmp/
%push% "%~dp0rooting\king2su\supolicy" /data/local/tmp/


if %superSuReinstall%==0 (
%shell% "su -c rm /data/local/tmp/king2su.sh"
%push% "%~dp0rooting\king2su\king2su.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/king2su.sh"
%shell% "su -c sh /data/local/tmp/king2su.sh"
)

if %superSuReinstall%==1 (
%shell% "su -c rm /data/local/tmp/install-supersu.sh"
%push% "%~dp0rooting\king2su\install-supersu.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/install-supersu.sh"
%shell% "su -c sh /data/local/tmp/install-supersu.sh"
)

::pause

%sleep% 3

set superSuSuccess=0

cls
echo Was the SuperSU installation successful? [Y/N]:
echo.
echo.

set /p superSuSuccess=

if %superSuSuccess%==Y set superSuReinstall=0
if %superSuSuccess%==y set superSuReinstall=0
if %superSuSuccess%==N set superSuReinstall=1&&goto superSU
if %superSuSuccess%==n set superSuReinstall=1&&goto superSU

::%adb% reboot

::%amStart% darkslide.com.supersumepro/.MainActivity

::%amStart% eu.chainfire.supersu/eu.chainfire.supersu.MainActivity

::%sleep% 10

::%keyEnter%

::%sleep% 3

::%keyEnter%

if %fullAutoModeDG%==1 goto downgrade
if %fullAutoModeDG%==2 goto busybox
if %fullAutoMode%==1 goto busybox

goto menu



:killTheKing

%shell% "su -c rm /data/local/tmp/killking.sh"
%push% "%~dp0rooting\king2su\killking.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/killking.sh"
%shell% "su -c sh /data/local/tmp/killking.sh"

goto %returnTo%



:: Not Working Properly (Left Code For Reference)
:OLDsuperSU

:: Install SuperSU
set apk="rooting\king2su\superuser.apk"
set app=SuperSU
cls
echo Removing KingRoot and Installing %app%....
echo.
echo.

%mountRW%

:: Killing King Processes
::%killSuper% com.kingroot.RushRoot"
::%killSuper% com.kingroot.kinguser"

:: Uninstalling King Packages
%uninstall% com.kingroot.RushRoot
%uninstall% com.kingroot.kinguser

:: Removing King Files
%rmSuper% /system/app/Kinguser.apk"
%rmSuper% /system/app/Kinguser"


%killSuper% com.kingroot.master"
%uninstall% com.kingroot.master


:: Modify King Attributes
%shell% "su -c chattr -ia /system/xbin/ku.sud"
%rmSuper% /system/xbin/ku.sud"
%shell% "su -c chattr -ia /system/xbin/kugote"
%rmSuper% /system/xbin/kugote"
%shell% "su -c chattr -ia /system/xbin/su"
%rmSuper% /system/xbin/su"
%shell% "su -c chattr -ia /system/xbin/supolicy"
%rmSuper% /system/xbin/supolicy"
%shell% "su -c chattr -ia /system/xbin/supolicy"
%rmSuper% /system/xbin/supolicy"
%shell% "su -c chattr -ia /system/xbin/pidof"
%rmSuper% /system/xbin/pidof"

::pause

:: Push king2su folder to sdcard
%push% %~dp0rooting\king2su /%sdcard%/king2su


%sleep% 2

%shell% "su -c mv /%sdcard%/king2su/su /system/xbin/su"
%shell% "su -c mv /%sdcard%/king2su/su /system/xbin/daemonsu"
%shell% "su -c mv /%sdcard%/king2su/su /system/xbin/sugote"
%shell% "su -c mv /system/bin/sh /system/xbin/sugote-mksh"

%shell% "su -c chown 0.0 /system/xbin/su"
%shell% "su -c chmod 6755 /system/xbin/su"
%shell% "su -c chown 0.0 /system/xbin/sugote"
%shell% "su -c chmod 0755 /system/xbin/sugote"
%shell% "su -c chown 0.0 /system/xbin/sugote-mksh"
%shell% "su -c chmod 0755 /system/xbin/sugote-mksh"
%shell% "su -c chown 0.0 /system/xbin/daemonsu"
%shell% "su -c chmod 0755 /system/xbin/daemonsu"

:: Remove leftover King files and packages
%shell% "su -c rm -r /data/app/com.kingroot.RushRoot-1"
%shell% "su -c rm -r /data/data/com.kingroot.RushRoot"
%shell% "su -c rm -r /data/data-lib/com.kingroot.RushRoot"
%shell% "su -c rm -r /data/app/com.kingroot.kinguser-1"
%shell% "su -c rm -r /data/data/com.kingroot.kinguser"
%shell% "su -c rm -r /data/data-lib/com.kingroot.kinguser"
%shell% "su -c rm -r /data/app/com.kingroot.master-1"
%shell% "su -c rm -r /data/data/com.kingroot.master"
%shell% "su -c rm -r /data/data-lib/king"



%shell% "su -c chattr -ia /system/bin/.usr/.ku"
%rmSuper% /system/bin/.usr/.ku"
%shell% "su -c chattr -ia /system/bin/rt.sh"
%rmSuper% /system/bin/rt.sh"
%shell% "su -c chattr -ia /system/bin/su"
%rmSuper% /system/bin/su"
%shell% "su -c chattr -ia /system/bin/ddexe-ku.bak"
%rmSuper% /system/bin/ddexe-ku.bak"
%shell% "su -c chattr -ia /system/bin/ddexe"
%rmSuper% /system/bin/ddexe"
%shell% "su -c chattr -ia /system/bin/ddexe_real"
%rmSuper% /system/bin/ddexe_real"
%shell% "su -c chattr -ia /system/bin/install-recovery.sh"
%rmSuper% /system/bin/install-recovery.sh"
%shell% "su -c chattr -ia /system/bin/install-recovery.sh-ku.bak"
%rmSuper% /system/bin/install-recovery.sh-ku.bak"

:: Remove any old SuperSU instances
%uninstall% eu.chainfire.supersu

%sleep% 2

:: Install SuperSU APK
%shell% "su -c mkdir /system/app/SuperSU"
%shell% "su -c cat /%sdcard%/king2su/superuser.apk > /system/app/SuperSU/base.apk"
::%shell% "su -c chown 0.0 /system/app/SuperSU/base.apk"
%shell% "su -c chmod 0644 /system/app/SuperSU/base.apk"
::%install% %apk%

%sleep% 2



:: Cleaning up leftover files
%shell% "su -c chattr -ia /system/usr/iku/isu"
%rmSuper% /system/usr/iku/isu"

%rmSuper% /dev/reportroot"

%shell% "su -c chattr -ia /system/etc/install-recovery.sh"
%rmSuper% /system/etc/install-recovery.sh"
%shell% "su -c chattr -ia /system/etc/install_recovery.sh"

%rmSuper% /system/app/Kinguser"
%rmSuper% /data/data-lib/king"
%rmSuper% /%sdcard%/Kingroot"
%rmSuper% /%sdcard%/kr-stock-conf"


%sleep% 2

:: Launch SuperSU
%amStart% eu.chainfire.supersu/.MainActivity


goto menu



:downgrade
cls
echo Preparing Downgrade Files....
echo.
echo.

if %dgNoRoot%==0 (
	%_color% 0c
	echo *** BE SURE TO ALLOW SU PERMISSIONS WHEN REQUESTED FOR ADB ***
)

if %dgNoRoot%==1 (
	%_color% 0b
	echo *** USING MODIFIED CACHE "NO-ROOT" METHOD ***
)

echo.
echo.
echo.
%_color% 0e

%sleep% 2

:: Extract update.bin RAR files

:: Firestick
md "%temp%\firestick-loader\downgrade\stick"
::%extractRAR% "%~dp0downgrade\stick\firestick-downgrade-505.split" "%temp%\firestick-loader\downgrade\stick"

:: 5.0.5
%extractRAR% "%~dp0downgrade\stick\5.0.5\firmware-505.split" "%temp%\firestick-loader\downgrade\stick"

:: 5.0.5.1
::%extractRAR% "%~dp0downgrade\stick\5.0.5.1\firmware-5051.split" "%temp%\firestick-loader\downgrade\stick"

:: 5.2.1.0
::%extractRAR% "%~dp0downgrade\stick\5.2.1.0\firmware-5210.split" "%temp%\firestick-loader\downgrade\stick"

:: 5.2.1.1 (UNROOTABLE AS OF 20160903)
::%extractRAR% "%~dp0downgrade\stick\5.2.1.1\firmware-5211.split" "%temp%\firestick-loader\downgrade\stick"


:: Fire TV (Bueller)
md "%temp%\firetv-loader\downgrade\tv"

:: 5.0.5
::%extractRAR% "%~dp0downgrade\tv\5.0.5\firmware-505.split" "%temp%\firestick-loader\downgrade\tv"

:: 5.0.5.1
::%extractRAR% "%~dp0downgrade\tv\5.0.5.1\firmware-5051.split" "%temp%\firestick-loader\downgrade\tv"

:: 5.2.1.0
::%extractRAR% "%~dp0downgrade\tv\5.2.1.0\firmware-5210.split" "%temp%\firestick-loader\downgrade\tv"

:: 5.2.1.1 (UNROOTABLE AS OF 20160903)
::%extractRAR% "%~dp0downgrade\tv\5.2.1.1\firmware-5211.split" "%temp%\firestick-loader\downgrade\tv"


:: Fire tv2 2 (Sloane)
md "%temp%\firetv2-loader\downgrade\tv2"

:: 5.0.5
::%extractRAR% "%~dp0downgrade\tv2\5.0.5\firmware-505.split" "%temp%\firestick-loader\downgrade\tv2"

:: 5.0.5.1
::%extractRAR% "%~dp0downgrade\tv2\5.0.5.1\firmware-5051.split" "%temp%\firestick-loader\downgrade\tv2"

:: 5.2.1.0
::%extractRAR% "%~dp0downgrade\tv2\5.2.1.0\firmware-5210.split" "%temp%\firestick-loader\downgrade\tv2"

:: 5.2.1.1 (UNROOTABLE AS OF 20160903)
::%extractRAR% "%~dp0downgrade\tv2\5.2.1.1\firmware-5211.split" "%temp%\firestick-loader\downgrade\tv2"



:: Push update.bin to stick
cls
echo Pushing Downgrade files to device....
echo.
echo.

if %dgNoRoot%==0 (
	%_color% 0c
	echo *** BE SURE TO ALLOW SU PERMISSIONS WHEN REQUESTED FOR ADB ***
)

if %dgNoRoot%==1 (
	%_color% 0b
	echo *** USING MODIFIED CACHE "NO-ROOT" METHOD ***
)

echo.
echo.
echo.
%_color% 0b
echo *** IF THE USB CONNECTION IS LOST, NAVIGATE ON THE FIRESTICK
echo TO SETTINGS - SYSTEM - DEVELOPER OPTIONS - ADB DEBUGGING AND TURN
echo THIS OPTION OFF AND BACK ON AGAIN TO CONTINUE ***
echo.
echo.
%_color% 0e


:: Firestick
:: 5.0.5
%push% "%temp%\firestick-loader\downgrade\stick\update-kindle-montoya-54.5.3.7_user_537174420.bin" /%sdcard%/update.bin

:: 5.0.5.1
::%push% "%temp%\firestick-loader\downgrade\stick\update-kindle-montoya-54.5.3.7_user_537175520.bin" /%sdcard%/update.bin

:: 5.2.1.0
::%push% "%temp%\firestick-loader\downgrade\stick\update-kindle-montoya-54.5.3.7_user_550145120.bin" /%sdcard%/update.bin

:: 5.2.1.1 (UNROOTABLE AS OF 20160903)
::%push% "%temp%\firestick-loader\downgrade\stick\update-kindle-montoya-54.5.3.7_user_551203220.bin" /%sdcard%/update.bin


:: Fire TV (Bueller)
:: 5.0.5
::%push% "%temp%\firestick-loader\downgrade\tv\update-kindle-bueller-51.5.3.7_user_537174420.bin" /%sdcard%/update.bin

:: 5.0.5.1
::%push% "%temp%\firestick-loader\downgrade\tv\update-kindle-montoya-54.5.3.7_user_537175520.bin" /%sdcard%/update.bin

:: 5.2.1.0
::%push% "%temp%\firestick-loader\downgrade\tv\update-kindle-montoya-54.5.3.7_user_550145120.bin" /%sdcard%/update.bin

:: 5.2.1.1 (UNROOTABLE AS OF 20160903)
::%push% "%temp%\firestick-loader\downgrade\tv\update-kindle-montoya-54.5.3.7_user_551203220.bin" /%sdcard%/update.bin


:: Fire tv2 2 (Sloane)
:: 5.0.5
::%push% "%temp%\firestick-loader\downgrade\tv2\update-kindle-full_sloane-36.5.3.7_user_537174420.bin" /%sdcard%/update.bin

:: 5.0.5.1
::%push% "%temp%\firestick-loader\downgrade\tv2\update-kindle-montoya-54.5.3.7_user_537175520.bin" /%sdcard%/update.bin

:: 5.2.1.0
::%push% "%temp%\firestick-loader\downgrade\tv2\update-kindle-montoya-54.5.3.7_user_550145120.bin" /%sdcard%/update.bin

:: 5.2.1.1 (UNROOTABLE AS OF 20160903)
::%push% "%temp%\firestick-loader\downgrade\tv2\update-kindle-montoya-54.5.3.7_user_551203220.bin" /%sdcard%/update.bin

%sleep% 10

%rm% "%temp%\firestick-loader\downgrade\stick"
%rm% "%temp%\firestick-loader\downgrade\tv"
%rm% "%temp%\firestick-loader\downgrade\tv2"

:: Clear cache
cls
echo Cleaning current local cache....
echo.
echo.

if %dgNoRoot%==0 (
	%_color% 0c
	echo *** BE SURE TO ALLOW SU PERMISSIONS WHEN REQUESTED FOR ADB ***
)

if %dgNoRoot%==1 (
	%_color% 0b
	echo *** USING MODIFIED CACHE "NO-ROOT" METHOD ***
)

echo.
echo.
echo.
%_color% 0b
echo *** IF THE USB CONNECTION IS LOST, NAVIGATE ON THE FIRESTICK
echo TO SETTINGS - SYSTEM - DEVELOPER OPTIONS - ADB DEBUGGING AND TURN
echo THIS OPTION OFF AND BACK ON AGAIN TO CONTINUE ***
echo.
echo.

%_color% 0e

if %dgNoRoot%==0 (
	%shell% "su -c rm -f /cache/*.bin"
	%shell% "su -c rm -f /cache/*.zip"
	%shell% "su -c rm -f /cache/recovery/command"
)

if %dgNoRoot%==1 (
	%shell% "rm -f /cache/*.bin"
	%shell% "rm -f /cache/*.zip"
	%shell% "rm -f /cache/recovery/command"
)



::pause

%sleep% 1


:: Copy update.bin to cache

cls
echo Moving update.bin into local cache....
echo.
echo.

if %dgNoRoot%==0 (
	%_color% 0c
	echo *** BE SURE TO ALLOW SU PERMISSIONS WHEN REQUESTED FOR ADB ***
)

if %dgNoRoot%==1 (
	%_color% 0b
	echo *** USING MODIFIED CACHE "NO-ROOT" METHOD ***
)

echo.
echo.
echo.
%_color% 0b
echo *** IF THE USB CONNECTION IS LOST, NAVIGATE ON THE FIRESTICK
echo TO SETTINGS - SYSTEM - DEVELOPER OPTIONS - ADB DEBUGGING AND TURN
echo THIS OPTION OFF AND BACK ON AGAIN TO CONTINUE ***
echo.
echo.
%_color% 0e


if %dgNoRoot%==0 (
	%shell% "su -c mv /%sdcard%/update.bin /cache/"
)

if %dgNoRoot%==1 (
	%shell% "mv /%sdcard%/update.bin /cache/"
)

::pause

cls
echo Creating update file to trigger during recovery....
echo.
echo.

if %dgNoRoot%==0 (
	%_color% 0c
	echo *** BE SURE TO ALLOW SU PERMISSIONS WHEN REQUESTED FOR ADB ***
)

if %dgNoRoot%==1 (
	%_color% 0b
	echo *** USING MODIFIED CACHE "NO-ROOT" METHOD ***
)

echo.
echo.
echo.
%_color% 0b
echo *** IF THE USB CONNECTION IS LOST, NAVIGATE ON THE FIRESTICK
echo TO SETTINGS - SYSTEM - DEVELOPER OPTIONS - ADB DEBUGGING AND TURN
echo THIS OPTION OFF AND BACK ON AGAIN TO CONTINUE ***
echo.
echo.
%_color% 0e

::%shell% "su -c echo --update_package=/cache/update.bin > /cache/recovery/command"

if %dgNoRoot%==0 (
	echo --update_package=/cache/update.bin>"%temp%\tmpShit.txt"
	%push% "%temp%\tmpShit.txt" /%sdcard%/command
	%shell% "su -c mv /%sdcard%/command /cache/recovery/command"
	%shell% "su -c rm -f /%sdcard%/command"
)

if %dgNoRoot%==1 (
	echo --update_package=/cache/update.bin>"%temp%\tmpShit.txt"
	%push% "%temp%\tmpShit.txt" /%sdcard%/command
	%shell% "mv /%sdcard%/command /cache/recovery/command"
	%shell% "rm -f /%sdcard%/command"
)

::echo %dgNoRoot%
::pause

::%shell% mv /sdcard/update.bin /cache/

::pause

%sleep% 1

:: Write file for recovery to load
::%shell% echo --update_package=/cache/update.bin > /cache/recovery/command

::pause


:: Set flag back to 0
set dgNoRoot=0


%shell% reboot recovery


cls
echo Taking The FireStick On A Pwny Ride....
echo.
echo.
echo.
echo.
echo.
%_color% 03
echo             ,;~;,
%_color% 0b
echo                /\_
echo               (  /
%_color% 03
echo               ((),     ;,;
%_color% 0b
echo               ^|  \\  ,;;'(                     
%_color% 06
echo           __ _(  )'~;;'   \                     ^|--------------^| 
echo         /'  '\'()/~' \ /'\.)                    ^| Amazon PWND! ^|
echo      ,;(      )^|^|     ^|                         ^|              ^|
echo     ,;' \    /-(.;,   )                         ^| This Way --^> ^|     
echo          ) /       ) /                          ^|______________^|
echo         //         ^|^|                                  ^|
echo        (_\         (_\                                 ^|
%_color% 0a
echo --------------------------------------------------------------------------------
%_color% 0e
echo.
echo.


%sleep% 10


cls
%_color% 0a
echo The Downgrade Process Should Be Happening!
echo.
%_color% 0e
echo The TV screen should be on the Amazon Install screen.
echo.
echo.
%_color% 0b
echo *** If this is not the case, try restarting the device and script. ***
echo.
echo *** If you are at the Android Recovery Screen, unplug and re-plug device ***
echo.
echo.
echo.
%_color% 0c
echo *** IF THE TEXT IS MISSING AND ONLY A FIRESTICK ICON IS SHOWING,
echo THIS MAY HAPPEN AFTER SOME ROOT OPERATIONS AND WILL PERFORM NORMALLY ***
echo.
echo.
echo.
%_color% 0c
echo *** DO NOT PRESS ANY KEYS ON THE REMOTE OR UNPLUG THE DEVICE ***
echo.
echo.
echo.
%_color% 0e
echo Script will continue when at the Optimizing System Storage screen....
echo.
echo.

%sleep% 5

%adbWait%

%sleep% 40

::%adbWait%

:: Add Version Check Here 20161015

cls
%_color% 0a
echo The Downgrade Process Should Have Been Successful!
echo.
echo.
%_color% 0e
echo The TV screen should be on the Optimizing System Storage screen.
echo.
echo.
%_color% 0b
echo *** If this is not the case, try unplugging/re-plugging the device ***
echo.
echo.
echo.
echo.
%_color% 0c
echo *** DO NOT PRESS ANY KEYS ON THE REMOTE OR UNPLUG THE DEVICE ***
echo.
echo.
echo.
echo.
%_color% 0e
echo When device is back at HOME screen, press ENTER....
echo.
echo.
%_color% 0b
echo *** YOU MAY SEE THE REMOTE SYNC SCREEN INSTEAD OF HOME SCREEN ***
echo.
echo.

pause>nul

%sleep% 5

::%keyBack%
%keyHome%

cls
%_color% 0a
echo The device is now on version %dgVersion% and needs to reboot again to continue!
echo.
%_color% 0e
echo.
echo.
echo.
echo Rebooting one last time in 10 seconds....
echo.
echo.

%sleep% 10

%adb% reboot

%_color% 0e
cls
echo Rebooting....
echo.
echo.

%sleep% 15

%adbWait%

cls
echo Waiting For Boot Animation....
echo.
echo.

if %factoryReset%==0 %sleep% 25
if %factoryReset%==1 %sleep% 45

cls
echo Waiting For Home Screen To Finish Loading....
echo.
echo.
%_color% 0b
echo *** YOU MAY SEE THE REMOTE SYNC SCREEN INSTEAD OF HOME SCREEN ***
echo.
echo.
echo.
echo.
%_color% 0e
echo If the Home Screen is ready now, please wait a few moments!
echo.
echo.

if %factoryReset%==0 %sleep% 15
if %factoryReset%==1 %sleep% 20

cls
echo The device should now be at the HOME screen!
echo.
echo.
%_color% 0c
echo *** PLEASE WAIT UNTIL HOME SCREEN IS LOADED BEFORE CONTINUING ***
echo.
echo.
%_color% 0b
echo *** YOU MAY SEE THE REMOTE SYNC SCREEN INSTEAD OF HOME SCREEN ***
%_color% 0e
echo.
echo.
echo.
echo.
echo The device is now on stock firmware and needs rooted again to continue!
echo.
echo.
echo.
if %fullAutoMode%==0 echo Press ENTER to continue with the rooting process....
::if %fullAutoModeDG%==0 echo Press ENTER to continue with the rooting process....
if %fullAutoMode%==1 echo.
::if %fullAutoModeDG%==1 echo.
echo.
echo.
echo.
echo.
%_color% 0b
if %fullAutoMode%==0 echo *** YOU CAN PRESS "S" AND ENTER TO SKIP THE ROOT PROCESS ***
if %fullAutoMode%==0 echo.
if %fullAutoMode%==0 echo.
echo.
if %fullAutoMode%==0 echo *** YOU CAN PRESS "F" AND ENTER TO FACTORY RESET ***
::if %fullAutoModeDG%==0 echo *** YOU CAN ALSO PRESS "S" AND ENTER TO SKIP THE ROOT PROCESS ***
if %fullAutoMode%==1 echo *** CONTINUING AUTOMATICALLY IN 90 SECONDS ***
::if %fullAutoModeDG%==1 echo *** CONTINUING AUTOMATICALLY IN 90 SECONDS ***
%_color% 0e
echo.
echo.

:: If Full Auto Mode, sleep for a safe amount of time before continuing and skip pause
if %fullAutoMode%==1 %sleep% 90
if %fullAutoModeDG%==1 %sleep% 90
if %fullAutoMode%==1 goto skipPauseOne
if %fullAutoModeDG%==1 goto skipPauseOne

set /p rootFromDG=

:skipPauseOne

%keyHome%

%sleep% 5

::goto root

if %fullAutoModeDG%==1 set fullAutoModeDG=2
::if %fullAutoMode%==1 goto root2
if %fullAutoMode%==1 goto root

if %rootFromDG%==S goto menu
if %rootFromDG%==s goto menu

if %rootFromDG%==F set factoryReset=1&&goto fReset
if %rootFromDG%==f set factoryReset=1&&goto fReset

:: Going to last part of KingRoot since the swiping shouldn't be needed again
:: 20160821 Swipe Needed Sometimes!
if %rootFromDG%==1 goto root

goto menu


:noOTA
:: Disable Amazon Updates
cls
echo Disabling Amazon OTA Update Service....
echo.
echo.
::echo Follow these steps (NO QUOTES):
::echo.
::echo.
::echo *** OPEN A NEW COMMAND WINDOW (Hold Shift+Rt-Click) ***
::echo.
::echo.
::echo 1) Type "adb shell" and press ENTER
::echo.
::echo 2) Type "su" and press ENTER (Allow on device)
::echo.
::echo 3) Type "pm disable com.amazon.device.software.ota" and press ENTER
::echo.
::echo.

%sleep% 2

%shell% "su -c pm disable com.amazon.device.software.ota"
%shell% "su -c pm disable com.amazon.dcp"
%shell% "su -c pm disable com.amazon.device.software.ota.override"
%shell% "su -c pm disable com.amazon.settings.systemupdates"
%shell% "su -c pm disable com.amazon.settings.systemupdates/.OTAEventReceiver"

%sleep% 5

if %fullAutoModeDG%==1 goto busybox
if %fullAutoModeDG%==2 goto busybox
if %fullAutoMode%==1 goto busybox

goto menu



:brokenbusybox

set app=Busybox

cls
echo Installing %app%....
echo.
echo.

%sleep% 3

::%shell% "su -c mount -o remount,rw /system"

%push% "%~dp0rooting\king2su\busybox" /data/local/tmp/
%push% "%~dp0scripts\install-busybox.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/install-busybox.sh"
%shell% "su -c sh /data/local/tmp/install-busybox.sh"

::%shell% "su -c mount -o remount,ro /system"

%sleep% 5

goto menu



:busybox
:: Install Busybox
set apk="apps\system\busybox.apk"
set app=Busybox

if %busyboxScriptInstall%==1 (

	cls
	echo Installing %app%....
	echo.
	echo.
	%_color% 0b
	echo *** THIS OPTION IS UNDER TESTING STILL AND MAY NOT WORK PROPERLY ***
	echo.
	echo *** IF THIS OPTION DOES NOT WORK FOR YOU, USE THE GUI AUTO OPTION ***
	echo.
	%_color% 0e
	echo.
	echo Continuing In 10 Seconds....
	echo.
	echo.

	%sleep% 10

	%push% "%~dp0rooting\king2su\busybox" /data/local/tmp/
	%push% "%~dp0scripts\install-busybox.sh" /data/local/tmp/
	%shell% "su -c chmod 755 /data/local/tmp/install-busybox.sh"
	%shell% "su -c sh /data/local/tmp/install-busybox.sh"

	%sleep% 5

	goto menu

)


cls
echo Installing %app%....
echo.
echo.
echo.
%_color% 0b
echo *** IF DEVICE REBOOTS, CLOSE SCRIPT AND RUN AGAIN ***
echo.
echo.
echo.
%_color% 0c
echo *** BE SURE TO ALLOW SU PERMISSIONS UPON LAUNCH ***
echo.
echo.
%_color% 0e

%uninstall% stericson.busybox

%install% %apk%

%sleep% 2

%amStart% stericson.busybox/.Activity.MainActivity

cls
%_color% 0e
echo The Busybox installer should be open!
echo.
echo.
%_color% 0c
echo *** IF DEVICE REBOOTS, CLOSE SCRIPT AND RUN AGAIN ***
echo.
echo.
echo.
echo *** BE SURE TO ALLOW SU PERMISSIONS UPON LAUNCH ***
echo.
echo.
echo.
echo.
%_color% 0e
::echo Once BusyBox is open, click BACK on the remote to close info window!
echo.
echo.
echo.
echo.
if %fullAutoMode%==0 echo After you have finished these steps, press ENTER to continue....
if %fullAutoMode%==1 echo The script will continue automatically once install is finished....
echo.
echo.

::pause

:: Get SU Permissions
%sleep% 2
%keyArrowRight%
%keyArrowRight%
%keyArrowRight%
%keyArrowRight%
%sleep% 1
%keyEnter%

%sleep% 20

%keyHome%
%sleep% 2
%keyArrowDown%
%sleep% 1
%keyArrowDown%
%sleep% 1
%keyArrowDown%
%sleep% 1
%keyArrowDown%
%sleep% 1
%keyEnter%
%sleep% 1

cls
echo Once BusyBox installation is finished, press ENTER to continue....
echo.
echo.

if %fullAutoMode%==1 %sleep% 60
if %fullAutoModeDG%==1 %sleep% 60

if %fullAutoMode%==0 pause>nul

%keyBack%
%keyHome%
%sleep% 1


cls
echo Removing Busybox APK....
echo.
echo.
echo.
%_color% 0b
echo *** BUSYBOX INSTALLED TO THE /system/xbin, THE APK IS NO LONGER NEEDED ***
%_color% 0e
echo.
echo.

%uninstall% stericson.busybox


cls
echo Rebooting....
echo.
echo.

%adb% reboot

%sleep% 20

%adbWait%

if %fullAutoMode%==1 goto removeBloat
if %fullAutoModeDG%==1 goto removeBloat

goto menu


:launchFS

cls
echo Launching FireStopper....
echo.
echo.

%shell% am start -a de.belu.firestopper/.gui.MainActivity -n de.belu.firestopper/.gui.MainActivity

goto menu


:unrootKing

set isMouse=0

cls
echo If you have a bluetooth mouse, press M now and ENTER....
echo.
echo.
echo.
%_color% 0c
echo *** TO CONTINUE USING TEAMVIEWER, JUST PRESS ENTER ***
%_color% 0e
echo.
echo.

set /p isMouse=

if %isMouse%==M goto btMouse
if %isMouse%==m goto btMouse


set teamViewerSuRequest=0
set removeTeamViewer=0

cls
echo Preparing Files....
echo.
echo.

%uninstall% com.teamviewer.quicksupport.market
%sleep% 1
%install% "%~dp0apps\web\teamviewer.apk"

%sleep% 1

taskkill /f /im TeamViewer.exe
taskkill /f /im TeamViewer_Desktop.exe
taskkill /f /im tv_w32.exe
taskkill /f /im tv_x64.exe

%teamviewer%

%sleep% 3

:retryTV

if %removeTeamViewer%==1 %uninstall% com.teamviewer.quicksupport.market
if %removeTeamViewer%==1 %sleep% 3
if %removeTeamViewer%==1 %install% "%~dp0apps\web\teamviewer.apk"
if %removeTeamViewer%==1 taskkill /f /im TeamViewer.exe
if %removeTeamViewer%==1 taskkill /f /im TeamViewer_Desktop.exe
if %removeTeamViewer%==1 taskkill /f /im tv_w32.exe
if %removeTeamViewer%==1 taskkill /f /im tv_x64.exe
set removeTeamViewer=0
set teamViewerSuRequest=0

%amStart% com.teamviewer.quicksupport.market/com.teamviewer.quicksupport.ui.QSActivity

%sleep% 3


%teamviewer%

:: Launch Teamviewer
cls
%_color% 0e
echo Teamviewer on PC and FireStick should be open!
echo.
echo IF YOU GET A "Some Files Could Not Be Created" ERROR, CLICK OK AND CLOSE!
echo.
echo.
echo.
%_color% 0c
echo *** YOU MUST ACT FAST TO ALLOW SU PERMISSIONS ***
echo.
echo *** YOU WILL NEED TO PRESS RIGHT AND ENTER TO ALLOW PERMISSIONS ***
echo.
echo.
echo *** IF TEAMVIEWER GETS DENIED SU PERMISSIONS, PRESS R TO RETRY ***
echo.
echo.
echo.
%_color% 0e
echo Login to FireStick from PC, press Allow for Client and then SU Request
echo.
echo Once you have remote control access, press ENTER to continue....
echo.
echo.

set /p teamViewerSuRequest=

if %teamViewerSuRequest%==R set removeTeamViewer=1
if %teamViewerSuRequest%==r set removeTeamViewer=1

if %teamViewerSuRequest%==R goto retryTV
if %teamViewerSuRequest%==r goto retryTV



cls
echo Loading KingRoot....
echo.

%amStart% com.kingroot.kinguser/.activitys.SliderMainActivity

::%sleep% 3
::%swipeUp%
::%sleep% 2
::%swipeUp%
::%sleep% 2
::%keyTab%
%sleep% 2
::%keyEnter%

cls
%_color% 0e
echo KingRoot should be open!
echo.
echo.
%_color% 0c
echo *** IF THE PC TEAMVIEWER REMOTE SCREEN GOES BLANK, TRY RECONNECTING ***
echo.
echo.
echo *** TRY DIRECTLY CLICKING THE REMOTE VIEWER WINDOW ON FIRESTICK SCREEN ***
echo.
echo.
echo.

:btMouse
set teamViewerSuRequest=0
%_color% 0e
if %isMouse%==0 echo Using Teamviewer, select the top-right menu and click "General Settings"
if %isMouse%==M cls
if %isMouse%==m cls
if %isMouse%==M echo In KingRoot, select the top-right menu and click "General Settings"
if %isMouse%==m echo In KingRoot, select the top-right menu and click "General Settings"
echo.
echo.
echo.
echo Then click "Uninstall KingRoot" option and press CONTINUE, then OK on dialogs
echo.
echo.
%_color% 0c
if %isMouse%==0 echo *** IF TEAMVIEWER GETS DENIED SU PERMISSIONS, PRESS R TO RETRY ***
echo.
echo.
%_color% 0e
echo When unrooting is finished, press ENTER....
echo.
echo.

set /p teamViewerSuRequest=

if %teamViewerSuRequest%==R set removeTeamViewer=1
if %teamViewerSuRequest%==r set removeTeamViewer=1

if %teamViewerSuRequest%==R goto retryTV
if %teamViewerSuRequest%==r goto retryTV


taskkill /f /im TeamViewer.exe
taskkill /f /im TeamViewer_Desktop.exe
taskkill /f /im tv_w32.exe
taskkill /f /im tv_x64.exe

%uninstall% com.teamviewer.quicksupport.market
%uninstall% com.kingroot.kinguser
%uninstall% com.tencent.qqlive
%uninstall% com.kingroot.krhelper4pc

%adb% reboot

goto menu


:bloatEnable

%push% "%~dp0scripts\debloat\bloat-enable.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/bloat-enable.sh"
%shell% "su -c sh /data/local/tmp/bloat-enable.sh

goto menu


:bloatDisable

cls
echo Making sure FireStarter is installed as a HOME Menu....
echo.
echo.
echo.
echo.
%_color% 0c
echo *** BE SURE TO ALLOW SU PERMISSIONS IF REQUESTED ***
%_color% 0e
echo.
echo.

::%install% "%~dp0apps\system\firestopper.apk"

::%uninstall% de.belu.firestopper
%uninstall% com.firepwn.home.montoya

:: FireStopper Config
::%push% "apps\system\sdcard\FireStarterBackup.zip" /sdcard/
%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/

%push% "%~dp0apps\home\FirePwnHome.apk" /data/local/tmp/

::%push% "%~dp0apps\system\firestopper.apk" /data/local/tmp/
::%shell% "su -c mkdir /system/app/FireStopper/"
::%shell% "su -c chmod 0755 /system/app/FireStopper/"
::%shell% "su -c cp /data/local/tmp/firestopper.apk" /system/app/FireStopper/FireStopper.apk"
::%shell% "su -c chmoc 0644 /system/app/FireStopper/FireStopper.apk"

%push% "%~dp0scripts\firepwn-home-as-system.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/firepwn-home-as-system.sh"
%shell% "su -c sh /data/local/tmp/firepwn-home-as-system.sh"


%shell% "su -c rm /data/local/tmp/bloat-disable.sh"

cls
%push% "%~dp0scripts\debloat\bloat-disable.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/bloat-disable.sh"
%shell% "su -c sh /data/local/tmp/bloat-disable.sh"

goto menu


:bloatRemoverOld

cls
echo Making sure FireStarter is installed as a HOME Menu....
echo.
echo.
echo.
echo.
%_color% 0c
echo *** BE SURE TO ALLOW SU PERMISSIONS IF REQUESTED ***
%_color% 0e
echo.
echo.

::%install% "%~dp0apps\system\firestopper.apk"

%uninstall% de.belu.firestopper

:: FireStopper Config
%push% "apps\system\sdcard\FireStarterBackup.zip" /sdcard/

%push% "%~dp0apps\system\firestopper.apk" /data/local/tmp/
::%shell% "su -c mkdir /system/app/FireStopper/"
::%shell% "su -c chmod 0755 /system/app/FireStopper/"
::%shell% "su -c cp /data/local/tmp/firestopper.apk" /system/app/FireStopper/FireStopper.apk"
::%shell% "su -c chmoc 0644 /system/app/FireStopper/FireStopper.apk"

%push% "%~dp0scripts\firestopper-as-system.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/firestopper-as-system.sh"
%shell% "su -c sh /data/local/tmp/firestopper-as-system.sh"


%shell% "su -c rm /data/local/tmp/full-debloat.sh"

cls
%push% "%~dp0scripts\debloat\full-debloat.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/full-debloat.sh"
%shell% "su -c sh /data/local/tmp/full-debloat.sh"

cls
echo Clear Caches and Reboot (Recommended) [Y/N]?
echo.
echo.
echo.
echo Make a choice and press ENTER:
echo.
echo.

set /p rebootAfterBloatRemovalChoice=

if %rebootAfterBloatRemovalChoice%==Y set rebootAfterBloatRemoval=1
if %rebootAfterBloatRemovalChoice%==y set rebootAfterBloatRemoval=1
if %rebootAfterBloatRemovalChoice%==Y goto clearCaches
if %rebootAfterBloatRemovalChoice%==y goto clearCaches

goto menu


:removeBloat

cls
echo Making sure FireStarter is installed as a HOME Menu....
echo.
echo.
echo.
echo.
%_color% 0c
echo *** BE SURE TO ALLOW SU PERMISSIONS IF REQUESTED ***
%_color% 0e
echo.
echo.

::%uninstall% de.belu.firestopper
%uninstall% com.firepwn.home.montoya

:: FireStopper Config
::%push% "apps\system\sdcard\FireStarterBackup.zip" /sdcard/
%push% "apps\home\sdcard\FirePwnHomeBackup.zip" /sdcard/

%push% "%~dp0apps\home\FirePwnHome.apk" /data/local/tmp/

::%push% "%~dp0apps\system\firestopper.apk" /data/local/tmp/
::%shell% "su -c mkdir /system/app/FireStopper/"
::%shell% "su -c chmod 0755 /system/app/FireStopper/"
::%shell% "su -c cp /data/local/tmp/firestopper.apk" /system/app/FireStopper/FireStopper.apk"
::%shell% "su -c chmoc 0644 /system/app/FireStopper/FireStopper.apk"

%push% "%~dp0scripts\firepwn-home-as-system.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/firepwn-home-as-system.sh"
%shell% "su -c sh /data/local/tmp/firepwn-home-as-system.sh"



::%install% "%~dp0apps\system\firestopper.apk"


::%shell% "su -c rm /data/local/tmp/bloat-remove.sh"

::cls
::%push% "%~dp0scripts\debloat\bloat-remove.sh" /data/local/tmp/
::%shell% "su -c chmod 755 /data/local/tmp/bloat-remove.sh"
::%shell% "su -c sh /data/local/tmp/bloat-remove.sh"

cls

if %fullAutoMode%==1 (
	%push% "%~dp0scripts\debloat\bloat-disable.sh" /data/local/tmp/
	%shell% "su -c chmod 755 /data/local/tmp/bloat-disable.sh"
	%shell% "su -c sh /data/local/tmp/bloat-disable.sh"
)

if %fullAutoModeDG%==1 (
	%push% "%~dp0scripts\debloat\bloat-disable.sh" /data/local/tmp/
	%shell% "su -c chmod 755 /data/local/tmp/bloat-disable.sh"
	%shell% "su -c sh /data/local/tmp/bloat-disable.sh"
)

:: Old Adblock Name
:: hosts.adfree
if %doBlockAdsWithMenuOption%==1 (

	%shell% "rm /data/local/tmp/hosts"
	%push% "%~dp0misc\hosts.adfree.ota.disabled" /data/local/tmp/hosts
	%push% "%~dp0scripts\disable-ads.sh" /data/local/tmp/
	%shell% "su -c chmod 755 /data/local/tmp/disable-ads.sh"
	%shell% "su -c sh /data/local/tmp/disable-ads.sh"

)

if %fullAutoMode%==1 goto clearCaches
if %fullAutoModeDG%==1 goto clearCaches

%push% "%~dp0scripts\debloat\full-debloat.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/full-debloat.sh"
%shell% "su -c sh /data/local/tmp/full-debloat.sh"

cls
echo Clear Caches and Reboot (Recommended) [Y/N]?
echo.
echo.
echo.
echo Make a choice and press ENTER:
echo.
echo.

set /p rebootAfterBloatRemovalChoice=

if %rebootAfterBloatRemovalChoice%==Y set rebootAfterBloatRemoval=1
if %rebootAfterBloatRemovalChoice%==y set rebootAfterBloatRemoval=1
if %rebootAfterBloatRemovalChoice%==Y goto clearCaches
if %rebootAfterBloatRemovalChoice%==y goto clearCaches

goto menu


:clearCaches

cls
echo Clearing Device Caches....
echo.
echo.
echo.
%_color% 0b
if %rebootAfterClearCache%==0 echo *** THE DEVICE SHOULD BE REBOOTED WHEN FINISHED TO REBUILD DALVIK CACHES ***
if %rebootAfterClearCache%==1 echo *** THE DEVICE WILL REBOOT WHEN FINISHED TO REBUILD DALVIK CACHES ***
if %rebootAfterBloatRemoval%==1 echo *** THE DEVICE WILL REBOOT WHEN FINISHED TO REBUILD DALVIK CACHES ***
%_color% 0e
echo.
echo.

%sleep% 5

::%shell% "su -c mount -o remount,rw /system"
::%shell% "su -c rm -rf /data/dalvik-cache/"
::%shell% "su -c rm -rf /cache/"
::%shell% "su -c rm -r /cache/dalvik-cache"
::%shell% "su -c rm -f /cache/*.apk"
::%shell% "su -c rm -f /cache/*.bin"
::%shell% "su -c rm -f /cache/signed_com.amazon.kso.blackbird-1550000810.apk"

%push% "%~dp0scripts\clear-all-caches.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/clear-all-caches.sh"
%shell% "su -c sh /data/local/tmp/clear-all-caches.sh"

%sleep% 5

if %factoryReset%==1 (

	%amStart% com.amazon.tv.settings/.tv.FactoryResetActivity
	%sleep% 3
	%keyArrowLeft%
	%sleep% 1
	%keyEnter%
	%sleep% 3
)

:: This Mode Preserves ADB Debug and WiFi Settings
if %factoryReset%==2 (

	%shell% "rm /data/local/tmp/com.amazon.tv.settings_preferences.xml"
	%shell% "rm /data/local/tmp/kingroot.apk"
	%shell% "rm /data/local/tmp/factory-reset.sh"
	%push% %kingrootAPK% /data/local/tmp/
	%push% "%~dp0config\data\com.amazon.tv.settings\shared_prefs\com.amazon.tv.settings_preferences.xml" /data/local/tmp/
	%push% "%~dp0scripts\factory-reset.sh" /data/local/tmp/
	%shell% "su -c chmod 755 /data/local/tmp/factory-reset.sh"
	%shell% "su -c sh /data/local/tmp/factory-reset.sh"
)

::pause

if %rebootAfterClearCache%==1 %adb% reboot
if %rebootAfterClearCache%==1 %adbWait%

if %rebootAfterBloatRemoval%==1 %adb% reboot
if %rebootAfterBloatRemoval%==1 %adbWait%


if %fullAutoMode%==1 (

	set pauseForClearCache=0

	%adb% reboot
	%adbWait%

	cls
	%_color% 0e
	echo The TV screen should be on the Optimizing System Storage screen.
	echo.
	echo.
	echo.
	echo When back at HOME screen, press ENTER to continue....
	echo.
	echo.

	set /p pauseForClearCache=

)

if %fullAutoMode%==1 goto unrootKing
if %fullAutoModeDG%==1 goto unrootKing

if %rebootAfterClearCache%==0 %sleep% 5

set rebootAfterBloatRemoval=0
set rebootAfterClearCache=0

goto menu


:fReset

if %factoryReset%==1 (

	cls
	%_color% 0e
	echo You have 10 seconds to change your mind....
	echo.
	echo.
	echo.
	%_color% 0b
	echo *** CLOSE THIS WINDOW TO CANCEL THE FACTORY RESET PROCESS ***
	echo.
	echo.
	echo.
	%_color% 0e
	%sleep% 10

	%amStart% com.amazon.tv.settings/.tv.FactoryResetActivity
	%sleep% 3
	%keyArrowLeft%
	%sleep% 1
	%keyEnter%
	%sleep% 3

	goto menu
)

:: This Mode Preserves ADB Debug Settings
if %factoryReset%==2 (

	cls
	%_color% 0e
	echo The Device Will Reboot After Script Is Finished!
	echo.
	echo.
	%_color% 0c
	echo *** ALL USER DATA WILL BE ERASED ***
	echo.
	echo *** CLOSE THIS WINDOW TO CANCEL ***
	echo.
	echo.
	echo.
	%_color% 0b
	echo It only currently preserves
	echo.
	echo - Saved WiFi Passwords
	echo.
	echo - USB Debugging Setting
	echo.
	echo - Unknown Sources Setting
	echo.
	echo - KingRoot Config
	echo.
	echo.
	%_color% 0e
	pause
	echo.
	echo.
	%shell% "rm /data/local/tmp/com.amazon.tv.settings_preferences.xml"
	%shell% "rm /data/local/tmp/kingroot.apk"
	%shell% "rm /data/local/tmp/factory-reset.sh"
	%push% %kingrootAPK% /data/local/tmp/
	%push% "%~dp0config\data\com.amazon.tv.settings\shared_prefs\com.amazon.tv.settings_preferences.xml" /data/local/tmp/
	%push% "%~dp0scripts\factory-reset.sh" /data/local/tmp/
	%shell% "su -c chmod 755 /data/local/tmp/factory-reset.sh"
	%shell% "su -c sh /data/local/tmp/factory-reset.sh"
	
	%adb% reboot 
)

goto menu



:fullAuto

set doFullAutoMode=1

cls
%_color% 0b
echo *** This mode MAY NOT work as fully intended! ***
echo.
echo *** No damage will be done to device, but the script may crash! ***
echo.
echo.
%_color% 0e
echo.
echo.
echo Press M and ENTER to return back to menu
echo.
echo.
echo.
echo.
echo.
echo Press ENTER to continue....
echo.
echo.

set /p doFullAutoMode=

if %doFullAutoMode%==M goto menu
if %doFullAutoMode%==m goto menu

set fullAutoMode=1

goto installRoot

:: This is a safety net. It should never land here!!!
goto menu


:fixRemote

cls
%push% "%~dp0scripts\fixes\fix-amazon-android-remote-app.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/fix-amazon-android-remote-app.sh"
%shell% "su -c sh /data/local/tmp/fix-amazon-android-remote-app.sh"

goto fixesMenu


:bootanimRemove

cls
%push% "%~dp0scripts\remove-bootanimation.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/remove-bootanimation.sh"
%shell% "su -c sh /data/local/tmp/remove-bootanimation.sh"

::%adb% reboot

goto testBootAnim


:bootanimReplaceFBI

cls
%shell% "rm /data/local/tmp/framework-res.apk"
%push% "%~dp0apps\system\framework-res__mod.apk" /data/local/tmp/framework-res.apk
%push% "%~dp0scripts\replace-boot-fallback-image.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/replace-boot-fallback-image.sh"
%shell% "su -c sh /data/local/tmp/replace-boot-fallback-image.sh"

::%adb% reboot

goto testBootAnim


:bootanimCustom

set newBootCustomChoice=none

cls
echo Enter or Drag File/Path To New Boot Animation (bootanimation.zip):
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo B) Go Back To Previous Menu
echo.
echo.

set /p newBootCustomChoice=

if %newBootCustomChoice%==none goto bootanimCustom
if %newBootCustomChoice%==B goto bootanimReplace
if %newBootCustomChoice%==b goto bootanimReplace

set newBootAnimation==%newBootCustomChoice%

%shell% "rm /data/local/tmp/bootanimation.zip"
%push% "%newBootAnimation%" /data/local/tmp/
%push% "%~dp0scripts\replace-bootanimation.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/replace-bootanimation.sh"
%shell% "su -c sh /data/local/tmp/replace-bootanimation.sh"

goto testBootAnim


:bootanimReplace

set newBootAnimationChoice=none

cls
echo Choose A Stock Boot Animation Color and Press ENTER:
echo.
echo.
echo.
echo 1) Blue
echo.
echo 2) Green
echo.
echo 3) Pink
echo.
echo 4) Purple
echo.
echo 5) Red
echo.
echo 6) Yellow
echo.
echo.
echo C) Custom Boot Animation
echo.
echo.
echo B) Go Back To Previous Menu
echo.
echo.

set /p newBootAnimationChoice=

if %newBootAnimationChoice%==none goto bootanimReplace

if %newBootAnimationChoice%==1 set newBootAnimation=%bootAnimationBlue%
if %newBootAnimationChoice%==2 set newBootAnimation=%bootAnimationGreen%
if %newBootAnimationChoice%==3 set newBootAnimation=%bootAnimationPink%
if %newBootAnimationChoice%==4 set newBootAnimation=%bootAnimationPurple%
if %newBootAnimationChoice%==5 set newBootAnimation=%bootAnimationRed%
if %newBootAnimationChoice%==6 set newBootAnimation=%bootAnimationYellow%
if %newBootAnimationChoice%==C goto bootanimCustom
if %newBootAnimationChoice%==c goto bootanimCustom
if %newBootAnimationChoice%==B goto fixesMenu
if %newBootAnimationChoice%==b goto fixesMenu

%shell% "rm /data/local/tmp/bootanimation.zip"
%push% "%newBootAnimation%" /data/local/tmp/
%push% "%~dp0scripts\replace-bootanimation.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/replace-bootanimation.sh"
%shell% "su -c sh /data/local/tmp/replace-bootanimation.sh"

goto testBootAnim


:bootanimRestore

cls
%shell% "rm /data/local/tmp/bootanimation.zip"
%push% "%~dp0bootanimation\stock-original\bootanimation.zip" /data/local/tmp/
%push% "%~dp0scripts\restore-bootanimation.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/restore-bootanimation.sh"
%shell% "su -c sh /data/local/tmp/restore-bootanimation.sh"

goto testBootAnim


:bootanimRestoreFBI

cls
%shell% "rm /data/local/tmp/framework-res.apk"
%push% "%~dp0apps\system\framework-res__%dgVersion%.apk" /data/local/tmp/framework-res.apk
%push% "%~dp0scripts\restore-boot-fallback-image.sh" /data/local/tmp/
%shell% "su -c chmod 755 /data/local/tmp/restore-boot-fallback-image.sh"
%shell% "su -c sh /data/local/tmp/restore-boot-fallback-image.sh"

::%adb% reboot

goto testBootAnim


:testBootAnim

cls
echo Test New Boot Animation Now [Y/N]?
echo.
echo.
echo.
echo.
echo Make a choice and press ENTER:
echo.
echo.

set /p testNow=

if %testNow%==Y %adb% reboot
if %testNow%==y %adb% reboot

goto fixesMenu



:hideOTA

if %hideAllOTA%==1 (

	%push% "%~dp0scripts\debloat\bloat-hide.sh" /data/local/tmp/
	%shell% "chmod 755 /data/local/tmp/bloat-hide.sh"
	%shell% "sh /data/local/tmp/bloat-hide.sh"
	set hideAllOTA=0
	
	goto fixesMenu

)

%push% "%~dp0scripts\hide-ota-no-root.sh" /data/local/tmp/
%shell% "chmod 755 /data/local/tmp/hide-ota-no-root.sh"
%shell% "sh /data/local/tmp/hide-ota-no-root.sh"

set hideAllOTA=0

goto fixesMenu


:unhideOTA

if %unhideAllOTA%==1 (

	%push% "%~dp0scripts\debloat\bloat-unhide.sh" /data/local/tmp/
	%shell% "chmod 755 /data/local/tmp/bloat-unhide.sh"
	%shell% "sh /data/local/tmp/bloat-unhide.sh"
	set unhideAllOTA=0
	
	goto fixesMenu

)

%push% "%~dp0scripts\unhide-ota-no-root.sh" /data/local/tmp/
%shell% "chmod 755 /data/local/tmp/unhide-ota-no-root.sh"
%shell% "sh /data/local/tmp/unhide-ota-no-root.sh

set unhideAllOTA=0

goto fixesMenu



:end

%adbKill%



