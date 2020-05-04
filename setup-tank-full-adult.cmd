@echo off

title Full Setup Script For Tank

set debug=0
set fireOsVersion=0.0.0.0
set fireOsDevice=none
set downgrade=0

set magiskZip=Magisk-v20.1.zip

set adb="%~dp0bin\adb.exe"
set adbKill=%adb% kill-server
set adbStart=%adb% start-server
set adbWait=%adb% wait-for-device
set sleep="%~dp0bin\wait.exe"
set extractRAR="%~dp0bin\rar.exe" -y x
set cocolor="%~dp0bin\cocolor.exe"

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell
set twrp=%shell% twrp

:: Used for 5.2.6.3 when no downgrade will be done
set nodg=0

if not exist "%temp%\firestick-loader" md "%temp%\firestick-loader"

:start
color 0e

:: Set Flags For ADB Service and Unknown Sources
set adb_success=0
set unk_sources_success=0

:: TWRP Requirement
set twrp_available=0
cls
echo Looking For TWRP Recovery...
echo.
%pull% /twres/twrp "%temp%\firestick-loader"
%sleep% 2
if exist "%temp%\firestick-loader\twrp" set twrp_available=1
if %twrp_available%==1 goto intro
if %twrp_available%==0 goto twrpfail

:twrpfail
%cocolor% 0c
cls
echo TWRP Not Found!
echo.
echo Trying To Force Boot Into Recovery...
echo.
%sleep% 3
%adb% reboot recovery
%sleep% 25
goto start

:intro
:: Reset TWRP Flags
if %twrp_available%==1 del /f /q "%temp%\firestick-loader\twrp"
if %twrp_available%==1 set twrp_available=0

color 0e
set rwcheck=0
cls
echo.
echo Mounting System To Check Device Settings...
echo.
%shell% "mount -o rw /system"

echo.
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 echo.
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot recovery
if %rwcheck%==1 %sleep% 25
if %rwcheck%==1 goto intro

:: Get FireOS Info
%shell% "cat /system/build.prop | grep ro.build.version.name>/sdcard/fireos-version.txt"
%pull% /sdcard/fireos-version.txt "%temp%"

%shell% "cat /system/build.prop | grep ro.product.device=>/sdcard/fireos-device.txt"
%pull% /sdcard/fireos-device.txt "%temp%"

for /f "tokens=3 delims= " %%f in ('type "%temp%\fireos-version.txt"') do set fireOsVersion=%%f
for /f "tokens=2 delims==" %%f in ('type "%temp%\fireos-device.txt"') do set fireOsDevice=%%f
%sleep% 1
%shell% "rm /sdcard/fireos-version.txt"
%shell% "rm /sdcard/fireos-device.txt"

if not %fireOsDevice%==tank goto notank


:dgask
color 0c
set noway=0
set dgchoice=n

if %fireOsVersion%==5.2.6.3 (
	set downgrade=1
	set nodg=1
	goto is5263
)

cls
%cocolor% 0a
echo TWRP Found!
echo.
%cocolor% 0b
echo Device: %fireOsDevice% / Firmware Version: %fireOsVersion%
echo.
echo.
%cocolor% 0e
echo Do you want to downgrade to 5.2.6.3 [Y/N]?
echo.
echo.
set /p dgchoice=
echo.

if %dgchoice%==n set downgrade=0
if %dgchoice%==N set downgrade=0
if %dgchoice%==y set downgrade=1
if %dgchoice%==Y set downgrade=1

if %downgrade%==0 goto is5272
if %downgrade%==1 goto dg5263
goto dgask


:is5263
cls
%cocolor% 0a
echo TWRP Found!
echo.
%cocolor% 0b
echo Device: %fireOsDevice% / Firmware Version: %fireOsVersion%
echo.
echo.
%cocolor% 0e
echo The device will have the following done to it:
echo.
echo - Amazon Bloat Removed
echo - Custom OOBE App That Only Requires Remote, Wifi Setup, and Account
echo - Custom Home Menu and Data Installed To System
echo - TitaniumBackup Installed To System. Use To Restore All Apps and Data
echo - SH Script Runner Installed To System. Use For Shortcuts On Home Menu
echo - Restore Directory and All APKs and TitaniumBackup Files To /system/
echo - Scripts Directory and All Home Scripts To Launch Amazon Settings To /system/
echo - Magisk Installed For SuperUser and ADB Service
echo.
echo - The System, Data, Cache, and Dalvik Cache Will Be Formatted During Setup
echo.
echo.
echo.
echo Press 1 to EXIT, B to create BACKUP, or just press ENTER to continue...
echo.
set /p noway=

if %noway%==1 goto end
if %noway%==b %twrp% backup /system,data,cache,dalvik
if %noway%==b %adb% reboot recovery
if %noway%==b %sleep% 25
if %noway%==b goto start
if %noway%==B %twrp% backup /system,data,cache,dalvik
if %noway%==B %adb% reboot recovery
if %noway%==B %sleep% 25
if %noway%==B goto start
goto stage1


:dg5263
cls
%cocolor% 0a
echo TWRP Found!
echo.
%cocolor% 0b
echo Device: %fireOsDevice% / Firmware Version: %fireOsVersion%
echo.
echo.
%cocolor% 0e
echo The device will have the following done to it:
echo.
echo - Downgrade To Stock Amazon FireOS 5.2.6.3
echo - Amazon Bloat Removed
echo - Custom OOBE App That Only Requires Remote, Wifi Setup, and Account
echo - Custom Home Menu and Data Installed To System
echo - TitaniumBackup Installed To System. Use To Restore All Apps and Data
echo - SH Script Runner Installed To System. Use For Shortcuts On Home Menu
echo - Restore Directory and All APKs and TitaniumBackup Files To /system/
echo - Scripts Directory and All Home Scripts To Launch Amazon Settings To /system/
echo - Magisk Installed For SuperUser and ADB Service
echo.
echo - The System, Data, Cache, and Dalvik Cache Will Be Formatted During Setup
echo.
echo.
echo Press S To Skip Firmware Downgrade
echo.
echo Press 1 to EXIT, B to create BACKUP, or just press ENTER to continue...
echo.
set /p noway=

if %noway%==1 goto end
if %noway%==b %twrp% backup /system,data,cache,dalvik
if %noway%==b %adb% reboot recovery
if %noway%==b %sleep% 25
if %noway%==b goto start
if %noway%==B %twrp% backup /system,data,cache,dalvik
if %noway%==B %adb% reboot recovery
if %noway%==B %sleep% 25
if %noway%==B goto start
if %noway%==S goto stage2
if %noway%==s goto stage2
goto stage1


:is5272
cls
%cocolor% 0a
echo TWRP Found!
echo.
%cocolor% 0b
echo Device: %fireOsDevice% / Firmware Version: %fireOsVersion%
echo.
echo.
%cocolor% 0e
echo The device will have the following done to it:
echo.
echo - Amazon Bloat Removed
echo - Custom Home Menu and Data Installed To System
echo - TitaniumBackup Installed To System. Use To Restore All Apps and Data
echo - SH Script Runner Installed To System. Use For Shortcuts On Home Menu
echo - Restore Directory and All APKs and TitaniumBackup Files To /system/
echo - Scripts Directory and All Home Scripts To Launch Amazon Settings To /system/
echo - Magisk Installed For SuperUser and ADB Service
echo.
echo - The Cache and Dalvik Cache Will Be Formatted During Setup
echo.
echo.
echo Press 1 to EXIT, B to create BACKUP, or just press ENTER to continue...
echo.
set /p noway=

if %noway%==1 goto end
if %noway%==b %twrp% backup /system,data,cache,dalvik
if %noway%==b %adb% reboot recovery
if %noway%==b %sleep% 25
if %noway%==b goto start
if %noway%==B %twrp% backup /system,data,cache,dalvik
if %noway%==B %adb% reboot recovery
if %noway%==B %sleep% 25
if %noway%==B goto start
goto stage1


:notank
%cocolor% 0c
cls
echo Supports Tank Only!
echo.
echo This device is %fireOsDevice% and CANNOT continue!
echo.
pause
goto end


:stage1
if %downgrade%==1 (
set accessibility="scripts\settings\tank\system\scripts\accessibility.sh"
set applications="scripts\settings\tank\system\scripts\applications.sh"
set btcontroller="scripts\settings\tank\system\scripts\btcontroller.sh"
set device="scripts\settings\tank\system\scripts\device.sh"
set displaysounds="scripts\settings\tank\system\scripts\display-sounds.sh"
set help="scripts\settings\tank\system\scripts\help.sh"
set myaccount="scripts\settings\tank\system\scripts\my-account.sh"
set network="scripts\settings\tank\system\scripts\network.sh"
set notifications="scripts\settings\tank\system\scripts\notifications.sh"
set preferences="scripts\settings\tank\system\scripts\preferences.sh"
)

if %downgrade%==0 (
set accessibility="scripts\settings\tank\system\scripts\5272\accessibility.sh"
set alexa="scripts\settings\tank\system\scripts\5272\alexa.sh"
set applications="scripts\settings\tank\system\scripts\5272\applications.sh"
set btcontroller="scripts\settings\tank\system\scripts\5272\btcontroller.sh"
set device="scripts\settings\tank\system\scripts\5272\device.sh"
set displaysounds="scripts\settings\tank\system\scripts\5272\display-sounds.sh"
set equipment="scripts\settings\tank\system\scripts\5272\equipment.sh"
set help="scripts\settings\tank\system\scripts\5272\help.sh"
set myaccount="scripts\settings\tank\system\scripts\5272\my-account.sh"
set network="scripts\settings\tank\system\scripts\5272\network.sh"
set notifications="scripts\settings\tank\system\scripts\5272\notifications.sh"
set preferences="scripts\settings\tank\system\scripts\5272\preferences.sh"
)
color 0e
set rwcheck=0

cls
echo Forcing Reboot Back To Recovery...
echo.
%adb% reboot recovery
%sleep% 25

if %downgrade%==0 goto stage2

:: If version is 5.2.6.3 then do not downgrade
if %nodg%==1 goto stage2

cls
echo.
echo Mounting System as RW for System Install...
echo.
%twrp% remountrw /system

echo.
echo Check For RW Mount Status
echo.
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 echo.
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot recovery
if %rwcheck%==1 %sleep% 25
if %rwcheck%==1 goto stage1

cls
echo Preparing Stock FireOS 5.2.6.3 Downgrade Files
echo.
if not exist "%temp%\firestick-loader\downgrade\stick2\5.2.6.3" md "%temp%\firestick-loader\downgrade\stick2\5.2.6.3"
%extractRAR% "downgrade\stick2\5.2.6.3\firmware-tank-5.2.6.3.split" "%temp%\firestick-loader\downgrade\stick2"

cls
echo Pushing Downgrade Bin to /sdcard/...
echo.
%push% "%temp%\firestick-loader\downgrade\stick2\update-kindle-full_tank-288.6.0.6_user_606753420_5.2.6.3.bin" /sdcard/
%sleep% 2

cls
echo Wiping System...
echo.
%twrp% wipe /system
%sleep% 5

cls
echo Installing Stock FireOS 5.2.6.3...
echo.
%twrp% install /sdcard/update-kindle-full_tank-288.6.0.6_user_606753420_5.2.6.3.bin
%sleep% 5

cls
echo Cleaning Up Files...
echo.
rd /s /q "%temp%\firestick-loader\downgrade\stick2"
%shell% "rm /sdcard/update-kindle-full_tank-288.6.0.6_user_606753420_5.2.6.3.bin"
%sleep% 2

cls
echo Preparing Reboot...
echo.
%sleep% 5

cls
echo Rebooting Back Into Recovery...
echo.
%adb% reboot recovery
%sleep% 25

:stage2
color 0e
set rwcheck=0
cls
echo.
echo Mounting System as RW...
echo.
%shell% "mount -o rw /system"

echo.
echo Check For RW Mount Status
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 echo.
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot recovery
if %rwcheck%==1 %sleep% 25
if %rwcheck%==1 goto stage2

cls
echo Debloating Amazon Apps...
echo.

%sleep% 3

:: FireOS 5.05 and Higher
if %downgrade%==1 %shell% "rm -r /system/priv-app/amazon.jackson-19/"
%shell% "rm -r /system/priv-app/AmazonKKWebViewLib/"
%shell% "rm -r /system/priv-app/BackupRestoreConfirmation/"
%shell% "rm -r /system/priv-app/com.amazon.ags.app/"
%shell% "rm -r /system/priv-app/com.amazon.avod/"
%shell% "rm -r /system/priv-app/com.amazon.bueller.music/"
%shell% "rm -r /system/priv-app/com.amazon.device.sync/"
%shell% "rm -r /system/priv-app/com.amazon.device.sync.sdk.internal/"
%shell% "rm -r /system/priv-app/com.amazon.kindle.devicecontrols/"
%shell% "rm -r /system/priv-app/com.amazon.kso.blackbird/"
%shell% "rm -r /system/priv-app/com.amazon.ods.kindleconnect/"
%shell% "rm -r /system/priv-app/com.amazon.securitysyncclient/"
%shell% "rm -r /system/priv-app/com.amazon.sharingservice.android.client.proxy.release/"
%shell% "rm -r /system/priv-app/com.amazon.shoptv.client/"
%shell% "rm -r /system/priv-app/com.amazon.tv.aiv.support/"
%shell% "rm -r /system/priv-app/com.amazon.tv.legal.notices/"
%shell% "rm -r /system/priv-app/com.amazon.tv.parentalcontrols/"

:: Amazon App Store
:: Do not remove to preserve app store version apps such as Netflix
::%shell% "rm -r /system/priv-app/com.amazon.venezia/"

:: Used for downloading from Amazon app store
::%shell% "rm -r /system/priv-app/com.amazon.kindle.cms-service/"

::%shell% "rm -r /system/priv-app/com.amazon.visualonawv/"
%shell% "rm -r /system/priv-app/ContentSupportProvider/"
%shell% "rm -r /system/priv-app/CrashManager/"
%shell% "rm -r /system/priv-app/ConnectivityDiag/"
%shell% "rm -r /system/priv-app/DeviceClientPlatformContractsFramework/"
%shell% "rm -r /system/priv-app/DeviceMessagingAndroid/"
%shell% "rm -r /system/priv-app/DeviceMessagingAndroidInternalSDK/"
%shell% "rm -r /system/priv-app/DeviceMessagingAndroidSDK/"
%shell% "rm -r /system/priv-app/DownloadProvider/"

:: Needed For Mouse Toggle and Maybe Others Using ADB Confirmation
if %downgrade%==1 %shell% "rm -r /system/priv-app/FireApplicationCompatibilityEnforcer/"
if %downgrade%==1 %shell% "rm -r /system/priv-app/FireApplicationCompatibilityEnforcerSDK/"

%shell% "rm -r /system/priv-app/FireRecessProxy/"
%shell% "rm -r /system/priv-app/FireTVDefaultMediaReceiver/"
%shell% "rm -r /system/priv-app/FireTvNotificationService/"

:: Do not remove on 5.2.7.2 (Breaks ADB Fingerprint Dialog)
::%shell% "rm -r /system/priv-app/FireTVSystemUI/"

%shell% "rm -r /system/priv-app/FusedLocation/"
%shell% "rm -r /system/priv-app/ManagedProvisioning/"
%shell% "rm -r /system/priv-app/marketplace_service_receiver/"
%shell% "rm -r /system/priv-app/sync-provider_ipc-release/"
%shell% "rm -r /system/priv-app/sync-service-fireos-release/"
%shell% "rm -r /system/priv-app/UnifiedShareActivityChooser/"
%shell% "rm -r /system/priv-app/WallpaperCropper/"

:: Launcher
%shell% "rm -r /system/priv-app/com.amazon.tv.launcher/"

:: OTA Updates
%shell% "rm -r /system/priv-app/DeviceSoftwareOTA/"
%shell% "rm -r /system/priv-app/DeviceSoftwareOTAIdleOverride/"

:: Help
%shell% "rm -r /system/priv-app/com.amazon.tv.csapp/"
%shell% "rm -r /system/priv-app/com.amazon.tmm.tutorial/"

:: Remote Update Service
::%shell% "rm -r /system/priv-app/com.amazon.device.bluetoothdfu/"

:: Fitbit Support?
%shell% "rm -r /system/priv-app/com.amazon.h2clientservice/"

:: Amazon Voice Support
%shell% "rm -r /system/priv-app/com.amazon.vizzini/"

:: VoiceView
%shell% "rm -r /system/priv-app/logan/"

:: USB Tuner
::%shell% "rm -r /system/priv-app/com.amazon.malcolm/"

:: FireOS 5.2.1.1
%shell% "rm -r /system/priv-app/AdvertisingIdSettings/"
%shell% "rm -r /system/priv-app/com.amazon.tv.nimh/"
%shell% "rm -r /system/priv-app/FireTvSaleService/"
%shell% "rm -r /system/priv-app/IvonaTTS/"
%shell% "rm -r /system/priv-app/IvonaTtsOrchestrator/"
%shell% "rm -r /system/priv-app/TvProvider/"

:: FireOS 5.2.6.2
%shell% "rm -r /system/priv-app/com.amazon.alexashopping/"
%shell% "rm -r /system/priv-app/com.amazon.tv.livetv/"
%shell% "rm -r /system/priv-app/com.amazon.amazonvideo.livingroom/"
%shell% "rm -r /system/priv-app/com.amazon.kor.demo/"

:: FireOS 5.2.6.3
%shell% "rm -r /system/priv-app/TIFObserverService/"

:: WiFi Locker
%shell% "rm -r /system/priv-app/CredentialLockerAndroid-tablet-release/

:: com.amazon.webview.awvdeploymentservice Developer Build
%shell% "rm -r /system/priv-app/AwvDeploymentService/"

:: Amazon WebView Metrics Service
%shell% "rm -r /system/priv-app/AwvMetricsService/"

:: OttSsoLib
::%shell% "rm -r /system/priv-app/com.amazon.tv.ottssolib/"

:: OttSsoCompanionApp
::%shell% "rm -r /system/priv-app/com.amazon.tv.ottssocompanionapp/"

:: Log Manager
%shell% "rm -r /system/priv-app/LogManager-logd/"

:: Amazon Echo?
%shell% "rm -r /system/priv-app/SsdpService/"

:: Settings Notification Center (Do Not Remove on 5.2.7.2)
if %downgrade%==1 %shell% "rm -r /system/priv-app/com.amazon.tv.notificationcenter/"

:: Amazon Photos (Do Not Remove on 5.2.6.3)
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.bueller.photos/"

:: DIAL (Discovery-and-Launch) protocol (allow apps to access via second screen)
%shell% "rm -r /system/priv-app/DialService/"

:: CustomMediaController
%shell% "rm -r /system/priv-app/com.amazon.cardinal/"

:: Under /system/app/
%shell% "rm -r /system/app/DocumentsUI/"
%shell% "rm -r /system/app/fdrw/"
%shell% "rm -r /system/app/PicoTts/"
%shell% "rm -r /system/app/UnifiedSettingsProvider/"
%shell% "rm -r /system/app/WhiteListedUrlProvider/"

:: Fire Basic Keyboard (Simplified Chinese)
%shell% "rm -r /system/app/PinyinIME/"

:: FrameworksMetrics
%shell% "rm -r /system/app/FrameworksMetrics/"

:: BuellerDeviceService
%shell% "rm -r /system/priv-app/AmazonNetworkMonitor/"

:: %shell% "rm -r /system/app/CredentialStorage/"
:: %shell% "rm -r /system/app/FireOsMiddlewareDebugApp/"
:: %shell% "rm -r /system/app/sync-provider_ipc-tv-release/"
:: %shell% "rm -r /system/app/sync-service-fireos-tv-release/"

:: FireOS 5.2.6.7
:: ACAFireTVAndroidClient
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.aca/"

:: Aria AriaRuntime
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.aria/"

:: com.amazon.firehomestarter (Unknown)
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.firehomestarter/"

:: Fire TV Recast --
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.franktvinput/"

:: com.amazon.gloria.graphiq (Unknown)
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.gloria.graphiq/"

:: News
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.hedwig/"

:: Naatyam (Unknown)
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.naatyam/"

:: KFTV Legal Notices
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.legal.notices/"

:: SmartConnectService (Unknown)
:: if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.net.smartconnect/"

:: TMMTutorial
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tmm.tutorial/"

if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.forcedotaupdater/"

:: FireOS 5.2.7.2
:: com.amazon.device.bluetoothkeymaplib (Unknown)
:: if %downgrade%==0 %shell% "rm -r /system/priv-app/BluetoothKeyMapLib/"

:: ALE (Unknown)
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.ale/"

:: My Application 2.0 (WTF! LMAO)
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.appaccesskeyprovider/"

:: Alexa Voice Layer
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.avl.firetv/"

:: Ceviche (Unknown)
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.ceviche/"

:: Unknown
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.dpcclient/"

:: Prime Video PVFTV
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.firebat/"

:: FireRESTAPIFramework
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.firerestapiframework/"

:: Gloria
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.ftv.glorialist/"

:: Screensaver (REMOVAL CAN BREAK AMAZON UI)
:: if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.ftv.screensaver/"

:: com.amazon.ftv.xpicker stub-apk
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.ftv.xpicker/"

:: Katoch (Unknown)
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.katoch/"

:: if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.providers.tv/"

:: Fire TV Alexa Alerts
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.alexaalerts/"

:: Equipment Control (REMOVAL CAN BREAK AMAZON UI)
:: if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.devicecontrol/"
:: if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.devicecontrolsettings/"

:: Forced App Updater
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.forcedotaupdater.v2/"

:: ReleaseNotes
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.releasenotes/"

:: FTV Routing
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.routing/"

:: Amazon Settings Core (REMOVAL CAN BREAK AMAZON UI)
:: if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.settings.core/"

:: Amazon Settings v2 (REMOVAL CAN BREAK AMAZON UI)
:: if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tv.settings.v2/"

:: Amazon FreeTime
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.tahoe/"

:: Whisper Join FFS Middleware
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amazon.whisperjoin.middleware.np/"

:: com.amznfuse.operatorredirection (Unknown)
if %downgrade%==0 %shell% "rm -r /system/priv-app/com.amznfuse.operatorredirection/"

:: com.amazon.sync.provider.ipc
if %downgrade%==0 %shell% "rm -r /system/priv-app/sync-provider_ipc-tv-release/"

%sleep% 5

cls
echo Removing any added System Components from Amazon App Updates...
echo.
:: Keep the settings one (possibly breaks Mouse Toggle app)
::%shell% "rm -r /data/app/com.amazon.tv.settings.v2-1/"

:: Save the screensaver update
::%shell% "rm -r /data/app/com.amazon.ftv.screensaver-1/"

:: Used For Equipment Control
::%shell% "rm -r /data/app/com.amazon.tv.devicecontrol-1/"
::%shell% "rm -r /data/app/com.amazon.tv.devicecontrolsettings-1/"

:: Amazon App Store
:: Do not remove to preserve app store version apps such as Netflix
::%shell% "rm -r /data/app/com.amazon.venezia-1/"

if %downgrade%==0 (
%shell% "rm -r /data/app/com.amazon.aca-1/"
%shell% "rm -r /data/app/com.amazon.ags.app-1/"
%shell% "rm -r /data/app/com.amazon.alexashopping-1/"
%shell% "rm -r /data/app/com.amazon.amazonvideo.livingroom.firetv-1/"
%shell% "rm -r /data/app/com.amazon.appaccesskeyprovider-1/"
%shell% "rm -r /data/app/com.amazon.aria-1/"
%shell% "rm -r /data/app/com.amazon.avl.ftv-1/"
%shell% "rm -r /data/app/com.amazon.avod-1/"
%shell% "rm -r /data/app/com.amazon.bueller.music-1/"
%shell% "rm -r /data/app/com.amazon.cardinal-1/"
%shell% "rm -r /data/app/com.amazon.firebat-1/"
%shell% "rm -r /data/app/com.amazon.ftv.glorialist-1/"
%shell% "rm -r /data/app/com.amazon.hedwig-1/"
%shell% "rm -r /data/app/com.amazon.katoch-1/"
%shell% "rm -r /data/app/com.amazon.kso.blackbird-1/"
%shell% "rm -r /data/app/com.amazon.shoptv.client-1/"
%shell% "rm -r /data/app/com.amazon.tahoe-1/"
%shell% "rm -r /data/app/com.amazon.tv.launcher-1/"
%shell% "rm -r /data/app/com.amazon.tv.livetv-1/"
%shell% "rm -r /data/app/com.amazon.tv.ottssocompanionapp-1/"
%shell% "rm -r /data/app/com.amazon.tv.releasenotes-1/"

%shell% "rm -r /data/app/com.amazon.aca-2/"
%shell% "rm -r /data/app/com.amazon.ags.app-2/"
%shell% "rm -r /data/app/com.amazon.alexashopping-2/"
%shell% "rm -r /data/app/com.amazon.amazonvideo.livingroom.firetv-2/"
%shell% "rm -r /data/app/com.amazon.appaccesskeyprovider-2/"
%shell% "rm -r /data/app/com.amazon.aria-2/"
%shell% "rm -r /data/app/com.amazon.avl.ftv-2/"
%shell% "rm -r /data/app/com.amazon.avod-2/"
%shell% "rm -r /data/app/com.amazon.bueller.music-2/"
%shell% "rm -r /data/app/com.amazon.cardinal-2/"
%shell% "rm -r /data/app/com.amazon.firebat-2/"
%shell% "rm -r /data/app/com.amazon.ftv.glorialist-2/"
%shell% "rm -r /data/app/com.amazon.hedwig-2/"
%shell% "rm -r /data/app/com.amazon.katoch-2/"
%shell% "rm -r /data/app/com.amazon.kso.blackbird-2/"
%shell% "rm -r /data/app/com.amazon.shoptv.client-2/"
%shell% "rm -r /data/app/com.amazon.tahoe-2/"
%shell% "rm -r /data/app/com.amazon.tv.launcher-2/"
%shell% "rm -r /data/app/com.amazon.tv.livetv-2/"
%shell% "rm -r /data/app/com.amazon.tv.ottssocompanionapp-2/"
%shell% "rm -r /data/app/com.amazon.tv.releasenotes-2/"
)

%sleep% 5

cls
echo Setting Up Directories For Restore...
echo.
%shell% "rm -r /sdcard/restore/"
%shell% "mkdir /sdcard/restore/"
%shell% "rm -r /sdcard/TitaniumBackup/"
%shell% "mkdir /sdcard/restore/apk/"
%shell% "mkdir /sdcard/restore/apk/system/"
%sleep% 2

cls
echo Pushing Restore Data to /sdcard/...
echo.
%push% "data\tank\post-debloated\all\restore" /sdcard/restore/
if %downgrade%==1 %push% "data\tank\post-debloated\5263\restore" /sdcard/restore/
if %downgrade%==0 %push% "data\tank\post-debloated\5272-adult\restore" /sdcard/restore/
%sleep% 2

cls
echo Copying TitaniumBackup Data For Restore...
echo.
%shell% "cp -r /sdcard/restore/TitaniumBackup/ /sdcard/"
%sleep% 2

cls
echo Creating System Restore Directories and Setting Permissions...
echo.
%shell% "rm -r /system/restore/"
%shell% "mkdir /system/restore/"
%shell% "mkdir /system/restore/apk/"
%shell% "mkdir /system/restore/apk/system/"

%shell% "chmod 0777 /system/restore/"
%shell% "chown root:root /system/restore/"

%shell% "chmod 0777 /system/restore/apk/"
%shell% "chown root:root /system/restore/apk/"

%shell% "chmod 0777 /system/restore/apk/system/"
%shell% "chown root:root /system/restore/apk/system/"

cls
echo Copying Data from /sdcard to /system...
echo.
%shell% "cp -r /sdcard/restore/ /system/"
%sleep% 2

if %downgrade%==1 (
cls
echo Settings Permissions and Copying Custom OOBE App to /system/priv-app/...
echo.
%shell% "rm -r /system/priv-app/com.amazon.tv.oobe/"
%shell% "mkdir /system/priv-app/com.amazon.tv.oobe/"
%shell% "chmod 0775 /system/priv-app/com.amazon.tv.oobe/"
%shell% "chown root:root /system/priv-app/com.amazon.tv.oobe/"
%shell% "cp /system/restore/apk/system/com.amazon.tv.oobe.apk /system/priv-app/com.amazon.tv.oobe/com.amazon.tv.oobe.apk"
%shell% "chmod 0644 /system/priv-app/com.amazon.tv.oobe/com.amazon.tv.oobe.apk"
%shell% "chown root:root /system/priv-app/com.amazon.tv.oobe/com.amazon.tv.oobe.apk"
%sleep% 2

cls
echo Removing Unused Images and Sounds...
echo.
%shell% "rm -r /system/res/images/*.*"
%shell% "rm -r /system/res/sound/*.*"
%sleep% 2

cls
echo Installing Magisk for SU and ADB Access on Stock Rom...
echo.
%push% "rooting\tank\%magiskZip%" /data/local/tmp/
%twrp% install /data/local/tmp/%magiskZip%
%sleep% 3

cls
echo Wiping Data and Cache...
echo.
%twrp% wipe data
%sleep% 5

cls
echo Waiting For Cache Rebuild and ADB Service...
echo.
echo This may take up to 5 minutes or more and Remote Find screen will be loaded
echo.
echo Do not interact with the device yet!
echo.

%adb% reboot
%adbWait%
)

if %downgrade%==0 goto skipmnt

cls
echo Rebooting Back To Recovery To Continue...
echo.
%adb% reboot recovery
%sleep% 25

:stage3
set rwcheck=0
cls
echo Mounting System as RW...
echo.
%shell% "mount -o rw /system"

echo.
echo Check For RW Mount Status
echo.
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p rwcheck=

if %rwcheck%==1 echo.
if %rwcheck%==1 echo Waiting on Reboot...
if %rwcheck%==1 echo.
if %rwcheck%==1 %adb% reboot recovery
if %rwcheck%==1 %sleep% 25
if %rwcheck%==1 goto stage3

%sleep% 3

:skipmnt
:: TODO add Controllers script
cls
echo Pushing Settings Scripts to Temp...
echo.
if %downgrade%==1 (
%push% %accessibility% /data/local/tmp/
%push% %applications% /data/local/tmp/
%push% %btcontroller% /data/local/tmp/
%push% %device% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %notifications% /data/local/tmp/
%push% %preferences% /data/local/tmp/
)

if %downgrade%==0 (
%push% %accessibility% /data/local/tmp/
%push% %alexa% /data/local/tmp/
%push% %applications% /data/local/tmp/
%push% %btcontroller% /data/local/tmp/
%push% %equipment% /data/local/tmp/
%push% %device% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %notifications% /data/local/tmp/
%push% %preferences% /data/local/tmp/
)
%sleep% 2

cls
echo Pushing Restore Home Script to Temp...
echo.
%push% "scripts\clean-sdcard-lite.sh" /data/local/tmp/
%push% "scripts\restore-home.sh" /data/local/tmp/

%sleep% 2

cls
echo Making Directories and Setting Permissions for Settings Scripts...
echo.
%shell% "rm -r /system/scripts/"
%shell% "mkdir /system/scripts/"
%shell% "chmod 0777 /system/scripts/"

%sleep% 2

cls
echo Copying Settings Scripts From Temp to /system...
echo.
if %downgrade%==1 (
%shell% "cp /data/local/tmp/accessibility.sh /system/scripts/accessibility.sh"
%shell% "cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "cp /data/local/tmp/btcontroller.sh /system/scripts/btcontroller.sh"
%shell% "cp /data/local/tmp/device.sh /system/scripts/device.sh"
%shell% "cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "cp /data/local/tmp/notifications.sh /system/scripts/notifications.sh"
%shell% "cp /data/local/tmp/preferences.sh /system/scripts/preferences.sh"
)

if %downgrade%==0 (
%shell% "cp /data/local/tmp/accessibility.sh /system/scripts/accessibility.sh"
%shell% "cp /data/local/tmp/alexa.sh /system/scripts/alexa.sh"
%shell% "cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "cp /data/local/tmp/btcontroller.sh /system/scripts/btcontroller.sh"
%shell% "cp /data/local/tmp/device.sh /system/scripts/device.sh"
%shell% "cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "cp /data/local/tmp/equipment.sh /system/scripts/equipment.sh"
%shell% "cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "cp /data/local/tmp/notifications.sh /system/scripts/notifications.sh"
%shell% "cp /data/local/tmp/preferences.sh /system/scripts/preferences.sh"
)
%sleep% 2

cls
echo Copying Restore Home Script From Temp to /system...
echo.
%shell% "cp /data/local/tmp/clean-sdcard-lite.sh /system/scripts/clean-sdcard-lite.sh"
%shell% "cp /data/local/tmp/restore-home.sh /system/scripts/restore-home.sh"

%sleep% 2

cls
echo Setting Permissions...
echo.
%shell% "chmod 0777 /system/scripts/*.sh"
%shell% "chown root:root /system/scripts/*.sh"

%sleep% 2

cls
echo Copying Apps to /system/app/...
echo.
%shell% "rm -r /system/app/Launcher/"
%shell% "mkdir /system/app/Launcher/"
%shell% "chmod 0775 /system/app/Launcher/"
%shell% "chown root:root /system/app/Launcher/"
%shell% "cp /system/restore/apk/system/Launcher.apk /system/app/Launcher/Launcher.apk"

%shell% "rm -r /system/app/ScriptRunner/"
%shell% "mkdir /system/app/ScriptRunner/"
%shell% "chmod 0775 /system/app/ScriptRunner/"
%shell% "chown root:root /system/app/ScriptRunner/"
%shell% "cp /system/restore/apk/system/ScriptRunner.apk /system/app/ScriptRunner/ScriptRunner.apk"

%shell% "rm -r /system/app/TitaniumBackup/"
%shell% "mkdir /system/app/TitaniumBackup/"
%shell% "chmod 0775 /system/app/TitaniumBackup/"
%shell% "chown root:root /system/app/TitaniumBackup/"
%shell% "cp /system/restore/apk/system/TitaniumBackup.apk /system/app/TitaniumBackup/TitaniumBackup.apk"

%shell% "rm -r /system/app/TitaniumBackupAddon/"
%shell% "mkdir /system/app/TitaniumBackupAddon/"
%shell% "chmod 0775 /system/app/TitaniumBackupAddon/"
%shell% "chown root:root /system/app/TitaniumBackupAddon/"
%shell% "cp /system/restore/apk/system/TitaniumBackupAddon.apk /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"

%sleep% 2

cls
echo Setting Permissions For System Apps...
echo.
%shell% "chmod 0644 /system/app/Launcher/Launcher.apk"
%shell% "chown root:root /system/app/Launcher/Launcher.apk"

%shell% "chmod 0644 /system/app/ScriptRunner/ScriptRunner.apk"
%shell% "chown root:root /system/app/ScriptRunner/ScriptRunner.apk"

%shell% "chmod 0644 /system/app/TitaniumBackup/TitaniumBackup.apk"
%shell% "chown root:root /system/app/TitaniumBackup/TitaniumBackup.apk"

%shell% "chmod 0644 /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"
%shell% "chown root:root /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"

%sleep% 2

cls
echo Installing BusyBox...
echo.
%push% "%~dp0bin\android\busybox" /data/local/tmp/
%shell% "chmod 0777 /data/local/tmp/busybox"
%shell% "/data/local/tmp/busybox --install"

%sleep% 2

cls
echo Wiping Cache and Dalvik Cache...
echo.
echo This May Take Several Minutes!
echo.
%twrp% wipe cache
%sleep% 5
%twrp% wipe dalvik
%sleep% 5

cls
echo Re-Installing Magisk for SU Access...
echo.
%push% "rooting\tank\%magiskZip%" /data/local/tmp/
%twrp% install /data/local/tmp/%magiskZip%
%sleep% 2

cls
echo Fixing Permissions...
echo.
:: Source: https://forum.xda-developers.com/showthread.php?t=2222297

%shell% "chown -R media_rw:media_rw /data/media/"
%shell% "find /data/media/ -type d -exec chmod 775 {} ';'"
%shell% "find /data/media/ -type f -exec chmod 664 {} ';'"

%shell% "restorecon -FR /data/media/"

::%twrp% fixperms /
::%twrp% fixperms /system/
::%twrp% fixperms /data/
::%twrp% fixperms /sdcard/
%sleep% 5

cls
echo Preparing For Reboot...
echo.
%sleep% 8

cls
echo Waiting For Cache Rebuild and ADB Service...
echo.
if %downgrade%==1 echo This may take up to 5 minutes or more and Remote Find screen will be loaded
if %downgrade%==0 echo This may take up to 5 minutes or more
echo.
if %downgrade%==1 echo Do not interact with the device yet!
if %downgrade%==0 echo Please Wait...
echo.
%adb% reboot
%adbWait%

if %downgrade%==0 (
%sleep% 100
goto finished
)

:chkadb
echo Checking For ADB Service...
echo.
%sleep% 5
%shell% "nothing=nothing"
if %errorlevel%==0 goto stage4
%sleep% 30
goto chkadb

:stage4
cls
echo Enabling ADB and Unknown Sources...
echo.
%shell% settings --user 0 put global adb_enabled 1
if %errorlevel%==0 set adb_success=1
%shell% settings --user 0 put secure install_non_market_apps 1
if %errorlevel%==0 set unk_sources_success=1

:chk1
if %adb_success%==1 goto chk2
if %adb_success%==0 goto chkadb

:chk2
if %unk_sources_success%==1 goto final

:: If anything fails, go back to check adb status
goto chkadb

:final
set unkadb=0
echo.
echo Check For ADB and Unknown Sources Enable Status
echo.
echo NOTE: ADB is already enabled as a system service
echo This will also set these values in Amazon Settings app
echo.
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p unkadb=

if %unkadb%==1 echo.
if %unkadb%==1 echo Waiting For ADB Service...
if %unkadb%==1 echo.
if %unkadb%==1 %sleep% 10
if %unkadb%==1 goto stage4

%sleep% 3

:finished
cls
color 0a
if %downgrade%==1 echo Finished!
if %downgrade%==0 echo Almost Finished!
if %downgrade%==1 echo.
if %downgrade%==1 echo Complete the user setup to configure remote, wifi, and Amazon account
echo.
echo Once on Launcher, use TitaniumBackup to restore data for
echo ATV Launcher Home and SH Script Runner Settings
echo.
echo Use TitaniumBackup to restore apps for Mouse Toggle, Busybox and Autoruns
echo.
if %downgrade%==1 echo Press any key to exit...
if %downgrade%==0 echo Press any key to continue...
pause>nul

if %downgrade%==0 (
%sleep% 3
%adb% reboot
%sleep% 10
cls
echo Finished!
echo.
pause
)


:end



