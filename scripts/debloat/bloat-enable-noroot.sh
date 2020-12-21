#!/system/bin/sh

clear
echo "Enabling Amazon Bloat...."
echo ""
echo ""


pm enable-user --user 0 amazon.jackson19
pm enable-user --user 0 android.amazon.perm
pm enable-user --user 0 com.amazon.acos.providers.UnifiedSettingsProvider
pm enable-user --user 0 com.amazon.ags.app
pm enable-user --user 0 com.amazon.android.marketplace
pm enable-user --user 0 com.amazon.application.compatibility.enforcer
pm enable-user --user 0 com.amazon.application.compatibility.enforcer.sdk.library
pm enable-user --user 0 com.amazon.awvflingreceiver
pm enable-user --user 0 com.amazon.bueller.music
pm enable-user --user 0 com.amazon.bueller.notification
pm enable-user --user 0 com.amazon.connectivitydiag
pm enable-user --user 0 com.amazon.device.crashmanager
pm enable-user --user 0 com.amazon.device.messaging
pm enable-user --user 0 com.amazon.device.messaging.sdk.internal.library
pm enable-user --user 0 com.amazon.device.messaging.sdk.library
pm enable-user --user 0 com.amazon.device.settings
pm enable-user --user 0 com.amazon.device.sync
pm enable-user --user 0 com.amazon.device.sync.sdk.internal
pm enable-user --user 0 com.amazon.devicecontrol
pm enable-user --user 0 com.amazon.kindle.cms
pm enable-user --user 0 com.amazon.kindle.devicecontrols
pm enable-user --user 0 com.amazon.kso.blackbird
pm enable-user --user 0 com.amazon.ods.kindleconnect
pm enable-user --user 0 com.amazon.parentalcontrols
pm enable-user --user 0 com.amazon.precog
pm enable-user --user 0 com.amazon.providers
pm enable-user --user 0 com.amazon.providers.contentsupport
pm enable-user --user 0 com.amazon.recess
pm enable-user --user 0 com.amazon.securitysyncclient
pm enable-user --user 0 com.amazon.sharingservice.android.client.proxy
pm enable-user --user 0 com.amazon.shpm
pm enable-user --user 0 com.amazon.sync.provider.ipc
pm enable-user --user 0 com.amazon.sync.service
pm enable-user --user 0 com.amazon.tv.legal.notices
pm enable-user --user 0 com.amazon.tv.parentalcontrols
pm enable-user --user 0 com.amazon.tv.support
pm enable-user --user 0 com.amazon.tz.webcryptotzservice
pm enable-user --user 0 com.amazon.videoads.app
pm enable-user --user 0 com.amazon.visualonawv
pm enable-user --user 0 com.amazon.webview
pm enable-user --user 0 com.svox.pico

# Factory Data Reset Whitelist Manager
pm enable-user --user 0 com.amazon.platform.fdrw

# FrameworksMetrics
pm enable-user --user 0 com.amazon.tv.fw.metrics

# Amazon Device Settings Internal SDK (breaks Device and Applications Settings Activities)
pm enable-user --user 0 com.amazon.device.settings.sdk.internal.library

# Log Manager
pm enable-user --user 0 com.amazon.device.logmanager

# OTA Related
pm enable-user --user 0 com.amazon.dcp
pm enable-user --user 0 com.amazon.dcp.contracts.framework.library
pm enable-user --user 0 com.amazon.dcp.contracts.library
pm enable-user --user 0 com.amazon.device.software.ota
pm enable-user --user 0 com.amazon.device.software.ota.override
pm enable-user --user 0 com.amazon.settings.systemupdates
pm enable-user --user 0 com.amazon.device.software.ota.handler.OtaTaskHandler

# Launcher Related
pm enable-user --user 0 com.amazon.tv.launcher
pm enable-user --user 0 com.amazon.tv.settings

# BuellerDeviceService
pm enable-user --user 0 com.amazon.android.service.networkmonitor

# Removal May Break Some Stock Settings
pm enable-user --user 0 com.amazon.device.controllermanager
pm enable-user --user 0 com.amazon.device.lowstoragemanager
pm enable-user --user 0 com.amazon.fireinputdevices
pm enable-user --user 0 com.amazon.kindleautomatictimezone
pm enable-user --user 0 com.amazon.tv.ime
pm enable-user --user 0 com.amazon.tv.intentsupport
pm enable-user --user 0 com.amazon.tv.resolutioncycler
pm enable-user --user 0 com.amazon.unifiedshare.actionchooser

# enable Breaks Applications and Signin (5.2.6.3 Tank)
pm enable-user --user 0 com.amazon.imp
pm enable-user --user 0 com.amazon.tv.oobe

# Removal Causes Vizzini To Constantly Produce Errors (5.2.6.3 Tank)
pm enable-user --user 0 com.amazon.communication.discovery

# Breaks Amazon Related Logins/Netflix, etc
pm enable-user --user 0 com.amazon.identity.auth.device.authorization

# Breaks Settings UI (5.2.6.3 Tank)
pm enable-user --user 0 com.amazon.client.metrics
pm enable-user --user 0 com.amazon.client.metrics.api

# com.amazon.client.metrics.api 2.0
pm enable-user --user 0 com.amazon.metrics.api

# System Status Monitor
pm enable-user --user 0 com.amazon.ssm
pm enable-user --user 0 com.amazon.ssmsys

# Help Related
pm enable-user --user 0 com.amazon.tmm.tutorial
pm enable-user --user 0 com.amazon.tv.csapp

# Amazon Screensaver
pm enable-user --user 0 com.amazon.bueller.photos

# Possibe Remote Update??
pm enable-user --user 0 com.amazon.device.bluetoothdfu

# Captive Portal Launcher
pm enable-user --user 0 com.amazon.cpl
pm enable-user --user 0 com.android.captiveportallogin

# Amazon Voice Support (Alexa Media Player)
pm enable-user --user 0 com.amazon.vizzini

# Amazon Remote Android App
pm enable-user --user 0 com.amazon.storm.lightning.services
pm enable-user --user 0 com.amazon.storm.lightning.tutorial
pm enable-user --user 0 com.amazon.whisperlink.core.android
pm enable-user --user 0 com.amazon.whisperplay.contracts
pm enable-user --user 0 com.amazon.whisperplay.service.install

# Removal of (tcomm/dplogger) breaks Amazon Android FireTV Remote App Connection
# Amazon Communication Services Client Library
pm enable-user --user 0 com.amazon.tcomm
pm enable-user --user 0 com.amazon.tcomm.client
pm enable-user --user 0 com.amazon.dp.logger

# Screen Mirroring Function
pm enable-user --user 0 com.amazon.wcast.sink

# Only enable If Amazon Video and Store Will Not Be Needed as User Installed APKs
pm enable-user --user 0 com.amazon.avod
pm enable-user --user 0 com.amazon.shoptv.client
pm enable-user --user 0 com.amazon.venezia

# Home may kill enough by itself (untested)
pm enable-user --user 0 com.amazon.tv.launcher/.ui.HomeActivity

pm enable-user --user 0 com.amazon.tv.launcher/.ui.ItemLoadingActivity
pm enable-user --user 0 com.amazon.tv.launcher/.ui.purchase.OffDeviceSubscriptionActivity
pm enable-user --user 0 com.amazon.tv.launcher/.ui.Channel1DActivity
pm enable-user --user 0 com.amazon.tv.launcher/.ui.TVActivity
pm enable-user --user 0 com.amazon.tv.launcher/.ui.SearchMenuActivity
pm enable-user --user 0 com.amazon.tv.launcher/.ui.MoviesActivity
pm enable-user --user 0 com.amazon.tv.launcher/.ui.YoursToWatchActivity
pm enable-user --user 0 com.amazon.tv.launcher/.ui.ReleaseNotesActivity
pm enable-user --user 0 com.amazon.tv.launcher/.ui.purchase.VideoItemPurchaseActivity
pm enable-user --user 0 com.amazon.tv.launcher/.ui.service.LeftNavOverlayService

pm enable-user --user 0 com.amazon.tv.launcher/.primefreetrial.PrimeFreeTrialActivity
pm enable-user --user 0 com.amazon.tv.launcher/.content.ComradeReceiver
pm enable-user --user 0 com.amazon.tv.launcher/.demo.DemoPackageAddedReceiver
pm enable-user --user 0 com.amazon.tv.launcher/.ads.AdRefreshReceiver
pm enable-user --user 0 com.amazon.tv.launcher/.util.CategorySearchReceiver
pm enable-user --user 0 com.amazon.tv.launcher/.util.LauncherPreloaderReceiver
pm enable-user --user 0 com.amazon.tv.launcher/.parentalcontrols.PCONPermissionsReceiver
pm enable-user --user 0 com.amazon.tv.launcher/com.amazon.tv.mediabrowse.service.MediaBrowseServiceImpl

pm enable-user --user 0 com.amazon.tv.settings/.blackcurtain.BlackCurtainActivity
pm enable-user --user 0 com.amazon.tv.settings/.blackcurtain.AdultContentPrefsActivity
pm enable-user --user 0 com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
pm enable-user --user 0 com.amazon.tv.settings/.tv.AmazonAccountSettingsActivity
pm enable-user --user 0 com.amazon.tv.settings/.tv.BuellerAccountSettingsActivity
pm enable-user --user 0 com.amazon.tv.settings/.tv.AlexaSettingsActivity
pm enable-user --user 0 com.amazon.tv.settings/.auth.BuellerSettingsMAPInformationProvider
pm enable-user --user 0 com.amazon.tv.settings/.PCONPermissionsReceiver

# App Blacklisting
pm enable-user --user 0 com.amazon.tv.settings/com.amazon.tv.settings.tv.AppenableService

# enable Sleep Screen (Hold HOME Button)
pm enable-user --user 0 com.amazon.tv.settings/.hud.HomeLongPressReceiver

# enable Factory Reset Option
pm enable-user --user 0 com.amazon.tv.settings/com.amazon.tv.settings.tv.FactoryResetActivity

# Amazon Download Manager
pm enable-user --user 0 com.android.providers.downloads

# Amazon Documents UI
pm enable-user --user 0 com.android.documentsui

# Device Provisioner
pm enable-user --user 0 com.android.managedprovisioning

# VoiceView
pm enable-user --user 0 com.amazon.logan

# USB Tuner
pm enable-user --user 0 com.amazon.malcolm

# Misc
pm enable-user --user 0 com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
pm enable-user --user 0 com.amazon.tv.settings/.tv.usb.AppScanReceiver
pm enable-user --user 0 com.amazon.tv.settings.tv.usb.PackageMovedLocation

# FireOS 5.2.1.1
pm enable-user --user 0 com.amazon.tv.nimh
pm enable-user --user 0 com.ivona.tts.oem
pm enable-user --user 0 com.ivona.orchestrator
pm enable-user --user 0 com.amazon.device.sale.service
pm enable-user --user 0 com.amazon.advertisingidsettings
pm enable-user --user 0 com.amazon.tz.webcryptotzservice

# FireOS 5.2.6.2
pm enable-user --user 0 com.amazon.alexashopping
pm enable-user --user 0 com.amazon.device.settings
pm enable-user --user 0 com.amazon.ftv.glorialist
pm enable-user --user 0 com.amazon.tv.livetv
pm enable-user --user 0 com.amazon.amazonvideo.livingroom
pm enable-user --user 0 com.amazon.kor.demo

# com.amazon.webview.awvdeploymentservice Developer Build
pm enable-user --user 0 com.amazon.webview.awvdeploymentservice

# OttSsoLib
pm enable-user --user 0 com.amazon.tv.ottssolib

# OttSsoCompanionApp
pm enable-user --user 0 com.amazon.tv.ottssocompanionapp

# WiFi Locker
pm enable-user --user 0 com.amazon.wifilocker

# Amazon Echo???
pm enable-user --user 0 com.amazon.ssdpservice

# Settings Notification Center
pm enable-user --user 0 com.amazon.tv.notificationcenter

# FireOS 5.2.6.3
# Fire Basic Keyboard (Simplified Chinese)
pm enable-user --user 0 com.android.inputmethod.pinyin

# Fitbit Support???
pm enable-user --user 0 com.amazon.alta.h2clientservice

# DIAL (Discovery-and-Launch) protocol (allow apps to access via second screen)
pm enable-user --user 0 com.amazon.dialservice

# CustomMediaController
pm enable-user --user 0 com.amazon.cardinal

# TIFObserverService
pm enable-user --user 0 com.amazon.tifobserver

# Amazon WebView Metrics Service
pm enable-user --user 0 com.amazon.webview.metrics.service

# FireOS 5.2.6.7

# ACAFireTVAndroidClient
pm enable-user --user 0 com.amazon.aca

# Aria AriaRuntime
pm enable-user --user 0 com.amazon.aria

# Unknown)
pm enable-user --user 0 com.amazon.firehomestarter

# Fire TV Recast --
pm enable-user --user 0 com.amazon.franktvinput

# (Unknown)
pm enable-user --user 0 com.amazon.gloria.graphiq

# News
pm enable-user --user 0 com.amazon.hedwig

# Naatyam (Unknown)
pm enable-user --user 0 com.amazon.naatyam

# KFTV Legal Notices
pm enable-user --user 0 com.amazon.tv.legal.notices

# SmartConnectService (Unknown)
pm enable-user --user 0 com.amazon.net.smartconnect

# TMMTutorial
pm enable-user --user 0 com.amazon.tmm.tutorial

pm enable-user --user 0 com.amazon.tv.forcedotaupdater
pm enable-user --user 0 TIFObserverService

# FireOS 5.2.7.2

# Alexa Media Controller
pm enable-user --user 0 com.amazon.alexa.externalmediaplayer.fireos

# BluetoothKeyMapLib (Unknown)
pm enable-user --user 0 com.amazon.device.bluetoothkeymaplib

# ALE (Unknown)
pm enable-user --user 0 com.amazon.ale

# My Application 2.0 (WTF! LMAO)
pm enable-user --user 0 com.amazon.appaccesskeyprovider

# Alexa Voice Layer
pm enable-user --user 0 com.amazon.avl.ftv

# Ceviche (Unknown)
pm enable-user --user 0 com.amazon.ceviche

# Unknown
pm enable-user --user 0 com.amazon.dpcclient

# Prime Video PVFTV
pm enable-user --user 0 com.amazon.firebat

# FireRESTAPIFramework
pm enable-user --user 0 com.amazon.firerestapiframework

# Gloria
pm enable-user --user 0 com.amazon.ftv.glorialist

# Screensaver (REMOVAL CAN BREAK AMAZON UI)
pm enable-user --user 0 com.amazon.ftv.screensaver

# com.amazon.ftv.xpicker stub-apk
pm enable-user --user 0 com.amazon.ftv.xpicker

# Katoch (Unknown)
pm enable-user --user 0 com.amazon.katoch

pm enable-user --user 0 com.amazon.providers.tv

# Fire TV Alexa Alerts
pm enable-user --user 0 com.amazon.tv.alexaalerts

# Unknown
pm enable-user --user 0 com.amazon.tv.devicecontrol

# Equipment Control (REMOVAL CAN BREAK AMAZON UI)
pm enable-user --user 0 com.amazon.tv.devicecontrolsettings

# Forced App Updater
pm enable-user --user 0 com.amazon.tv.forcedotaupdater.v2

# ReleaseNotes
pm enable-user --user 0 com.amazon.tv.releasenotes

# FTV Routing
pm enable-user --user 0 com.amazon.tv.routing

# Amazon Settings Core (REMOVAL CAN BREAK AMAZON UI)
pm enable-user --user 0 com.amazon.tv.settings.core

# Amazon Settings v2 (REMOVAL CAN BREAK AMAZON UI)
pm enable-user --user 0 com.amazon.tv.settings.v2

# Amazon FreeTime
pm enable-user --user 0 com.amazon.tahoe

# Whisper Join FFS Middleware
pm enable-user --user 0 com.amazon.whisperjoin.middleware.np

# Unknown
pm enable-user --user 0 com.amznfuse.operatorredirection



