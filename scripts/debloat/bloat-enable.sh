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
pm enable com.amazon.android.service.networkmonitor
pm enable com.amazon.application.compatibility.enforcer
pm enable com.amazon.application.compatibility.enforcer.sdk.library
pm enable com.amazon.avod
pm enable com.amazon.awvflingreceiver
pm enable com.amazon.bueller.music
pm enable com.amazon.bueller.notification
pm enable com.amazon.bueller.photos
pm enable com.amazon.client.metrics
pm enable com.amazon.client.metrics.api
pm enable com.amazon.communication.discovery
pm enable com.amazon.connectivitydiag

# Captive Portal Launcher
#pm enable com.amazon.cpl

pm enable com.amazon.dcp
pm enable com.amazon.dcp.contracts.framework.library
pm enable com.amazon.dcp.contracts.library
#pm enable com.amazon.device.bluetoothdfu
#pm enable com.amazon.device.controllermanager
pm enable com.amazon.device.crashmanager
pm enable com.amazon.device.logmanager
#pm enable com.amazon.device.lowstoragemanager
pm enable com.amazon.device.messaging
pm enable com.amazon.device.messaging.sdk.internal.library
pm enable com.amazon.device.messaging.sdk.library
pm enable com.amazon.device.settings
pm enable com.amazon.device.settings.sdk.internal.library
pm enable com.amazon.device.software.ota
pm enable com.amazon.device.software.ota.override
pm enable com.amazon.device.sync
pm enable com.amazon.device.sync.sdk.internal
pm enable com.amazon.devicecontrol
pm enable com.amazon.dp.logger
#pm enable com.amazon.fireinputdevices
pm enable com.amazon.identity.auth.device.authorization
pm enable com.amazon.imp
pm enable com.amazon.kindle.cms
pm enable com.amazon.kindle.devicecontrols
#pm enable com.amazon.kindleautomatictimezone
pm enable com.amazon.kso.blackbird
pm enable com.amazon.metrics.api
pm enable com.amazon.ods.kindleconnect
pm enable com.amazon.parentalcontrols
pm enable com.amazon.platform.fdrw
pm enable com.amazon.precog
pm enable com.amazon.providers
pm enable com.amazon.providers.contentsupport
pm enable com.amazon.recess
pm enable com.amazon.securitysyncclient
pm enable com.amazon.settings.systemupdates
pm enable com.amazon.sharingservice.android.client.proxy
pm enable com.amazon.shoptv.client
pm enable com.amazon.shpm
pm enable com.amazon.ssm

# Amazon Remote Android App
#pm enable com.amazon.storm.lightning.services
#pm enable com.amazon.storm.lightning.tutorial

pm enable com.amazon.sync.provider.ipc
pm enable com.amazon.sync.service
pm enable com.amazon.tcomm
pm enable com.amazon.tcomm.client
pm enable com.amazon.tmm.tutorial
pm enable com.amazon.tv.csapp
pm enable com.amazon.tv.fw.metrics
#pm enable com.amazon.tv.ime
#pm enable com.amazon.tv.intentsupport
#pm enable com.amazon.tv.launcher
pm enable com.amazon.tv.legal.notices
pm enable com.amazon.tv.oobe
pm enable com.amazon.tv.parentalcontrols
#pm enable com.amazon.tv.resolutioncycler
#pm enable com.amazon.tv.settings
pm enable com.amazon.tv.support
pm enable com.amazon.tz.webcryptotzservice
#pm enable com.amazon.unifiedshare.actionchooser
pm enable com.amazon.venezia
pm enable com.amazon.videoads.app
pm enable com.amazon.visualonawv

# Amazon Voice Support
#pm enable com.amazon.vizzini

pm enable com.amazon.wcast.sink
pm enable com.amazon.webview

# Amazon Remote Android App
#pm enable com.amazon.whisperlink.core.android
#pm enable com.amazon.whisperplay.contracts
#pm enable com.amazon.whisperplay.service.install

pm enable com.svox.pico
pm enable com.android.captiveportallogin

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

# Disable Sleep Screen (Hold HOME Button)
#pm enable com.amazon.tv.settings/.hud.HomeLongPressReceiver

#pm enable com.amazon.tv.settings/.tv.usb.AppScanReceiver
#pm enable com.amazon.tv.settings.tv.usb.PackageMovedLocation

pm enable com.amazon.settings.systemupdates/.OTAEventReceiver

# Disable Factory Reset Option
#pm enable com.amazon.tv.settings/com.amazon.tv.settings.tv.FactoryResetActivity

# Amazon Download Manager
pm enable com.android.providers.downloads

# Amazon Documents UI
pm enable com.android.documentsui

# Device Provisioner
pm enable com.android.managedprovisioning

# Alexa Related???
pm enable com.amazon.tv.settings/.tv.ThingsToTrySettingsActivity


# FireOS 5.2.1.1
pm enable com.amazon.tv.nimh
pm enable ivona.tts.oem
pm enable com.ivona.orchestrator
pm enable com.amazon.device.sale.service
pm enable com.amazon.logan
pm enable com.amazon.advertisingidsettings
pm enable com.amazon.tz.webcryptotzservice

# FireOS 5.2.6.2
pm enable com.amazon.alexashopping
pm enable com.amazon.cardinal
pm enable com.amazon.device.settings
pm enable com.amazon.ftv.glorialist
pm enable com.amazon.ssdpservice
pm enable com.amazon.ssmsys
pm enable com.amazon.tv.livetv
pm enable com.amazon.tv.notificationcenter
pm enable com.amazon.tv.ottssocompanionapp
pm enable com.amazon.tv.ottssolib
pm enable com.amazon.webview.awvdeploymentservice
pm enable com.amazon.whisperplay.service.install
pm enable com.amazon.wifilocker
pm enable com.amazon.amazonvideo.livingroom
pm enable com.amazon.kor.demo


