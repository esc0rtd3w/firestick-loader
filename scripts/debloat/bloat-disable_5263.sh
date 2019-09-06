#!/system/bin/sh

#clear
echo "Disabling Amazon Bloat...."
echo ""
echo ""

pm disable amazon.jackson19
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
pm disable com.amazon.device.logmanager
pm disable com.amazon.device.messaging
pm disable com.amazon.device.messaging.sdk.internal.library
pm disable com.amazon.device.messaging.sdk.library
pm disable com.amazon.device.settings
pm disable com.amazon.device.settings.sdk.internal.library
pm disable com.amazon.device.sync
pm disable com.amazon.device.sync.sdk.internal
pm disable com.amazon.devicecontrol
pm disable com.amazon.dp.logger
pm disable com.amazon.kindle.cms
pm disable com.amazon.kindle.devicecontrols
pm disable com.amazon.kso.blackbird
pm disable com.amazon.ods.kindleconnect
pm disable com.amazon.parentalcontrols
pm disable com.amazon.platform.fdrw
pm disable com.amazon.precog
pm disable com.amazon.providers
pm disable com.amazon.providers.contentsupport
pm disable com.amazon.recess
pm disable com.amazon.securitysyncclient
pm disable com.amazon.sharingservice.android.client.proxy
pm disable com.amazon.shpm
pm disable com.amazon.sync.provider.ipc
pm disable com.amazon.sync.service
pm disable com.amazon.tcomm
pm disable com.amazon.tcomm.client
pm disable com.amazon.tv.fw.metrics
pm disable com.amazon.tv.legal.notices
pm disable com.amazon.tv.parentalcontrols
pm disable com.amazon.tv.support
pm disable com.amazon.tz.webcryptotzservice
pm disable com.amazon.videoads.app
pm disable com.amazon.visualonawv
pm disable com.amazon.webview
pm disable com.svox.pico

# OTA Related
pm disable com.amazon.dcp
pm disable com.amazon.dcp.contracts.framework.library
pm disable com.amazon.dcp.contracts.library
pm disable com.amazon.device.software.ota
pm disable com.amazon.device.software.ota.override
pm disable com.amazon.settings.systemupdates
#pm disable com.amazon.device.software.ota.handler.OtaTaskHandler

# Launcher Related
pm disable com.amazon.tv.launcher
#pm disable com.amazon.tv.settings

# Removal May Break Some Stock Settings
#pm disable com.amazon.android.service.networkmonitor
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

# Breaks Amazon Related Logins???
#pm disable com.amazon.identity.auth.device.authorization

# Disable Causes Network Errors??? (5.2.6.3 Tank)
#pm disable com.amazon.client.metrics
#pm disable com.amazon.client.metrics.api
#pm disable com.amazon.metrics.api
#pm disable com.amazon.ssm

# Help Related
pm disable com.amazon.tmm.tutorial
pm disable com.amazon.tv.csapp

# Amazon Screensaver
#pm disable com.amazon.bueller.photos

# Possibe Remote Update??
pm disable com.amazon.device.bluetoothdfu

# Captive Portal Launcher
#pm disable com.amazon.cpl
#pm disable com.android.captiveportallogin

# Amazon Voice Support (Alexa Media Player)
#pm disable com.amazon.vizzini

# Amazon Remote Android App
#pm disable com.amazon.storm.lightning.services
#pm disable com.amazon.storm.lightning.tutorial
#pm disable com.amazon.whisperlink.core.android
#pm disable com.amazon.whisperplay.contracts
#pm disable com.amazon.whisperplay.service.install

# Screen Mirroring Function
#pm disable com.amazon.wcast.sink

# Only Disable If Amazon Video and Store Will Not Be Needed as User Installed APKs
#pm disable com.amazon.avod
#pm disable com.amazon.shoptv.client
#pm disable com.amazon.venezia

# Home may kill enough by itself (untested)
pm disable com.amazon.tv.launcher/.ui.HomeActivity

pm disable com.amazon.tv.launcher/.ui.ItemLoadingActivity
pm disable com.amazon.tv.launcher/.ui.purchase.OffDeviceSubscriptionActivity
pm disable com.amazon.tv.launcher/.ui.Channel1DActivity
pm disable com.amazon.tv.launcher/.ui.TVActivity
pm disable com.amazon.tv.launcher/.ui.SearchMenuActivity
pm disable com.amazon.tv.launcher/.ui.MoviesActivity
pm disable com.amazon.tv.launcher/.ui.YoursToWatchActivity
pm disable com.amazon.tv.launcher/.ui.ReleaseNotesActivity
pm disable com.amazon.tv.launcher/.ui.purchase.VideoItemPurchaseActivity
#pm disable com.amazon.tv.launcher/.ui.service.LeftNavOverlayService

pm disable com.amazon.tv.launcher/.primefreetrial.PrimeFreeTrialActivity
pm disable com.amazon.tv.launcher/.content.ComradeReceiver
pm disable com.amazon.tv.launcher/.demo.DemoPackageAddedReceiver
pm disable com.amazon.tv.launcher/.ads.AdRefreshReceiver
pm disable com.amazon.tv.launcher/.util.CategorySearchReceiver
pm disable com.amazon.tv.launcher/.util.LauncherPreloaderReceiver
pm disable com.amazon.tv.launcher/.parentalcontrols.PCONPermissionsReceiver
pm disable com.amazon.tv.launcher/com.amazon.tv.mediabrowse.service.MediaBrowseServiceImpl

pm disable com.amazon.tv.settings/.blackcurtain.BlackCurtainActivity
pm disable com.amazon.tv.settings/.blackcurtain.AdultContentPrefsActivity
pm disable com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
pm disable com.amazon.tv.settings/.tv.AmazonAccountSettingsActivity
pm disable com.amazon.tv.settings/.tv.BuellerAccountSettingsActivity
pm disable com.amazon.tv.settings/.tv.AlexaSettingsActivity
pm disable com.amazon.tv.settings/.auth.BuellerSettingsMAPInformationProvider
pm disable com.amazon.tv.settings/.PCONPermissionsReceiver

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

# Misc
#pm disable com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity
#pm disable com.amazon.tv.settings/.tv.usb.AppScanReceiver
#pm disable com.amazon.tv.settings.tv.usb.PackageMovedLocation

# FireOS 5.2.1.1
pm disable com.amazon.tv.nimh
pm disable com.ivona.tts.oem
pm disable com.ivona.orchestrator
pm disable com.amazon.device.sale.service
pm disable com.amazon.logan
pm disable com.amazon.advertisingidsettings
#pm disable com.amazon.tz.webcryptotzservice

# FireOS 5.2.6.2
pm disable com.amazon.alexashopping
# pm disable com.amazon.cardinal
# pm disable com.amazon.device.settings
# pm disable com.amazon.ftv.glorialist
# pm disable com.amazon.malcolm
# pm disable com.amazon.ssmsys
pm disable com.amazon.tv.livetv
# pm disable com.amazon.tv.ottssocompanionapp
# pm disable com.amazon.tv.ottssolib
# pm disable com.amazon.webview.awvdeploymentservice
# pm disable com.amazon.whisperplay.service.install
# pm disable com.amazon.wifilocker
pm disable com.amazon.amazonvideo.livingroom
pm disable com.amazon.kor.demo

# Amazon Echo???
pm disable com.amazon.ssdpservice

# Settings Notification Center
pm disable com.amazon.tv.notificationcenter

# DIAL (Discovery-and-Launch) protocol (allow apps to access via second screen)
pm disable com.amazon.dialservice

# FireOS 5.2.6.3
# Fire Basic Keyboard (Simplified Chinese)
pm disable com.android.inputmethod.pinyin

# Fitbit Support???
pm disable com.amazon.alta.h2clientservice
