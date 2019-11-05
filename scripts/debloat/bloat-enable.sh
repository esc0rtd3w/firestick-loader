#!/system/bin/sh

clear
echo "Enabling Amazon Bloat...."
echo ""
echo ""


pm enable amazon.jackson19
pm enable android.amazon.perm
pm enable com.amazon.acos.providers.UnifiedSettingsProvider
pm enable com.amazon.ags.app
pm enable com.amazon.android.marketplace
pm enable com.amazon.application.compatibility.enforcer
pm enable com.amazon.application.compatibility.enforcer.sdk.library
pm enable com.amazon.awvflingreceiver
pm enable com.amazon.bueller.music
pm enable com.amazon.bueller.notification
pm enable com.amazon.connectivitydiag
pm enable com.amazon.device.crashmanager
pm enable com.amazon.device.messaging
pm enable com.amazon.device.messaging.sdk.internal.library
pm enable com.amazon.device.messaging.sdk.library
pm enable com.amazon.device.settings
pm enable com.amazon.device.sync
pm enable com.amazon.device.sync.sdk.internal
pm enable com.amazon.devicecontrol
pm enable com.amazon.kindle.cms
pm enable com.amazon.kindle.devicecontrols
pm enable com.amazon.kso.blackbird
pm enable com.amazon.ods.kindleconnect
pm enable com.amazon.parentalcontrols
pm enable com.amazon.precog
pm enable com.amazon.providers
pm enable com.amazon.providers.contentsupport
pm enable com.amazon.recess
pm enable com.amazon.securitysyncclient
pm enable com.amazon.sharingservice.android.client.proxy
pm enable com.amazon.shpm
pm enable com.amazon.sync.provider.ipc
pm enable com.amazon.sync.service
pm enable com.amazon.tv.legal.notices
pm enable com.amazon.tv.parentalcontrols
pm enable com.amazon.tv.support
pm enable com.amazon.tz.webcryptotzservice
pm enable com.amazon.videoads.app
pm enable com.amazon.visualonawv
pm enable com.amazon.webview
pm enable com.svox.pico

# Factory Data Reset Whitelist Manager
pm enable com.amazon.platform.fdrw

# FrameworksMetrics
pm enable com.amazon.tv.fw.metrics

# Amazon Device Settings Internal SDK (breaks Device and Applications Settings Activities)
pm enable com.amazon.device.settings.sdk.internal.library

# Log Manager
pm enable com.amazon.device.logmanager

# OTA Related
pm enable com.amazon.dcp
pm enable com.amazon.dcp.contracts.framework.library
pm enable com.amazon.dcp.contracts.library
pm enable com.amazon.device.software.ota
pm enable com.amazon.device.software.ota.override
pm enable com.amazon.settings.systemupdates
pm enable com.amazon.device.software.ota.handler.OtaTaskHandler

# Launcher Related
pm enable com.amazon.tv.launcher
pm enable com.amazon.tv.settings

# BuellerDeviceService
pm enable com.amazon.android.service.networkmonitor

# Removal May Break Some Stock Settings
pm enable com.amazon.device.controllermanager
pm enable com.amazon.device.lowstoragemanager
pm enable com.amazon.fireinputdevices
pm enable com.amazon.kindleautomatictimezone
pm enable com.amazon.tv.ime
pm enable com.amazon.tv.intentsupport
pm enable com.amazon.tv.resolutioncycler
pm enable com.amazon.unifiedshare.actionchooser

# enable Breaks Applications and Signin (5.2.6.3 Tank)
pm enable com.amazon.imp
pm enable com.amazon.tv.oobe

# Removal Causes Vizzini To Constantly Produce Errors (5.2.6.3 Tank)
pm enable com.amazon.communication.discovery

# Breaks Amazon Related Logins/Netflix, etc
pm enable com.amazon.identity.auth.device.authorization

# Breaks Settings UI (5.2.6.3 Tank)
pm enable com.amazon.client.metrics
pm enable com.amazon.client.metrics.api

# com.amazon.client.metrics.api 2.0
pm enable com.amazon.metrics.api

# System Status Monitor
pm enable com.amazon.ssm
pm enable com.amazon.ssmsys

# Help Related
pm enable com.amazon.tmm.tutorial
pm enable com.amazon.tv.csapp

# Amazon Screensaver
pm enable com.amazon.bueller.photos

# Possibe Remote Update??
pm enable com.amazon.device.bluetoothdfu

# Captive Portal Launcher
pm enable com.amazon.cpl
pm enable com.android.captiveportallogin

# Amazon Voice Support (Alexa Media Player)
pm enable com.amazon.vizzini

# Amazon Remote Android App
pm enable com.amazon.storm.lightning.services
pm enable com.amazon.storm.lightning.tutorial
pm enable com.amazon.whisperlink.core.android
pm enable com.amazon.whisperplay.contracts
pm enable com.amazon.whisperplay.service.install

# Removal of (tcomm/dplogger) breaks Amazon Android FireTV Remote App Connection
# Amazon Communication Services Client Library
pm enable com.amazon.tcomm
pm enable com.amazon.tcomm.client
pm enable com.amazon.dp.logger

# Screen Mirroring Function
pm enable com.amazon.wcast.sink

# Only enable If Amazon Video and Store Will Not Be Needed as User Installed APKs
pm enable com.amazon.avod
pm enable com.amazon.shoptv.client
pm enable com.amazon.venezia

# Home may kill enough by itself (untested)
pm enable com.amazon.tv.launcher/.ui.HomeActivity

pm enable com.amazon.tv.launcher/.ui.ItemLoadingActivity
pm enable com.amazon.tv.launcher/.ui.purchase.OffDeviceSubscriptionActivity
pm enable com.amazon.tv.launcher/.ui.Channel1DActivity
pm enable com.amazon.tv.launcher/.ui.TVActivity
pm enable com.amazon.tv.launcher/.ui.SearchMenuActivity
pm enable com.amazon.tv.launcher/.ui.MoviesActivity
pm enable com.amazon.tv.launcher/.ui.YoursToWatchActivity
pm enable com.amazon.tv.launcher/.ui.ReleaseNotesActivity
pm enable com.amazon.tv.launcher/.ui.purchase.VideoItemPurchaseActivity
pm enable com.amazon.tv.launcher/.ui.service.LeftNavOverlayService

pm enable com.amazon.tv.launcher/.primefreetrial.PrimeFreeTrialActivity
pm enable com.amazon.tv.launcher/.content.ComradeReceiver
pm enable com.amazon.tv.launcher/.demo.DemoPackageAddedReceiver
pm enable com.amazon.tv.launcher/.ads.AdRefreshReceiver
pm enable com.amazon.tv.launcher/.util.CategorySearchReceiver
pm enable com.amazon.tv.launcher/.util.LauncherPreloaderReceiver
pm enable com.amazon.tv.launcher/.parentalcontrols.PCONPermissionsReceiver
pm enable com.amazon.tv.launcher/com.amazon.tv.mediabrowse.service.MediaBrowseServiceImpl

pm enable com.amazon.tv.settings/.blackcurtain.BlackCurtainActivity
pm enable com.amazon.tv.settings/.blackcurtain.AdultContentPrefsActivity
pm enable com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
pm enable com.amazon.tv.settings/.tv.AmazonAccountSettingsActivity
pm enable com.amazon.tv.settings/.tv.BuellerAccountSettingsActivity
pm enable com.amazon.tv.settings/.tv.AlexaSettingsActivity
pm enable com.amazon.tv.settings/.auth.BuellerSettingsMAPInformationProvider
pm enable com.amazon.tv.settings/.PCONPermissionsReceiver

# App Blacklisting
pm enable com.amazon.tv.settings/com.amazon.tv.settings.tv.AppenableService

# enable Sleep Screen (Hold HOME Button)
pm enable com.amazon.tv.settings/.hud.HomeLongPressReceiver

# enable Factory Reset Option
pm enable com.amazon.tv.settings/com.amazon.tv.settings.tv.FactoryResetActivity

# Amazon Download Manager
pm enable com.android.providers.downloads

# Amazon Documents UI
pm enable com.android.documentsui

# Device Provisioner
pm enable com.android.managedprovisioning

# VoiceView
pm enable com.amazon.logan

# USB Tuner
pm enable com.amazon.malcolm

# Misc
pm enable com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
pm enable com.amazon.tv.settings/.tv.usb.AppScanReceiver
pm enable com.amazon.tv.settings.tv.usb.PackageMovedLocation

# FireOS 5.2.1.1
pm enable com.amazon.tv.nimh
pm enable com.ivona.tts.oem
pm enable com.ivona.orchestrator
pm enable com.amazon.device.sale.service
pm enable com.amazon.advertisingidsettings
pm enable com.amazon.tz.webcryptotzservice

# FireOS 5.2.6.2
pm enable com.amazon.alexashopping
pm enable com.amazon.device.settings
pm enable com.amazon.ftv.glorialist
pm enable com.amazon.tv.livetv
pm enable com.amazon.amazonvideo.livingroom
pm enable com.amazon.kor.demo

# com.amazon.webview.awvdeploymentservice Developer Build
pm enable com.amazon.webview.awvdeploymentservice

# OttSsoLib
pm enable com.amazon.tv.ottssolib

# OttSsoCompanionApp
pm enable com.amazon.tv.ottssocompanionapp

# WiFi Locker
pm enable com.amazon.wifilocker

# Amazon Echo???
pm enable com.amazon.ssdpservice

# Settings Notification Center
pm enable com.amazon.tv.notificationcenter

# FireOS 5.2.6.3
# Fire Basic Keyboard (Simplified Chinese)
pm enable com.android.inputmethod.pinyin

# Fitbit Support???
pm enable com.amazon.alta.h2clientservice

# DIAL (Discovery-and-Launch) protocol (allow apps to access via second screen)
pm enable com.amazon.dialservice

# CustomMediaController
pm enable com.amazon.cardinal

# TIFObserverService
pm enable com.amazon.tifobserver

# Amazon WebView Metrics Service
pm enable com.amazon.webview.metrics.service

# FireOS 5.2.6.7

# ACAFireTVAndroidClient
pm enable com.amazon.aca

# Aria AriaRuntime
pm enable com.amazon.aria

# Unknown)
pm enable com.amazon.firehomestarter

# Fire TV Recast --
pm enable com.amazon.franktvinput

# (Unknown)
pm enable com.amazon.gloria.graphiq

# News
pm enable com.amazon.hedwig

# Naatyam (Unknown)
pm enable com.amazon.naatyam

# KFTV Legal Notices
pm enable com.amazon.tv.legal.notices

# SmartConnectService (Unknown)
pm enable com.amazon.net.smartconnect

# TMMTutorial
pm enable com.amazon.tmm.tutorial

pm enable com.amazon.tv.forcedotaupdater
pm enable TIFObserverService

# FireOS 5.2.7.2

# Alexa Media Controller
pm enable com.amazon.alexa.externalmediaplayer.fireos

# BluetoothKeyMapLib (Unknown)
pm enable com.amazon.device.bluetoothkeymaplib

# ALE (Unknown)
pm enable com.amazon.ale

# My Application 2.0 (WTF! LMAO)
pm enable com.amazon.appaccesskeyprovider

# Alexa Voice Layer
pm enable com.amazon.avl.ftv

# Ceviche (Unknown)
pm enable com.amazon.ceviche

# Unknown
pm enable com.amazon.dpcclient

# Prime Video PVFTV
pm enable com.amazon.firebat

# FireRESTAPIFramework
pm enable com.amazon.firerestapiframework

# Gloria
pm enable com.amazon.ftv.glorialist

# Screensaver (REMOVAL CAN BREAK AMAZON UI)
pm enable com.amazon.ftv.screensaver

# com.amazon.ftv.xpicker stub-apk
pm enable com.amazon.ftv.xpicker

# Katoch (Unknown)
pm enable com.amazon.katoch

pm enable com.amazon.providers.tv

# Fire TV Alexa Alerts
pm enable com.amazon.tv.alexaalerts

# Unknown
pm enable com.amazon.tv.devicecontrol

# Equipment Control (REMOVAL CAN BREAK AMAZON UI)
pm enable com.amazon.tv.devicecontrolsettings

# Forced App Updater
pm enable com.amazon.tv.forcedotaupdater.v2

# ReleaseNotes
pm enable com.amazon.tv.releasenotes

# FTV Routing
pm enable com.amazon.tv.routing

# Amazon Settings Core (REMOVAL CAN BREAK AMAZON UI)
pm enable com.amazon.tv.settings.core

# Amazon Settings v2 (REMOVAL CAN BREAK AMAZON UI)
pm enable com.amazon.tv.settings.v2

# Amazon FreeTime
pm enable com.amazon.tahoe

# Whisper Join FFS Middleware
pm enable com.amazon.whisperjoin.middleware.np

# Unknown
pm enable com.amznfuse.operatorredirection



