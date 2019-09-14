@echo off

color 0c

set adb="..\..\bin\adb.exe"
set adbKill="%~dp0bin\adb.exe" kill-server
set adbStart="%~dp0bin\adb.exe" start-server
set adbWait=%adb% wait-for-device
set sleep="..\..\bin\wait.exe"

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell
set twrp=%shell% twrp

:start
set accessibility="..\settings\tank\system\scripts\accessibility.sh"
set applications="..\settings\tank\system\scripts\applications.sh"
set device="..\settings\tank\system\scripts\device.sh"
set displaysounds="..\settings\tank\system\scripts\display-sounds.sh"
set help="..\settings\tank\system\scripts\help.sh"
set myaccount="..\settings\tank\system\scripts\my-account.sh"
set network="..\settings\tank\system\scripts\network.sh"
set notifications="..\settings\tank\system\scripts\notifications.sh"
set preferences="..\settings\tank\system\scripts\preferences.sh"

set noway=0
cls
echo.
echo WARNING! THIS WILL FACTORY RESET YOUR DEVICE!
echo.
echo Press 1 to EXIT or just press ENTER to continue...
echo.
set /p noway=

if %noway%==1 goto end

:stage1
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
if %rwcheck%==1 goto stage1

cls
echo Debloating Amazon Apps...
echo.

%sleep% 3

:: FireOS 5.05 and Higher
%shell% "rm -r /system/priv-app/amazon.jackson-19/"
%shell% "rm -r /system/priv-app/AmazonKKWebViewLib/"
%shell% "rm -r /system/priv-app/BackupRestoreConfirmation/"
%shell% "rm -r /system/priv-app/com.amazon.ags.app/"
%shell% "rm -r /system/priv-app/com.amazon.avod/"
%shell% "rm -r /system/priv-app/com.amazon.bueller.music/"
%shell% "rm -r /system/priv-app/com.amazon.device.sync/"
%shell% "rm -r /system/priv-app/com.amazon.device.sync.sdk.internal/"
%shell% "rm -r /system/priv-app/com.amazon.kindle.cms-service/"
%shell% "rm -r /system/priv-app/com.amazon.kindle.devicecontrols/"
%shell% "rm -r /system/priv-app/com.amazon.kso.blackbird/"
%shell% "rm -r /system/priv-app/com.amazon.ods.kindleconnect/"
%shell% "rm -r /system/priv-app/com.amazon.parentalcontrols/"
%shell% "rm -r /system/priv-app/com.amazon.precog/"
%shell% "rm -r /system/priv-app/com.amazon.securitysyncclient/"
%shell% "rm -r /system/priv-app/com.amazon.sharingservice.android.client.proxy.release/"
%shell% "rm -r /system/priv-app/com.amazon.shoptv.client/"
%shell% "rm -r /system/priv-app/com.amazon.tv.aiv.support/"
%shell% "rm -r /system/priv-app/com.amazon.tv.legal.notices/"
%shell% "rm -r /system/priv-app/com.amazon.tv.parentalcontrols/"
%shell% "rm -r /system/priv-app/com.amazon.venezia/"
%shell% "rm -r /system/priv-app/com.amazon.videoads.app/"
%shell% "rm -r /system/priv-app/com.amazon.visualonawv/"
%shell% "rm -r /system/priv-app/ContentSupportProvider/"
%shell% "rm -r /system/priv-app/CrashManager/"
%shell% "rm -r /system/priv-app/ConnectivityDiag/"
%shell% "rm -r /system/priv-app/DeviceClientPlatformContractsFramework/"
%shell% "rm -r /system/priv-app/DeviceMessagingAndroid/"
%shell% "rm -r /system/priv-app/DeviceMessagingAndroidInternalSDK/"
%shell% "rm -r /system/priv-app/DeviceMessagingAndroidSDK/"
%shell% "rm -r /system/priv-app/DownloadProvider/"
%shell% "rm -r /system/priv-app/FireApplicationCompatibilityEnforcer/"
%shell% "rm -r /system/priv-app/FireApplicationCompatibilityEnforcerSDK/"
%shell% "rm -r /system/priv-app/FireOsMiddlewareDebugApp/"
%shell% "rm -r /system/priv-app/FireRecessProxy/"
%shell% "rm -r /system/priv-app/FireTVDefaultMediaReceiver/"
%shell% "rm -r /system/priv-app/FireTvNotificationService/"
%shell% "rm -r /system/priv-app/FireTVSystemUI/"
%shell% "rm -r /system/priv-app/FusedLocation/"
%shell% "rm -r /system/priv-app/LogManager/"
%shell% "rm -r /system/priv-app/ManagedProvisioning/"
%shell% "rm -r /system/priv-app/marketplace_service_receiver/"
%shell% "rm -r /system/priv-app/shipmode/"
%shell% "rm -r /system/priv-app/sync-provider_ipc-release/"
%shell% "rm -r /system/priv-app/sync-service-fireos-release/"
%shell% "rm -r /system/priv-app/UnifiedShareActivityChooser/"
%shell% "rm -r /system/priv-app/WallpaperCropper/"

:: Launcher
%shell% "rm -r /system/priv-app/com.amazon.tv.launcher/"

:: OTA Updates
%shell% "rm -r /system/priv-app/DeviceSoftwareOTA/"
%shell% "rm -r /system/priv-app/DeviceSoftwareOTAIdleOverride/"
%shell% "rm -r /system/priv-app/SystemUpdatesUI/"

:: Help
%shell% "rm -r /system/priv-app/com.amazon.tv.csapp/"
%shell% "rm -r /system/priv-app/com.amazon.tmm.tutorial/"

:: Remote Update Service
::%shell% "rm -r /system/priv-app/com.amazon.device.bluetoothdfu/"

:: Fitbit Support?
%shell% "rm -r /system/priv-app/com.amazon.h2clientservice/"

:: FrameworksMetrics
%shell% "rm -r /system/priv-app/FrameworksMetrics/"

:: Amazon Voice Support
%shell% "rm -r /system/priv-app/AlexaMediaPlayer/"

:: VoiceView
%shell% "rm -r /system/priv-app/Logan/"

:: USB Tuner
::%shell% "rm -r /system/priv-app/com.amazon.malcolm/"

:: FireOS 5.2.1.1
%shell% "rm -r /system/priv-app/AdvertisingIdSettings/"
%shell% "rm -r /system/priv-app/com.amazon.tv.nimh/"
%shell% "rm -r /system/priv-app/FireTvSaleService/"
%shell% "rm -r /system/priv-app/IvonaTTS/"
%shell% "rm -r /system/priv-app/IvonaTtsOrchestrator/"
%shell% "rm -r /system/priv-app/TvProvider/"

:: Amazon Enterprise Controls
%shell% "rm -r /system/app/DeviceControlService/"

:: FireOS 5.2.6.2
%shell% "rm -r /system/priv-app/com.amazon.alexashopping/"
%shell% "rm -r /system/priv-app/com.amazon.ftv.glorialist/"
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

:: Settings Notification Center
%shell% "rm -r /system/priv-app/com.amazon.tv.notificationcenter/"

:: DIAL (Discovery-and-Launch) protocol (allow apps to access via second screen)
%shell% "rm -r /system/priv-app/DialService/"

:: Fire Basic Keyboard (Simplified Chinese)
%shell% "rm -r /system/app/PinyinIME/"

:: CustomMediaController
%shell% "rm -r /system/priv-app/com.amazon.cardinal/"

:: Under /system/app/
%shell% "rm -r /system/app/DocumentsUI/"
%shell% "rm -r /system/app/fdrw/"
%shell% "rm -r /system/app/PicoTts/"
%shell% "rm -r /system/app/UnifiedSettingsProvider/"
%shell% "rm -r /system/app/WebCryptoTZService/"
%shell% "rm -r /system/app/WhiteListedUrlProvider/"

%sleep% 5

cls
echo Removing Unused Images and Sounds...
echo.
%shell% "rm -r /system/res/images/*.*"
%shell% "rm -r /system/res/sound/*.*"

cls
echo Wiping Data and Cache...
echo.
%twrp% wipe data

cls
echo Waiting For Cache Rebuild and ADB Service...
echo.
echo This may take up to 5 minutes or more and Remote Find screen will be loaded
echo.
echo Do not interact with the device yet!
echo.

%shell% reboot
%adbWait%

cls
echo Rebooting Back To Recovery To Continue...
echo.
%shell% reboot recovery
%sleep% 25

:stage2
set rwcheck=0
cls
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

%sleep% 3

cls
echo Pushing Settings Scripts to Temp...
echo.
%push% %accessibility% /data/local/tmp/
%push% %applications% /data/local/tmp/
%push% %device% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %notifications% /data/local/tmp/
%push% %preferences% /data/local/tmp/

%sleep% 2

cls
echo Pushing Restore Home Script to Temp...
echo.
%push% "..\restore-home.sh" /data/local/tmp/

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
%shell% "cp /data/local/tmp/accessibility.sh /system/scripts/accessibility.sh"
%shell% "cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "cp /data/local/tmp/device.sh /system/scripts/device.sh"
%shell% "cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "cp /data/local/tmp/notifications.sh /system/scripts/notifications.sh"
%shell% "cp /data/local/tmp/preferences.sh /system/scripts/preferences.sh"

%sleep% 2

cls
echo Copying Restore Home Script From Temp to /system...
echo.
%shell% "cp /data/local/tmp/restore-home.sh /system/scripts/restore-home.sh"

%sleep% 2

cls
echo Setting Permissions...
echo.
%shell% "chmod 0777 /system/scripts/*.sh"
%shell% "chown root:root /system/scripts/*.sh"

%sleep% 2

cls
echo Pushing App Data to /sdcard...
echo.
%shell% "rm -r /sdcard/restore/"
%shell% "mkdir /sdcard/restore/"
%push% "..\..\data\tank\post-debloated\restore" /sdcard/restore/
%shell% "rm -r /sdcard/TitaniumBackup/"
%shell% "mkdir /sdcard/TitaniumBackup/"
%shell% "cp -r /sdcard/restore/TitaniumBackup /sdcard/"
%shell% "mkdir /sdcard/restore/apk/"

%sleep% 2

cls
echo Copying Data from /sdcard to /system...
echo.
%shell% "rm -r /system/restore/"
%shell% "mkdir /system/restore/"
%shell% "mkdir /system/restore/apk/"

%shell% "chmod 0777 /system/restore/"
%shell% "chown root:root /system/restore/"

%shell% "chmod 0777 /system/restore/apk/"
%shell% "chown root:root /system/restore/apk/"

%shell% "cp -r /sdcard/restore/ /system/"

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

%sleep% 2

cls
echo Setting Permissions For System Apps...
echo.
%shell% "chmod 0644 /system/app/Launcher/Launcher.apk"
%shell% "chown root:root /system/app/Launcher/Launcher.apk"

%shell% "chmod 0644 /system/app/ScriptRunner/ScriptRunner.apk"
%shell% "chown root:root /system/app/ScriptRunner/ScriptRunner.apk"

%sleep% 2

::cls
::echo Copying App Data back to /data/data/
::echo.
::%shell% "cp -r /system/restore/ca.dstudio.atvlauncher.pro/ /data/data/"
::%shell% "cp -r /system/restore/com.adamioan.scriptrunner/ /data/data/"
::%shell% "cp -r /system/restore/com.fluxii.android.mousetoggleforfiretv/ /data/data/"
::%shell% "chmod -R 0777 /data/data/ca.dstudio.atvlauncher.pro/"
::%shell% "chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db"
::%shell% "chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-shm"
::%shell% "chmod 0660 /data/data/ca.dstudio.atvlauncher.pro/databases/sections.db-wal"
::%shell% "chmod -R 0777 /data/data/com.adamioan.scriptrunner/"
::%shell% "chmod -R 0777 /data/data/com.fluxii.android.mousetoggleforfiretv/"

::%sleep% 2

cls
echo Installing BusyBox...
echo.
%push% "..\..\bin\android\busybox" /data/local/tmp/
%shell% "chmod 0777 /data/local/tmp/busybox"
%shell% "/data/local/tmp/busybox --install"

%sleep% 2

cls
echo Installing Magisk for SU Access...
echo.
%push% "..\..\rooting\tank\Magisk-v19.3.zip" /data/local/tmp/
%shell% "twrp install /data/local/tmp/Magisk-v19.3.zip"

%sleep% 2

cls
echo Fixing Permissions...
echo.
%twrp% fixperms /

cls
echo Preparing For Reboot...
echo.

%sleep% 8

cls
echo Waiting For ADB Service...
echo.
echo This may take up to 5 minutes or more and Remote Find screen will be loaded
echo.
echo Do not interact with the device yet!
echo.

%adb% reboot
%adbWait%
%sleep% 25
%shell% "nothing=nothing"
%sleep% 5

:stage3
:: Enable ADB and Unknown Sources
cls
echo Enabling ADB and Unknown Sources...
echo.
%shell% settings --user 0 put global adb_enabled 1
%shell% settings --user 0 put secure install_non_market_apps 1

%sleep% 5

set unkadb=0

echo.
echo Check For ADB and Unknown Sources Enable Status
echo.
echo NOTE: ADB is already enabled as a system service
echo This will also set these values in Amazon Settings app
echo.
echo Press 1 if there is an error, otherwise just press ENTER
echo.
set /p unkadb=

if %unkadb%==1 echo.
if %unkadb%==1 echo Waiting For ADB Service...
if %unkadb%==1 echo.
if %unkadb%==1 %sleep% 10
if %unkadb%==1 goto stage3

%sleep% 3

cls
color 0a
echo Finished!
echo.
echo Complete the user setup to configure remote, wifi, and Amazon account
echo.
echo Once on Launcher, use TitaniumBackup to restore data for
echo Home, Mouse Toggle, Reboot, and SH Script Runner Settings
echo.
echo Press any key to exit...
pause>nul


:end



