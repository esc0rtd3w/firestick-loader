#!/system/bin/sh

# Some directories in /data/data/ may not exist. They are attempted to be removed anyways

# Preserve ADB Settings
cp /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml /sdcard/


echo "Disabling Amazon Bloat...."
echo ""
echo ""

# Do Not Remove on 5.2.7.2 (Breaks Display and Applications Settings)
#pm disable amazon.jackson19

pm disable android.amazon.perm
pm disable com.amazon.acos.providers.UnifiedSettingsProvider
pm disable com.amazon.ags.app
pm disable com.amazon.android.marketplace
pm disable com.amazon.application.compatibility.enforcer
pm disable com.amazon.application.compatibility.enforcer.sdk.library
pm disable com.amazon.awvflingreceiver
pm disable com.amazon.bueller.music
pm disable com.amazon.bueller.notification
pm disable com.amazon.connectivitydiag
pm disable com.amazon.device.crashmanager
pm disable com.amazon.device.messaging
pm disable com.amazon.device.messaging.sdk.internal.library
pm disable com.amazon.device.messaging.sdk.library
pm disable com.amazon.device.sync
pm disable com.amazon.device.sync.sdk.internal
pm disable com.amazon.kindle.cms
pm disable com.amazon.kindle.devicecontrols
pm disable com.amazon.kso.blackbird
pm disable com.amazon.ods.kindleconnect
pm disable com.amazon.parentalcontrols
pm disable com.amazon.precog
pm disable com.amazon.providers
pm disable com.amazon.providers.contentsupport
pm disable com.amazon.recess
pm disable com.amazon.securitysyncclient
pm disable com.amazon.sharingservice.android.client.proxy
pm disable com.amazon.shpm

# sync-provider_ipc-tv-release
pm disable com.amazon.sync.provider.ipc

# Content Sync Framework (sync-service-fireos-tv-release)
pm disable com.amazon.sync.service

pm disable com.amazon.tv.legal.notices
pm disable com.amazon.tv.parentalcontrols
pm disable com.amazon.tv.support
pm disable com.amazon.tz.webcryptotzservice
pm disable com.amazon.videoads.app
pm disable com.amazon.visualonawv
pm disable com.amazon.webview
pm disable com.svox.pico

# Factory Data Reset Whitelist Manager
pm disable com.amazon.platform.fdrw

# FrameworksMetrics
pm disable com.amazon.tv.fw.metrics

# Amazon Device Settings Internal SDK (breaks Device and Applications Settings Activities)
#pm disable com.amazon.device.settings.sdk.internal.library

# Log Manager
pm disable com.amazon.device.logmanager

# OTA Related
pm disable com.amazon.dcp
pm disable com.amazon.dcp.contracts.framework.library
#pm disable com.amazon.dcp.contracts.library
pm disable com.amazon.device.software.ota
pm disable com.amazon.device.software.ota.override
pm disable com.amazon.settings.systemupdates
#pm disable com.amazon.device.software.ota.handler.OtaTaskHandler

# Launcher Related
pm disable com.amazon.tv.launcher
#pm disable com.amazon.tv.settings

# BuellerDeviceService
pm disable com.amazon.android.service.networkmonitor

# Removal May Break Some Stock Settings
#pm disable com.amazon.device.controllermanager
#pm disable com.amazon.device.lowstoragemanager
#pm disable com.amazon.fireinputdevices
#pm disable com.amazon.kindleautomatictimezone
#pm disable com.amazon.tv.ime
#pm disable com.amazon.tv.intentsupport
#pm disable com.amazon.tv.resolutioncycler
#pm disable com.amazon.unifiedshare.actionchooser

# Disable Breaks Applications and Signin (5.2.6.3 Tank)
#pm disable com.amazon.imp
#pm disable com.amazon.tv.oobe

# Removal Causes Vizzini To Constantly Produce Errors (5.2.6.3 Tank)
#pm disable com.amazon.communication.discovery

# Breaks Amazon Related Logins/Netflix, etc
#pm disable com.amazon.identity.auth.device.authorization

# Breaks Settings UI (5.2.6.3 Tank)
#pm disable com.amazon.client.metrics
#pm disable com.amazon.client.metrics.api

# com.amazon.client.metrics.api 2.0
#pm disable com.amazon.metrics.api

# System Status Monitor
#pm disable com.amazon.ssm
#pm disable com.amazon.ssmsys

# Help Related
pm disable com.amazon.tmm.tutorial
pm disable com.amazon.tv.csapp

# Amazon Screensaver
pm disable com.amazon.bueller.photos

# Possibe Remote Update??
pm disable com.amazon.device.bluetoothdfu

# Captive Portal Launcher
#pm disable com.amazon.cpl
#pm disable com.android.captiveportallogin

# Amazon Voice Support (Alexa Media Player)
pm disable com.amazon.vizzini

# Amazon Remote Android App
#pm disable com.amazon.storm.lightning.services
#pm disable com.amazon.storm.lightning.tutorial
#pm disable com.amazon.whisperlink.core.android
#pm disable com.amazon.whisperplay.contracts
#pm disable com.amazon.whisperplay.service.install

# Removal of (tcomm/dplogger) breaks Amazon Android FireTV Remote App Connection
# Amazon Communication Services Client Library
#pm disable com.amazon.tcomm
#pm disable com.amazon.tcomm.client
#pm disable com.amazon.dp.logger

# Screen Mirroring Function
#pm disable com.amazon.wcast.sink

# Only Disable If Amazon Video and Store Will Not Be Needed as User Installed APKs
pm disable com.amazon.avod
pm disable com.amazon.shoptv.client
pm disable com.amazon.venezia

# Home may kill enough by itself (untested)
#pm disable com.amazon.tv.launcher/.ui.HomeActivity

#pm disable com.amazon.tv.launcher/.ui.ItemLoadingActivity
#pm disable com.amazon.tv.launcher/.ui.purchase.OffDeviceSubscriptionActivity
#pm disable com.amazon.tv.launcher/.ui.Channel1DActivity
#pm disable com.amazon.tv.launcher/.ui.TVActivity
#pm disable com.amazon.tv.launcher/.ui.SearchMenuActivity
#pm disable com.amazon.tv.launcher/.ui.MoviesActivity
#pm disable com.amazon.tv.launcher/.ui.YoursToWatchActivity
#pm disable com.amazon.tv.launcher/.ui.ReleaseNotesActivity
#pm disable com.amazon.tv.launcher/.ui.purchase.VideoItemPurchaseActivity
#pm disable com.amazon.tv.launcher/.ui.service.LeftNavOverlayService

#pm disable com.amazon.tv.launcher/.primefreetrial.PrimeFreeTrialActivity
#pm disable com.amazon.tv.launcher/.content.ComradeReceiver
#pm disable com.amazon.tv.launcher/.demo.DemoPackageAddedReceiver
#pm disable com.amazon.tv.launcher/.ads.AdRefreshReceiver
#pm disable com.amazon.tv.launcher/.util.CategorySearchReceiver
#pm disable com.amazon.tv.launcher/.util.LauncherPreloaderReceiver
#pm disable com.amazon.tv.launcher/.parentalcontrols.PCONPermissionsReceiver
#pm disable com.amazon.tv.launcher/com.amazon.tv.mediabrowse.service.MediaBrowseServiceImpl

#pm disable com.amazon.tv.settings/.blackcurtain.BlackCurtainActivity
#pm disable com.amazon.tv.settings/.blackcurtain.AdultContentPrefsActivity
#pm disable com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
#pm disable com.amazon.tv.settings/.tv.AmazonAccountSettingsActivity
#pm disable com.amazon.tv.settings/.tv.BuellerAccountSettingsActivity
#pm disable com.amazon.tv.settings/.tv.AlexaSettingsActivity
#pm disable com.amazon.tv.settings/.auth.BuellerSettingsMAPInformationProvider
#pm disable com.amazon.tv.settings/.PCONPermissionsReceiver

# App Blacklisting
#pm disable com.amazon.tv.settings/com.amazon.tv.settings.tv.AppDisableService

# Disable Sleep Screen (Hold HOME Button)
#pm disable com.amazon.tv.settings/.hud.HomeLongPressReceiver

# Disable Factory Reset Option
#pm disable com.amazon.tv.settings/com.amazon.tv.settings.tv.FactoryResetActivity

# Amazon Download Manager
pm disable com.android.providers.downloads

# Amazon Documents UI
pm disable com.android.documentsui

# Device Provisioner
pm disable com.android.managedprovisioning

# VoiceView
pm disable com.amazon.logan

# USB Tuner
# pm disable com.amazon.malcolm

# Misc
#pm disable com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
#pm disable com.amazon.tv.settings/.tv.usb.AppScanReceiver
#pm disable com.amazon.tv.settings.tv.usb.PackageMovedLocation

# FireOS 5.2.1.1
pm disable com.amazon.tv.nimh
pm disable com.ivona.tts.oem
pm disable com.ivona.orchestrator
pm disable com.amazon.device.sale.service
pm disable com.amazon.advertisingidsettings
#pm disable com.amazon.tz.webcryptotzservice

# FireOS 5.2.6.2
pm disable com.amazon.alexashopping
pm disable com.amazon.ftv.glorialist
pm disable com.amazon.tv.livetv
pm disable com.amazon.amazonvideo.livingroom
pm disable com.amazon.kor.demo

# RemoteSettingsAndroid
#pm disable com.amazon.device.settings

# com.amazon.webview.awvdeploymentservice Developer Build
pm disable com.amazon.webview.awvdeploymentservice

# OttSsoLib
# pm disable com.amazon.tv.ottssolib

# OttSsoCompanionApp
# pm disable com.amazon.tv.ottssocompanionapp

# WiFi Locker
pm disable com.amazon.wifilocker

# Amazon Echo???
pm disable com.amazon.ssdpservice

# Settings Notification Center
#pm disable com.amazon.tv.notificationcenter

# FireOS 5.2.6.3
# Fire Basic Keyboard (Simplified Chinese)
pm disable com.android.inputmethod.pinyin

# Fitbit Support???
pm disable com.amazon.alta.h2clientservice

# DIAL (Discovery-and-Launch) protocol (allow apps to access via second screen)
pm disable com.amazon.dialservice

# CustomMediaController
pm disable com.amazon.cardinal

# TIFObserverService
pm disable com.amazon.tifobserver

# Amazon WebView Metrics Service
pm disable com.amazon.webview.metrics.service

# FireOS 5.2.6.7

# ACAFireTVAndroidClient
pm disable com.amazon.aca

# Aria AriaRuntime
pm disable com.amazon.aria

# Unknown)
pm disable com.amazon.firehomestarter

# Fire TV Recast --
pm disable com.amazon.franktvinput

# (Unknown)
pm disable com.amazon.gloria.graphiq

# News
pm disable com.amazon.hedwig

# Naatyam (Unknown)
pm disable com.amazon.naatyam

# KFTV Legal Notices
pm disable com.amazon.tv.legal.notices

# SmartConnectService (Unknown)
# pm disable com.amazon.net.smartconnect

# TMMTutorial
pm disable com.amazon.tmm.tutorial

# pm disable com.amazon.tv.forcedotaupdater
pm disable TIFObserverService

# FireOS 5.2.7.2

# Alexa Media Controller
pm disable com.amazon.alexa.externalmediaplayer.fireos

# BluetoothKeyMapLib (Unknown)
# pm disable com.amazon.device.bluetoothkeymaplib

# ALE (Unknown)
pm disable com.amazon.ale

# My Application 2.0 (WTF! LMAO)
pm disable com.amazon.appaccesskeyprovider

# Alexa Voice Layer
pm disable com.amazon.avl.ftv

# Ceviche (Unknown)
pm disable com.amazon.ceviche

# Unknown
pm disable com.amazon.dpcclient

# Prime Video PVFTV
pm disable com.amazon.firebat

# FireRESTAPIFramework
pm disable com.amazon.firerestapiframework

# Gloria
pm disable com.amazon.ftv.glorialist

# Screensaver (REMOVAL CAN BREAK AMAZON UI)
# pm disable com.amazon.ftv.screensaver

# com.amazon.ftv.xpicker stub-apk
pm disable com.amazon.ftv.xpicker

# Katoch (Unknown)
pm disable com.amazon.katoch

# pm disable com.amazon.providers.tv

# Fire TV Alexa Alerts
pm disable com.amazon.tv.alexaalerts

# Unknown

# Equipment Control (REMOVAL CAN BREAK AMAZON UI)
# pm disable com.amazon.devicecontrol
# pm disable com.amazon.tv.devicecontrol
# pm disable com.amazon.tv.devicecontrolsettings

# Forced App Updater
pm disable com.amazon.tv.forcedotaupdater.v2

# ReleaseNotes
pm disable com.amazon.tv.releasenotes

# FTV Routing
pm disable com.amazon.tv.routing

# Amazon Settings Core (REMOVAL CAN BREAK AMAZON UI)
# pm disable com.amazon.tv.settings.core

# Amazon Settings v2 (REMOVAL CAN BREAK AMAZON UI)
# pm disable com.amazon.tv.settings.v2

# Amazon FreeTime
pm disable com.amazon.tahoe

# Whisper Join FFS Middleware
pm disable com.amazon.whisperjoin.middleware.np

# Unknown
pm disable com.amznfuse.operatorredirection

exit
echo "Deleting Amazon Bloat...."
echo ""
echo ""

mount -o rw,remount /system

# ===============FireOS 5.0.5 Default START===============
# Tested Removal OK

# Do Not Remove on 5.2.7.2 (Breaks Display and Applications Settings)
#rm -r /system/priv-app/amazon.jackson-19/

rm -r /system/priv-app/AmazonKKWebViewLib/
rm -r /system/priv-app/BackupRestoreConfirmation/
rm -r /system/priv-app/com.amazon.ags.app/
rm -r /system/priv-app/com.amazon.avod/
rm -r /system/priv-app/com.amazon.bueller.music/
rm -r /system/priv-app/com.amazon.device.sync/
rm -r /system/priv-app/com.amazon.device.sync.sdk.internal/
rm -r /system/priv-app/com.amazon.kindle.cms-service/
rm -r /system/priv-app/com.amazon.kindle.devicecontrols/
rm -r /system/priv-app/com.amazon.kso.blackbird/
rm -r /system/priv-app/com.amazon.ods.kindleconnect/
rm -r /system/priv-app/com.amazon.parentalcontrols/
rm -r /system/priv-app/com.amazon.precog/
rm -r /system/priv-app/com.amazon.securitysyncclient/
rm -r /system/priv-app/com.amazon.sharingservice.android.client.proxy.release/
rm -r /system/priv-app/com.amazon.shoptv.client/
rm -r /system/priv-app/com.amazon.tv.aiv.support/
rm -r /system/priv-app/com.amazon.tv.legal.notices/
rm -r /system/priv-app/com.amazon.tv.parentalcontrols/
rm -r /system/priv-app/com.amazon.venezia/
rm -r /system/priv-app/com.amazon.videoads.app/
rm -r /system/priv-app/com.amazon.visualonawv/
rm -r /system/priv-app/ContentSupportProvider/
rm -r /system/priv-app/CrashManager/
rm -r /system/priv-app/DeviceClientPlatformContractsFramework/
rm -r /system/priv-app/DeviceMessagingAndroid/
rm -r /system/priv-app/DeviceMessagingAndroidInternalSDK/
rm -r /system/priv-app/DeviceMessagingAndroidSDK/
rm -r /system/priv-app/DownloadProvider/
rm -r /system/priv-app/FireApplicationCompatibilityEnforcer/
rm -r /system/priv-app/FireApplicationCompatibilityEnforcerSDK/
rm -r /system/priv-app/FireOsMiddlewareDebugApp/
rm -r /system/priv-app/FireRecessProxy/
rm -r /system/priv-app/FireTVDefaultMediaReceiver/
rm -r /system/priv-app/FireTvNotificationService/
rm -r /system/priv-app/FireTVSystemUI/
rm -r /system/priv-app/FusedLocation/
rm -r /system/priv-app/LogManager/
rm -r /system/priv-app/ManagedProvisioning/
rm -r /system/priv-app/marketplace_service_receiver/
rm -r /system/priv-app/shipmode/
rm -r /system/priv-app/sync-provider_ipc-release/
rm -r /system/priv-app/sync-service-fireos-release/

# com.amazon.sync.service
rm -r /system/priv-app/sync-service-fireos-tv-release/

rm -r /system/priv-app/UnifiedShareActivityChooser/
rm -r /system/priv-app/WallpaperCropper/

# Launcher Related
rm -r /system/priv-app/com.amazon.tv.launcher/
#rm -r /system/priv-app/com.amazon.tv.settings/

# OTA Related
rm -r /system/priv-app/DeviceSoftwareOTA/
rm -r /system/priv-app/DeviceSoftwareOTAIdleOverride/
rm -r /system/priv-app/SystemUpdatesUI/

# Help Related
rm -r /system/priv-app/com.amazon.tmm.tutorial/

# Removal Breaks Applications and Signin (5.2.6.3 Tank)
#rm -r /system/priv-app/com.amazon.imp/
#rm -r /system/priv-app/com.amazon.tv.oobe/

# Removal Causes Vizzini To Constantly Produce Errors (5.2.6.3 Tank)
#rm -r /system/priv-app/com.amazon.communication/
#rm -r /system/priv-app/com.amazon.communication.discovery/

# Breaks Amazon Related Logins/Netflix, etc
#rm -r /system/priv-app/com.amazon.identity.auth.device.authorization/

# Used For Network Status Under Wifi / System Monitor UI and Base

# BuellerDeviceService
rm -r /system/priv-app/AmazonNetworkMonitor/

#rm -r /system/priv-app/SystemStatusMonitor/
#rm -r /system/priv-app/SystemStatusMonitorSys

# Help Related
rm -r /system/priv-app/com.amazon.tv.csapp/

# Possibe Remote Update??
rm -r /system/priv-app/com.amazon.device.bluetoothdfu/

# Fitbit Support???
rm -r /system/priv-app/com.amazon.h2clientservice/

# Voice?
rm -r /system/priv-app/com.amazon.vizzini/

# Breaks Settings UI

# com.amazon.client.metrics.api 2.0
#rm -r /system/priv-app/com.amazon.metrics.api/

# com.amazon.client.metrics.api 1.2
#rm -r /system/priv-app/MetricsApi/
# ===============FireOS 5.0.5 Default END===============

# ===============FireOS 5.2.1.0 START===============

# Still Needs Testing
#rm -r /system/priv-app/com.amazon.fireinputdevices/
#rm -r /system/priv-app/com.amazon.kindleautomatictimezone/
#rm -r /system/priv-app/com.amazon.tv.ime/
#rm -r /system/priv-app/DefaultContainerService/
#rm -r /system/priv-app/DownloadProviderUi/
#rm -r /system/priv-app/ExternalStorageProvider/
#rm -r /system/priv-app/MediaProvider/
#rm -r /system/priv-app/MetricsService/
#rm -r /system/priv-app/OneTimeInitializer/
#rm -r /system/priv-app/ProxyHandler/
#rm -r /system/priv-app/SettingsProvider/
#rm -r /system/priv-app/SharedStorageBackup/
#rm -r /system/priv-app/Shell/
#rm -r /system/priv-app/VpnDialogs/

rm -r /system/priv-app/ConnectivityDiag/


# Other Apps That May Be Wanted/Needed For Different People/Operations

# Amazon Screensaver
rm -r /system/priv-app/com.amazon.bueller.photos/

# Amazon Remote Android App
#rm -r /system/priv-app/com.amazon.storm.lightning.services/
#rm -r /system/priv-app/com.amazon.storm.lightning.tutorial/
#rm -r /system/priv-app/WhisperlinkSdk/
#rm -r /system/priv-app/WhisperplayCore/
#rm -r /system/priv-app/WhisperplayInstall/

# Removal of (tcomm/dplogger) breaks Amazon Android FireTV Remote App Connection
# Amazon Communication Services Client Library
#rm -r /system/priv-app/com.amazon.tcomm/
#rm -r /system/priv-app/com.amazon.tcomm.client/
#rm -r /system/priv-app/com.amazon.dp.logger/

# Captive Portal Launcher
#rm -r /system/priv-app/CaptivePortalLauncher/
#rm -r /system/app/CaptivePortalLogin/

# Amazon Voice Support
rm -r /system/priv-app/AlexaMediaPlayer/

# Screen Mirroring Function
#rm -r /system/priv-app/WhisperCastConnect/


# Needed For Amazon Settings UI (Removal Will Break Stock Settings)

# DCP Platform Contracts (com.amazon.dcp.contracts.library)
#rm -r /system/priv-app/DeviceSoftwareOTAContracts/

# Amazon Device Settings (com.amazon.device.settings)
#rm -r /system/priv-app/RemoteSettingsAndroid/

# Amazon Device Settings Internal SDK (breaks Device and Applications Settings Activities)
#rm -r /system/priv-app/RemoteSettingsInternalSDK/

# VoiceView
rm -r /system/priv-app/logan/

# USB Tuner
# rm -r /system/priv-app/com.amazon.malcolm/
# ===============FireOS 5.2.1.0 END===============


# ===============FireOS 5.2.1.1 START===============
rm -r /system/priv-app/AdvertisingIdSettings/
rm -r /system/priv-app/com.amazon.tv.nimh/
rm -r /system/priv-app/FireTvSaleService/
rm -r /system/priv-app/IvonaTTS/
rm -r /system/priv-app/IvonaTtsOrchestrator/
rm -r /system/priv-app/TvProvider/
# ===============FireOS 5.2.1.1 END===============

# ===============FireOS 5.2.6.2 START===============
rm -r /system/priv-app/com.amazon.alexashopping/
#rm -r /system/priv-app/com.amazon.device.settings/
rm -r /system/priv-app/com.amazon.ftv.glorialist/
rm -r /system/priv-app/com.amazon.tv.livetv/
rm -r /system/priv-app/com.amazon.amazonvideo.livingroom/
rm -r /system/priv-app/com.amazon.kor.demo/

# WiFi Locker
rm -r /system/priv-app/CredentialLockerAndroid-tablet-release/

# com.amazon.webview.awvdeploymentservice Developer Build
rm -r /system/priv-app/AwvDeploymentService/

# Amazon WebView Metrics Service
rm -r /system/priv-app/AwvMetricsService/

# OttSsoLib
# rm -r /system/priv-app/com.amazon.tv.ottssolib/

# OttSsoCompanionApp
# rm -r /system/priv-app/com.amazon.tv.ottssocompanionapp/

# Log Manager
rm -r /system/priv-app/LogManager-logd/

# System Status Monitor
#rm -r /system/priv-app/SystemStatusMonitor/
#rm -r /system/priv-app/SystemStatusMonitorSys/

# Amazon Echo???
rm -r /system/priv-app/SsdpService/

# Settings Notification Center
#rm -r /system/priv-app/com.amazon.tv.notificationcenter/

# DIAL (Discovery-and-Launch) protocol (allow apps to access via second screen)
rm -r /system/priv-app/DialService/

# Fire Basic Keyboard (Simplified Chinese)
rm -r /system/app/PinyinIME/

# CustomMediaController
rm -r /system/priv-app/com.amazon.cardinal/
# ===============FireOS 5.2.6.2 END===============


# ===============FireOS 5.2.6.7 START===============

# ACAFireTVAndroidClient
rm -r /system/priv-app/com.amazon.aca/

# Aria AriaRuntime
rm -r /system/priv-app/com.amazon.aria/

# com.amazon.firehomestarter (Unknown)
rm -r /system/priv-app/com.amazon.firehomestarter/

# Fire TV Recast --
rm -r /system/priv-app/com.amazon.franktvinput/

# com.amazon.gloria.graphiq (Unknown)
rm -r /system/priv-app/com.amazon.gloria.graphiq/

# News
rm -r /system/priv-app/com.amazon.hedwig/

# Naatyam (Unknown)
rm -r /system/priv-app/com.amazon.naatyam/

# KFTV Legal Notices
rm -r /system/priv-app/com.amazon.tv.legal.notices/

# SmartConnectService (Unknown)
# rm -r /system/priv-app/com.amazon.net.smartconnect/

# TMMTutorial
rm -r /system/priv-app/com.amazon.tmm.tutorial/

rm -r /system/priv-app/com.amazon.tv.forcedotaupdater/
rm -r /system/priv-app/TIFObserverService/
# ===============FireOS 5.2.6.7 END===============


# ===============FireOS 5.2.7.2 START===============

# com.amazon.device.bluetoothkeymaplib (Unknown)
# rm -r /system/priv-app/BluetoothKeyMapLib/

# ALE (Unknown)
rm -r /system/priv-app/com.amazon.ale/

# My Application 2.0 (WTF! LMAO)
rm -r /system/priv-app/com.amazon.appaccesskeyprovider/

# Alexa Voice Layer
rm -r /system/priv-app/com.amazon.avl.firetv/

# Ceviche (Unknown)
rm -r /system/priv-app/com.amazon.ceviche/

# Unknown
rm -r /system/priv-app/com.amazon.dpcclient/

# Prime Video PVFTV
rm -r /system/priv-app/com.amazon.firebat/

# FireRESTAPIFramework
rm -r /system/priv-app/com.amazon.firerestapiframework/

# Gloria
rm -r /system/priv-app/com.amazon.ftv.glorialist/

# Screensaver (REMOVAL CAN BREAK AMAZON UI)
# rm -r /system/priv-app/com.amazon.ftv.screensaver/

# com.amazon.ftv.xpicker stub-apk
rm -r /system/priv-app/com.amazon.ftv.xpicker/

# Katoch (Unknown)
rm -r /system/priv-app/com.amazon.katoch/

# rm -r /system/priv-app/com.amazon.providers.tv/

# Fire TV Alexa Alerts
rm -r /system/priv-app/com.amazon.tv.alexaalerts/

# Equipment Control (REMOVAL CAN BREAK AMAZON UI)
# rm -r /system/priv-app/com.amazon.tv.devicecontrol/
# rm -r /system/priv-app/com.amazon.tv.devicecontrolsettings/

# Forced App Updater
rm -r /system/priv-app/com.amazon.tv.forcedotaupdater.v2/

# ReleaseNotes
rm -r /system/priv-app/com.amazon.tv.releasenotes/

# FTV Routing
rm -r /system/priv-app/com.amazon.tv.routing/

# Amazon Settings Core (REMOVAL CAN BREAK AMAZON UI)
# rm -r /system/priv-app/com.amazon.tv.settings.core/

# Amazon Settings v2 (REMOVAL CAN BREAK AMAZON UI)
# rm -r /system/priv-app/com.amazon.tv.settings.v2/

# Amazon FreeTime
rm -r /system/priv-app/com.amazon.tahoe/

# Whisper Join FFS Middleware
rm -r /system/priv-app/com.amazon.whisperjoin.middleware.np/

# com.amznfuse.operatorredirection (Unknown)
rm -r /system/priv-app/com.amznfuse.operatorredirection/

# com.amazon.sync.provider.ipc
rm -r /system/priv-app/sync-provider_ipc-tv-release/
# ===============FireOS 5.2.7.2 END===============


# ===============From /system/app/ START===============

#rm -r /system/app/AmazonDeviceMetrics/
#rm -r /system/app/FireTvResolutionCycler/

# Amazon Enterprise Controls
rm -r /system/app/DeviceControlService/

rm -r /system/app/DocumentsUI/

# Factory Data Reset Whitelist Manager
rm -r /system/app/fdrw/

# FrameworksMetrics
rm -r /system/app/FrameworksMetrics/

rm -r /system/app/PicoTts/
rm -r /system/app/UnifiedSettingsProvider/
rm -r /system/app/WebCryptoTZService/
rm -r /system/app/WhiteListedUrlProvider/

# FireOS 5.2.7.2

# Alexa Media Controller
rm -r /system/app/com.amazon.alexa.externalmediaplayer.fireos/

#rm -r /system/app/CredentialStorage/
#rm -r /system/app/FireOsMiddlewareDebugApp/

#rm -r /system/app/sync-service-fireos-tv-release/
# ===============From /system/app/ END===============


# Other System Apps

# Framework Directory
rm -r /system/framework/android.amazon.perm/

# JAR Files (REMOVAL OF SOME OF THESE BREAKS SETTINGS!!)
#rm -r /system/framework/amazon-ads-registration.jar
#rm -r /system/framework/precog-api.jar
#rm -r /system/framework/retaildemoapi.jar
#rm -r /system/framework/android.test.runner.jar
#rm -r /system/framework/com.amazon.kindle.cms.jar
#rm -r /system/framework/com.amazon.sync.api.jar

# FireOS JAR Files (REMOVAL BREAKS SETTINGS!!)
#rm -r /system/framework/fireosapiext.jar
#rm -r /system/framework/fireoscapability.jar
#rm -r /system/framework/fireosext.jar
#rm -r /system/framework/fireosmgr.jar
#rm -r /system/framework/fireospolicy.jar
#rm -r /system/framework/fireossvc.jar
#rm -r /system/framework/fireosutil.jar


# Android Census
#rm -r /system/framework/com.amazon.sics.jar


rm -r /data/data/amazon.jackson-19/
rm -r /data/data/AmazonKKWebViewLib/
rm -r /data/data/BackupRestoreConfirmation/
rm -r /data/data/com.amazon.ags.app/
rm -r /data/data/com.amazon.avod/
rm -r /data/data/com.amazon.bueller.music/
rm -r /data/data/com.amazon.device.bluetoothdfu/
rm -r /data/data/com.amazon.device.sync/
rm -r /data/data/com.amazon.device.sync.sdk.internal/
rm -r /data/data/com.amazon.kindle.cms-service/
rm -r /data/data/com.amazon.kindle.devicecontrols/
rm -r /data/data/com.amazon.kso.blackbird/
rm -r /data/data/com.amazon.ods.kindleconnect/
rm -r /data/data/com.amazon.parentalcontrols/
rm -r /data/data/com.amazon.precog/
rm -r /data/data/com.amazon.securitysyncclient/
rm -r /data/data/com.amazon.sharingservice.android.client.proxy.release/
rm -r /data/data/com.amazon.shoptv.client/
rm -r /data/data/com.amazon.tv.aiv.support/
rm -r /data/data/com.amazon.tv.legal.notices/
rm -r /data/data/com.amazon.tv.parentalcontrols/
rm -r /data/data/com.amazon.venezia/
rm -r /data/data/com.amazon.videoads.app/
rm -r /data/data/com.amazon.visualonawv/

# Launcher Related
rm -r /data/data/com.amazon.tv.launcher/
#rm -r /data/data/com.amazon.tv.settings/

# Help Related
rm -r /data/data/com.amazon.tmm.tutorial/
rm -r /data/data/com.amazon.tv.csapp/

# Breaks Settings UI

# com.amazon.client.metrics.api 2.0
#rm -r /data/data/com.amazon.metrics.api/

# CustomMediaController
rm -r /data/data/com.amazon.cardinal/

# Removal May Break Some Stock Settings
#rm -r /data/data/com.amazon.bueller.photos/
#rm -r /data/data/com.amazon.fireinputdevices/
#rm -r /data/data/com.amazon.kindleautomatictimezone/
#rm -r /data/data/com.amazon.tv.ime/

# Removal Breaks Applications and Signin (5.2.6.3 Tank)
#rm -r /data/data/com.amazon.imp/
#rm -r /data/data/com.amazon.tv.oobe/

# Removal Causes Vizzini To Constantly Produce Errors (5.2.6.3 Tank)
#rm -r /data/data/com.amazon.communication/
#rm -r /data/data/com.amazon.communication.discovery/

# Breaks Amazon Related Logins???
#rm -r /data/data/com.amazon.identity.auth.device.authorization/

# Disable Causes Network Errors??? (5.2.6.3 Tank)

# BuellerDeviceService
rm -r /data/data/AmazonNetworkMonitor/

#rm -r /data/data/SystemStatusMonitor/
#rm -r /data/data/SystemStatusMonitorSys


rm -r /data/data/ContentSupportProvider/
rm -r /data/data/CrashManager/
#rm -r /data/data/DefaultContainerService/
rm -r /data/data/DeviceClientPlatformContractsFramework/
rm -r /data/data/DeviceMessagingAndroid/
rm -r /data/data/DeviceMessagingAndroidInternalSDK/
rm -r /data/data/DeviceMessagingAndroidSDK/
rm -r /data/data/DownloadProvider/
#rm -r /data/data/DownloadProviderUi/
#rm -r /data/data/ExternalStorageProvider/
rm -r /data/data/FireApplicationCompatibilityEnforcer/
rm -r /data/data/FireApplicationCompatibilityEnforcerSDK/
rm -r /data/data/FireOsMiddlewareDebugApp/
rm -r /data/data/FireRecessProxy/
rm -r /data/data/FireTVDefaultMediaReceiver/
rm -r /data/data/FireTvNotificationService/
rm -r /data/data/FireTVSystemUI/
rm -r /data/data/FusedLocation/
rm -r /data/data/LogManager/
rm -r /data/data/ManagedProvisioning/
rm -r /data/data/marketplace_service_receiver/
#rm -r /data/data/MediaProvider/
#rm -r /data/data/MetricsService/
#rm -r /data/data/OneTimeInitializer/
#rm -r /data/data/ProxyHandler/
#rm -r /data/data/SettingsProvider/
#rm -r /data/data/SharedStorageBackup/
#rm -r /data/data/Shell/
rm -r /data/data/shipmode/
rm -r /data/data/sync-provider_ipc-release/
rm -r /data/data/sync-service-fireos-release/
rm -r /data/data/UnifiedShareActivityChooser/
#rm -r /data/data/VpnDialogs/
rm -r /data/data/WallpaperCropper/

rm -r /data/data/ConnectivityDiag/

# OTA Related
rm -r /data/data/DeviceSoftwareOTA/
rm -r /data/data/DeviceSoftwareOTAIdleOverride/
rm -r /data/data/SystemUpdatesUI/

# Amazon Remote Android App
#rm -r /data/data/com.amazon.storm.lightning.services/
#rm -r /data/data/com.amazon.storm.lightning.tutorial/
#rm -r /data/data/com.amazon.whisperplay.contracts/
#rm -r /data/data/com.amazon.whisperlink.core.android/
#rm -r /data/data/com.amazon.whisperplay.service.install/

# Removal of (tcomm/dplogger) breaks Amazon Android FireTV Remote App Connection
# Amazon Communication Services Client Library
#rm -r /data/data/com.amazon.tcomm/
#rm -r /data/data/com.amazon.tcomm.client/
#rm -r /data/data/com.amazon.dp.logger/

# Captive Portal Launcher
#rm -r /data/data/CaptivePortalLauncher/

# Amazon Voice Support
rm -r /data/data/com.amazon.vizzini/

# Screen Mirroring???
#rm -r /data/data/WhisperCastConnect/

# Needed For Amazon Settings UI (ONLY FOR /system NOT /data/)
#rm -r /data/data/DeviceSoftwareOTAContracts/

# Amazon Device Settings
#rm -r /data/data/RemoteSettingsAndroid/

# Amazon Device Settings Internal SDK (breaks Device and Applications Settings Activities)
#rm -r /data/data/RemoteSettingsInternalSDK/

# com.amazon.client.metrics.api 1.2
#rm -r /data/data/MetricsApi/

# VoiceView
rm -r /data/data/com.amazon.logan-1/

# Amazon WebView Metrics Service
rm -r /data/data/com.amazon.webview.metrics.service/

# From /system/app/
rm -r /data/data/DeviceControlService/
rm -r /data/data/DocumentsUI/
rm -r /data/data/fdrw/
rm -r /data/data/PicoTts/
rm -r /data/data/UnifiedSettingsProvider/
rm -r /data/data/WebCryptoTZService/
rm -r /data/data/WhiteListedUrlProvider/

# From /system/framework/
rm -r /data/data/android.amazon.perm/

# USB Tuner
# rm -r /data/data/com.amazon.malcolm/

# FireOS 5.2.1.1
rm -r /data/data/com.amazon.tv.nimh/
rm -r /data/data/AdvertisingIdSettings/
rm -r /data/data/FireTvSaleService/
rm -r /data/data/IvonaTTS/
rm -r /data/data/IvonaTtsOrchestrator/
rm -r /data/data/TvProvider/

# FireOS 5.2.6.2
rm -r /data/data/com.amazon.alexashopping/
# rm -r /data/data/com.amazon.cardinal/
# rm -r /data/data/com.amazon.device.settings/
rm -r /data/data/com.amazon.ftv.glorialist/
rm -r /data/data/com.amazon.tv.livetv/
rm -r /data/data/com.amazon.amazonvideo.livingroom/
rm -r /data/data/com.amazon.kor.demo/
rm -r /data/data/com.amazon.tifobserver/

# WiFi Locker
rm -r /data/data/CredentialLockerAndroid-tablet-release/

# com.amazon.webview.awvdeploymentservice Developer Build
rm -r /data/data/com.amazon.webview.awvdeploymentservice/

# OttSsoLib
# rm -r /data/data/com.amazon.tv.ottssolib/

# OttSsoCompanionApp
# rm -r /data/data/com.amazon.tv.ottssocompanionapp/

# Log Manager
rm -r /data/data/LogManager-logd/

# Amazon Echo???
rm -r /data/data/com.amazon.ssdpservice/

# Settings Notification Center
rm -r /data/data/com.amazon.tv.notificationcenter/

# Fire Basic Keyboard (Simplified Chinese)
rm -r /data/data/com.android.inputmethod.pinyin/

# Fitbit Support???
rm -r /data/data/com.amazon.alta.h2clientservice/

# DIAL (Discovery-and-Launch) protocol (allow apps to access via second screen)
rm -r /data/data/com.amazon.dialservice/

# System Status Monitor
#rm -r /data/data/com.amazon.ssm/
#rm -r /data/data/com.amazon.ssmsys/

# FrameworksMetrics
rm -r /data/data/com.amazon.tv.fw.metrics/

# FireOS 5.2.6.7

# ACAFireTVAndroidClient
# rm -r /data/data/com.amazon.aca-1/

# Aria AriaRuntime
rm -r /data/data/com.amazon.aria-1/

# rm -r /data/data/com.amazon.firehomestarter-1/
# rm -r /data/data/com.amazon.franktvinput-1/
# rm -r /data/data/com.amazon.gloria.graphiq-1/
# rm -r /data/data/com.amazon.hedwig-1/
# rm -r /data/data/com.amazon.naatyam-1/
# rm -r /data/data/com.amazon.net.smartconnect-1/
# rm -r /data/data/com.amazon.tmm.tutorial-1/
# rm -r /data/data/com.amazon.tv.forcedotaupdater-1/
# rm -r /data/data/TIFObserverService-1/


# FireOS 5.2.7.2
# rm -r /data/data/BluetoothKeyMapLib-1/

# ALE (Unknown)
rm -r /data/data/com.amazon.ale-1/

# rm -r /data/data/com.amazon.appaccesskeyprovider-1/

# Alexa Voice Layer
rm -r /data/data/com.amazon.avl.ftv-1/

# Ceviche (Unknown)
# rm -r /data/data/com.amazon.ceviche-1/

# rm -r /data/data/com.amazon.dpcclient-1/
# rm -r /data/data/com.amazon.firebat-1/
# rm -r /data/data/com.amazon.firerestapiframework-1/
# rm -r /data/data/com.amazon.ftv.glorialist-1/
# rm -r /data/data/com.amazon.ftv.screensaver-1/
# rm -r /data/data/com.amazon.ftv.xpicker-1/
# rm -r /data/data/com.amazon.katoch-1/
# rm -r /data/data/com.amazon.providers.tv-1/
# rm -r /data/data/com.amazon.tv.alexaalerts-1/
# rm -r /data/data/com.amazon.tv.devicecontrol-1/
# rm -r /data/data/com.amazon.tv.devicecontrolsettings-1/
# rm -r /data/data/com.amazon.tv.forcedotaupdater.v2-1/
# rm -r /data/data/com.amazon.tv.releasenotes-1/
# rm -r /data/data/com.amazon.tv.routing-1/

# Amazon FreeTime
rm -r /data/data/com.amazon.tahoe-1/

# rm -r /data/data/com.amazon.tv.settings.core-1/
# rm -r /data/data/com.amazon.tv.settings.v2-1/
# rm -r /data/data/com.amazon.whisperjoin.middleware.np-1/
# rm -r /data/data/com.amznfuse.operatorredirection-1/




