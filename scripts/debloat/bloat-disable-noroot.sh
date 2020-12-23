#!/system/bin/sh

#clear
echo "Disabling Amazon Bloat...."
echo ""
echo ""

# Do Not Remove on 5.2.7.2 (Breaks Display and Applications Settings)
#pm disable-user --user 0 amazon.jackson19

pm disable-user --user 0 android.amazon.perm
pm disable-user --user 0 com.amazon.acos.providers.UnifiedSettingsProvider
pm disable-user --user 0 com.amazon.ags.app
pm disable-user --user 0 com.amazon.android.marketplace

# Do Not Remove For 5.2.7.2
# pm disable-user --user 0 com.amazon.application.compatibility.enforcer
# pm disable-user --user 0 com.amazon.application.compatibility.enforcer.sdk.library

pm disable-user --user 0 com.amazon.awvflingreceiver
pm disable-user --user 0 com.amazon.bueller.music
pm disable-user --user 0 com.amazon.bueller.notification
pm disable-user --user 0 com.amazon.connectivitydiag
pm disable-user --user 0 com.amazon.device.crashmanager
pm disable-user --user 0 com.amazon.device.messaging
pm disable-user --user 0 com.amazon.device.messaging.sdk.internal.library
pm disable-user --user 0 com.amazon.device.messaging.sdk.library
pm disable-user --user 0 com.amazon.device.sync
pm disable-user --user 0 com.amazon.device.sync.sdk.internal
pm disable-user --user 0 com.amazon.kindle.cms
pm disable-user --user 0 com.amazon.kindle.devicecontrols
pm disable-user --user 0 com.amazon.kso.blackbird
pm disable-user --user 0 com.amazon.ods.kindleconnect
pm disable-user --user 0 com.amazon.parentalcontrols
pm disable-user --user 0 com.amazon.precog
pm disable-user --user 0 com.amazon.providers
pm disable-user --user 0 com.amazon.providers.contentsupport
pm disable-user --user 0 com.amazon.recess
pm disable-user --user 0 com.amazon.securitysyncclient
pm disable-user --user 0 com.amazon.sharingservice.android.client.proxy
pm disable-user --user 0 com.amazon.shpm

# sync-provider_ipc-tv-release
pm disable-user --user 0 com.amazon.sync.provider.ipc

# Content Sync Framework (sync-service-fireos-tv-release)
pm disable-user --user 0 com.amazon.sync.service

pm disable-user --user 0 com.amazon.tv.legal.notices
pm disable-user --user 0 com.amazon.tv.parentalcontrols
pm disable-user --user 0 com.amazon.tv.support
pm disable-user --user 0 com.amazon.tz.webcryptotzservice
pm disable-user --user 0 com.amazon.videoads.app
pm disable-user --user 0 com.amazon.visualonawv
pm disable-user --user 0 com.amazon.webview
pm disable-user --user 0 com.svox.pico

# Factory Data Reset Whitelist Manager
pm disable-user --user 0 com.amazon.platform.fdrw

# FrameworksMetrics
pm disable-user --user 0 com.amazon.tv.fw.metrics

# Amazon Device Settings Internal SDK (breaks Device and Applications Settings Activities)
#pm disable-user --user 0 com.amazon.device.settings.sdk.internal.library

# Log Manager
pm disable-user --user 0 com.amazon.device.logmanager

# OTA Related
pm disable-user --user 0 com.amazon.dcp
pm disable-user --user 0 com.amazon.dcp.contracts.framework.library
#pm disable-user --user 0 com.amazon.dcp.contracts.library
pm disable-user --user 0 com.amazon.device.software.ota
pm disable-user --user 0 com.amazon.device.software.ota.override
pm disable-user --user 0 com.amazon.settings.systemupdates
#pm disable-user --user 0 com.amazon.device.software.ota.handler.OtaTaskHandler

# Launcher Related
pm disable-user --user 0 com.amazon.tv.launcher
#pm disable-user --user 0 com.amazon.tv.settings

# BuellerDeviceService
pm disable-user --user 0 com.amazon.android.service.networkmonitor

# Removal May Break Some Stock Settings
#pm disable-user --user 0 com.amazon.device.controllermanager
#pm disable-user --user 0 com.amazon.device.lowstoragemanager
#pm disable-user --user 0 com.amazon.fireinputdevices
#pm disable-user --user 0 com.amazon.kindleautomatictimezone
#pm disable-user --user 0 com.amazon.tv.ime
#pm disable-user --user 0 com.amazon.tv.intentsupport
#pm disable-user --user 0 com.amazon.tv.resolutioncycler
#pm disable-user --user 0 com.amazon.unifiedshare.actionchooser

# Disable Breaks Applications and Signin (5.2.6.3 Tank)
#pm disable-user --user 0 com.amazon.imp
#pm disable-user --user 0 com.amazon.tv.oobe

# Removal Causes Vizzini To Constantly Produce Errors (5.2.6.3 Tank)
#pm disable-user --user 0 com.amazon.communication.discovery

# Breaks Amazon Related Logins/Netflix, etc
#pm disable-user --user 0 com.amazon.identity.auth.device.authorization

# Breaks Settings UI (5.2.6.3 Tank)
#pm disable-user --user 0 com.amazon.client.metrics
#pm disable-user --user 0 com.amazon.client.metrics.api

# com.amazon.client.metrics.api 2.0
#pm disable-user --user 0 com.amazon.metrics.api

# System Status Monitor
#pm disable-user --user 0 com.amazon.ssm
#pm disable-user --user 0 com.amazon.ssmsys

# Help Related
pm disable-user --user 0 com.amazon.tmm.tutorial
pm disable-user --user 0 com.amazon.tv.csapp

# Amazon Screensaver
pm disable-user --user 0 com.amazon.bueller.photos

# Possibe Remote Update??
pm disable-user --user 0 com.amazon.device.bluetoothdfu

# Captive Portal Launcher
#pm disable-user --user 0 com.amazon.cpl
#pm disable-user --user 0 com.android.captiveportallogin

# Amazon Voice Support (Alexa Media Player)
pm disable-user --user 0 com.amazon.vizzini

# Amazon Remote Android App
#pm disable-user --user 0 com.amazon.storm.lightning.services
#pm disable-user --user 0 com.amazon.storm.lightning.tutorial
#pm disable-user --user 0 com.amazon.whisperlink.core.android
#pm disable-user --user 0 com.amazon.whisperplay.contracts
#pm disable-user --user 0 com.amazon.whisperplay.service.install

# Removal of (tcomm/dplogger) breaks Amazon Android FireTV Remote App Connection
# Amazon Communication Services Client Library
#pm disable-user --user 0 com.amazon.tcomm
#pm disable-user --user 0 com.amazon.tcomm.client
#pm disable-user --user 0 com.amazon.dp.logger

# Screen Mirroring Function
#pm disable-user --user 0 com.amazon.wcast.sink

# Only Disable If Amazon Video and Store Will Not Be Needed as User Installed APKs
pm disable-user --user 0 com.amazon.avod
pm disable-user --user 0 com.amazon.shoptv.client
pm disable-user --user 0 com.amazon.venezia

# Home may kill enough by itself (untested)
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.HomeActivity

#pm disable-user --user 0 com.amazon.tv.launcher/.ui.ItemLoadingActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.purchase.OffDeviceSubscriptionActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.Channel1DActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.TVActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.SearchMenuActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.MoviesActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.YoursToWatchActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.ReleaseNotesActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.purchase.VideoItemPurchaseActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.ui.service.LeftNavOverlayService

#pm disable-user --user 0 com.amazon.tv.launcher/.primefreetrial.PrimeFreeTrialActivity
#pm disable-user --user 0 com.amazon.tv.launcher/.content.ComradeReceiver
#pm disable-user --user 0 com.amazon.tv.launcher/.demo.DemoPackageAddedReceiver
#pm disable-user --user 0 com.amazon.tv.launcher/.ads.AdRefreshReceiver
#pm disable-user --user 0 com.amazon.tv.launcher/.util.CategorySearchReceiver
#pm disable-user --user 0 com.amazon.tv.launcher/.util.LauncherPreloaderReceiver
#pm disable-user --user 0 com.amazon.tv.launcher/.parentalcontrols.PCONPermissionsReceiver
#pm disable-user --user 0 com.amazon.tv.launcher/com.amazon.tv.mediabrowse.service.MediaBrowseServiceImpl

#pm disable-user --user 0 com.amazon.tv.settings/.blackcurtain.BlackCurtainActivity
#pm disable-user --user 0 com.amazon.tv.settings/.blackcurtain.AdultContentPrefsActivity
#pm disable-user --user 0 com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
#pm disable-user --user 0 com.amazon.tv.settings/.tv.AmazonAccountSettingsActivity
#pm disable-user --user 0 com.amazon.tv.settings/.tv.BuellerAccountSettingsActivity
#pm disable-user --user 0 com.amazon.tv.settings/.tv.AlexaSettingsActivity
#pm disable-user --user 0 com.amazon.tv.settings/.auth.BuellerSettingsMAPInformationProvider
#pm disable-user --user 0 com.amazon.tv.settings/.PCONPermissionsReceiver

# App Blacklisting
#pm disable-user --user 0 com.amazon.tv.settings/com.amazon.tv.settings.tv.AppDisableService

# Disable Sleep Screen (Hold HOME Button)
#pm disable-user --user 0 com.amazon.tv.settings/.hud.HomeLongPressReceiver

# Disable Factory Reset Option
#pm disable-user --user 0 com.amazon.tv.settings/com.amazon.tv.settings.tv.FactoryResetActivity

# Amazon Download Manager
pm disable-user --user 0 com.android.providers.downloads

# Amazon Documents UI
pm disable-user --user 0 com.android.documentsui

# Device Provisioner
pm disable-user --user 0 com.android.managedprovisioning

# VoiceView
pm disable-user --user 0 com.amazon.logan

# USB Tuner
# pm disable-user --user 0 com.amazon.malcolm

# Misc
#pm disable-user --user 0 com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
#pm disable-user --user 0 com.amazon.tv.settings/.tv.usb.AppScanReceiver
#pm disable-user --user 0 com.amazon.tv.settings.tv.usb.PackageMovedLocation

# FireOS 5.2.1.1
pm disable-user --user 0 com.amazon.tv.nimh
pm disable-user --user 0 com.ivona.tts.oem
pm disable-user --user 0 com.ivona.orchestrator
pm disable-user --user 0 com.amazon.device.sale.service
pm disable-user --user 0 com.amazon.advertisingidsettings
#pm disable-user --user 0 com.amazon.tz.webcryptotzservice

# FireOS 5.2.6.2
pm disable-user --user 0 com.amazon.alexashopping
pm disable-user --user 0 com.amazon.ftv.glorialist
pm disable-user --user 0 com.amazon.tv.livetv
pm disable-user --user 0 com.amazon.amazonvideo.livingroom
pm disable-user --user 0 com.amazon.kor.demo

# RemoteSettingsAndroid
#pm disable-user --user 0 com.amazon.device.settings

# com.amazon.webview.awvdeploymentservice Developer Build
pm disable-user --user 0 com.amazon.webview.awvdeploymentservice

# OttSsoLib
# pm disable-user --user 0 com.amazon.tv.ottssolib

# OttSsoCompanionApp
# pm disable-user --user 0 com.amazon.tv.ottssocompanionapp

# WiFi Locker
pm disable-user --user 0 com.amazon.wifilocker

# Amazon Echo???
pm disable-user --user 0 com.amazon.ssdpservice

# Settings Notification Center
#pm disable-user --user 0 com.amazon.tv.notificationcenter

# FireOS 5.2.6.3
# Fire Basic Keyboard (Simplified Chinese)
pm disable-user --user 0 com.android.inputmethod.pinyin

# Fitbit Support???
pm disable-user --user 0 com.amazon.alta.h2clientservice

# DIAL (Discovery-and-Launch) protocol (allow apps to access via second screen)
pm disable-user --user 0 com.amazon.dialservice

# CustomMediaController
pm disable-user --user 0 com.amazon.cardinal

# TIFObserverService
pm disable-user --user 0 com.amazon.tifobserver

# Amazon WebView Metrics Service
pm disable-user --user 0 com.amazon.webview.metrics.service

# FireOS 5.2.6.7

# ACAFireTVAndroidClient
pm disable-user --user 0 com.amazon.aca

# Aria AriaRuntime
pm disable-user --user 0 com.amazon.aria

# Unknown)
pm disable-user --user 0 com.amazon.firehomestarter

# Fire TV Recast --
pm disable-user --user 0 com.amazon.franktvinput

# (Unknown)
pm disable-user --user 0 com.amazon.gloria.graphiq

# News
pm disable-user --user 0 com.amazon.hedwig

# Naatyam (Unknown)
pm disable-user --user 0 com.amazon.naatyam

# KFTV Legal Notices
pm disable-user --user 0 com.amazon.tv.legal.notices

# SmartConnectService (Unknown)
# pm disable-user --user 0 com.amazon.net.smartconnect

# TMMTutorial
pm disable-user --user 0 com.amazon.tmm.tutorial

# pm disable-user --user 0 com.amazon.tv.forcedotaupdater
pm disable-user --user 0 TIFObserverService

# FireOS 5.2.7.2

# Alexa Media Controller
pm disable-user --user 0 com.amazon.alexa.externalmediaplayer.fireos

# BluetoothKeyMapLib (Unknown)
# pm disable-user --user 0 com.amazon.device.bluetoothkeymaplib

# ALE (Unknown)
pm disable-user --user 0 com.amazon.ale

# My Application 2.0 (WTF! LMAO)
pm disable-user --user 0 com.amazon.appaccesskeyprovider

# Alexa Voice Layer
pm disable-user --user 0 com.amazon.avl.ftv

# Ceviche (Unknown)
pm disable-user --user 0 com.amazon.ceviche

# Unknown
pm disable-user --user 0 com.amazon.dpcclient

# Prime Video PVFTV
pm disable-user --user 0 com.amazon.firebat

# FireRESTAPIFramework
pm disable-user --user 0 com.amazon.firerestapiframework

# Gloria
pm disable-user --user 0 com.amazon.ftv.glorialist

# Screensaver (REMOVAL CAN BREAK AMAZON UI)
# pm disable-user --user 0 com.amazon.ftv.screensaver

# com.amazon.ftv.xpicker stub-apk
pm disable-user --user 0 com.amazon.ftv.xpicker

# Katoch (Unknown)
pm disable-user --user 0 com.amazon.katoch

# pm disable-user --user 0 com.amazon.providers.tv

# Fire TV Alexa Alerts
pm disable-user --user 0 com.amazon.tv.alexaalerts

# Unknown

# Equipment Control (REMOVAL CAN BREAK AMAZON UI)
# pm disable-user --user 0 com.amazon.devicecontrol
# pm disable-user --user 0 com.amazon.tv.devicecontrol
# pm disable-user --user 0 com.amazon.tv.devicecontrolsettings

# Forced App Updater
pm disable-user --user 0 com.amazon.tv.forcedotaupdater.v2

# ReleaseNotes
pm disable-user --user 0 com.amazon.tv.releasenotes

# FTV Routing
pm disable-user --user 0 com.amazon.tv.routing

# Amazon Settings Core (REMOVAL CAN BREAK AMAZON UI)
# pm disable-user --user 0 com.amazon.tv.settings.core

# Amazon Settings v2 (REMOVAL CAN BREAK AMAZON UI)
# pm disable-user --user 0 com.amazon.tv.settings.v2

# Amazon FreeTime
pm disable-user --user 0 com.amazon.tahoe

# Whisper Join FFS Middleware
pm disable-user --user 0 com.amazon.whisperjoin.middleware.np

# Unknown
pm disable-user --user 0 com.amznfuse.operatorredirection


# ===============FireOS 5.2.7.3 START===============
# 5.2.7.3 Updated Packages (Update Package Names)

# pm disable-user --user 0 com.amazon.diode
# pm disable-user --user 0 com.amazon.ftvads.deeplinking
# pm disable-user --user 0 com.amazon.tv.arc
# pm disable-user --user 0 com.amazon.tv.easyupgrade
# pm disable-user --user 0 com.amazon.tv.turnstile
# pm disable-user --user 0 MinervaApi
# ===============FireOS 5.2.7.3 END===============



# ===============FireOS 5.2.7.7 START===============
# 5.2.7.7 Updated Packages

# pm disable-user --user 0 com.amazon.alexamediaplayer.runtime.ftv
# pm disable-user --user 0 com.amazon.avsyncslider
# pm disable-user --user 0 com.amazon.avsyncslider-stub
# pm disable-user --user 0 com.amazon.device.blepa
# pm disable-user --user 0 com.amazon.device.bluetoothpa
# pm disable-user --user 0 com.amazon.prism.android.service
# pm disable-user --user 0 com.amazon.tv.alexadestination-stub
# pm disable-user --user 0 com.amazon.tv.ffsprovisioneeclient

# 3025N to 3027N Update
# pm disable-user --user 0 com.amazon.hedwig
# pm disable-user --user 0 com.amazon.tv.alexadestination
# ===============FireOS 5.2.7.7 END=================


