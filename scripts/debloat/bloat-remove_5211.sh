#!/system/bin/sh

#clear
echo "Deleting Amazon Bloat...."
echo ""
echo ""

mount -o rw,remount /system

# Tested Removal OK
rm -r /system/priv-app/amazon.jackson-19/
rm -r /system/priv-app/AmazonKKWebViewLib/
rm -r /system/priv-app/AmazonNetworkMonitor/
rm -r /system/priv-app/BackupRestoreConfirmation/
rm -r /system/priv-app/com.amazon.ags.app/
rm -r /system/priv-app/com.amazon.avod/
rm -r /system/priv-app/com.amazon.bueller.music/
rm -r /system/priv-app/com.amazon.communication/
rm -r /system/priv-app/com.amazon.communication.discovery/
rm -r /system/priv-app/com.amazon.device.sync/
rm -r /system/priv-app/com.amazon.device.sync.sdk.internal/
rm -r /system/priv-app/com.amazon.identity.auth.device.authorization/
rm -r /system/priv-app/com.amazon.imp/
rm -r /system/priv-app/com.amazon.kindle.cms-service/
rm -r /system/priv-app/com.amazon.kindle.devicecontrols/
rm -r /system/priv-app/com.amazon.kso.blackbird/
rm -r /system/priv-app/com.amazon.ods.kindleconnect/
rm -r /system/priv-app/com.amazon.parentalcontrols/
rm -r /system/priv-app/com.amazon.precog/
rm -r /system/priv-app/com.amazon.securitysyncclient/
rm -r /system/priv-app/com.amazon.sharingservice.android.client.proxy.release/
rm -r /system/priv-app/com.amazon.shoptv.client/
rm -r /system/priv-app/com.amazon.tcomm/
rm -r /system/priv-app/com.amazon.tmm.tutorial/
rm -r /system/priv-app/com.amazon.tv.aiv.support/
rm -r /system/priv-app/com.amazon.tv.csapp/
rm -r /system/priv-app/com.amazon.tv.legal.notices/
rm -r /system/priv-app/com.amazon.tv.oobe/
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
rm -r /system/priv-app/DeviceSoftwareOTA/
rm -r /system/priv-app/DeviceSoftwareOTAIdleOverride/
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
rm -r /system/priv-app/SystemUpdatesUI/
rm -r /system/priv-app/UnifiedShareActivityChooser/
rm -r /system/priv-app/WallpaperCropper/


# Tested Removal OK (Part 2)

# Possibe Remote Update??
rm -r /system/priv-app/com.amazon.device.bluetoothdfu/


# Still Needs Testing

#rm -r /system/priv-app/com.amazon.dp.logger/
#rm -r /system/priv-app/com.amazon.fireinputdevices/
#rm -r /system/priv-app/com.amazon.kindleautomatictimezone/
#rm -r /system/priv-app/com.amazon.metrics.api/
#rm -r /system/priv-app/com.amazon.tv.ime/
#rm -r /system/priv-app/com.amazon.tv.launcher/
#rm -r /system/priv-app/com.amazon.tv.settings/
#rm -r /system/priv-app/ConnectivityDiag/
#rm -r /system/priv-app/DefaultContainerService/
#rm -r /system/priv-app/DownloadProviderUi/
#rm -r /system/priv-app/ExternalStorageProvider/
#rm -r /system/priv-app/MediaProvider/
#rm -r /system/priv-app/MetricsApi/
#rm -r /system/priv-app/MetricsService/
#rm -r /system/priv-app/OneTimeInitializer/
#rm -r /system/priv-app/ProxyHandler/
#rm -r /system/priv-app/SettingsProvider/
#rm -r /system/priv-app/SharedStorageBackup/
#rm -r /system/priv-app/Shell/
#rm -r /system/priv-app/VpnDialogs/



# Other Apps That May Be Wanted/Needed For Different People/Operations

# Amazon Screensaver
#rm -r /system/priv-app/com.amazon.bueller.photos/

# Amazon Remote Android App
#rm -r /system/priv-app/com.amazon.storm.lightning.services/
#rm -r /system/priv-app/com.amazon.storm.lightning.tutorial/
#rm -r /system/priv-app/WhisperlinkSdk/
#rm -r /system/priv-app/WhisperplayCore/
#rm -r /system/priv-app/WhisperplayInstall/

# Captive Portal Launcher
#rm -r /system/priv-app/CaptivePortalLauncher/
#rm -r /system/app/CaptivePortalLogin/

# Amazon Voice Support
#rm -r /system/priv-app/com.amazon.vizzini/

# Screen Mirroring Function
#rm -r /system/priv-app/WhisperCastConnect/

# Needed For Amazon Settings UI (Removal Will Break Stock Settings)
#rm -r /system/priv-app/DeviceSoftwareOTAContracts/
#rm -r /system/priv-app/RemoteSettingsAndroid/
#rm -r /system/priv-app/RemoteSettingsInternalSDK/

# Check Network Status Under Amazon Settings
rm -r /system/priv-app/SystemStatusMonitor/


# From /system/app/

# Amazon Enterprise Controls
rm -r /system/app/DeviceControlService/

rm -r /system/app/DocumentsUI/
rm -r /system/app/fdrw/
rm -r /system/app/PicoTts/
rm -r /system/app/UnifiedSettingsProvider/
rm -r /system/app/WebCryptoTZService/
rm -r /system/app/WhiteListedUrlProvider/


# FireOS 5.2.1.1
rm -r /system/priv-app/AdvertisingIdSettings
rm -r /system/priv-app/com.amazon.tv.nimh
rm -r /system/priv-app/FireTvSaleService
rm -r /system/priv-app/IvonaTTS
rm -r /system/priv-app/IvonaTtsOrchestrator
rm -r /system/priv-app/Logan
rm -r /system/priv-app/TvProvider

# FireOS 5.2.6.2
# rm -r /system/priv-app/com.amazon.alexashopping
# rm -r /system/priv-app/com.amazon.cardinal
#rm -r /system/priv-app/com.amazon.device.settings
# rm -r /system/priv-app/com.amazon.malcolm
# rm -r /system/priv-app/com.amazon.ftv.glorialist
# rm -r /system/priv-app/com.amazon.ssdpservice
# rm -r /system/priv-app/com.amazon.ssmsys
# rm -r /system/priv-app/com.amazon.tv.livetv
# rm -r /system/priv-app/com.amazon.tv.notificationcenter
# rm -r /system/priv-app/com.amazon.tv.ottssocompanionapp
# rm -r /system/priv-app/com.amazon.tv.ottssolib
# rm -r /system/priv-app/com.amazon.webview.awvdeploymentservice
# rm -r /system/priv-app/com.amazon.whisperplay.service.install
# rm -r /system/priv-app/com.amazon.wifilocker
# rm -r /system/priv-app/com.amazon.amazonvideo.livingroom
# rm -r /system/priv-app/logan
# rm -r /system/priv-app/DeviceSoftwareOTAContracts
# rm -r /system/priv-app/CredentialLockerAndroid-tablet-release
# rm -r /system/priv-app/LogManager-logd
# rm -r /system/priv-app/SsdpService
# rm -r /system/priv-app/SystemStatusMonitorSys
# rm -r /system/priv-app/com.amazon.kor.demo



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



# Some directories in /data/data/ may not exist. They are attempted to be removed anyways


# Preserve ADB Settings
cp /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml /sdcard/


rm -r /data/data/amazon.jackson-19/
rm -r /data/data/AmazonKKWebViewLib/
rm -r /data/data/AmazonNetworkMonitor/
rm -r /data/data/BackupRestoreConfirmation/

rm -r /data/data/com.amazon.ags.app/
rm -r /data/data/com.amazon.avod/
rm -r /data/data/com.amazon.bueller.music/
#rm -r /data/data/com.amazon.bueller.photos/
rm -r /data/data/com.amazon.communication/
rm -r /data/data/com.amazon.communication.discovery/
rm -r /data/data/com.amazon.device.bluetoothdfu/
rm -r /data/data/com.amazon.device.sync/
rm -r /data/data/com.amazon.device.sync.sdk.internal/
#rm -r /data/data/com.amazon.dp.logger/
#rm -r /data/data/com.amazon.fireinputdevices/
rm -r /data/data/com.amazon.identity.auth.device.authorization/
rm -r /data/data/com.amazon.imp/
rm -r /data/data/com.amazon.kindle.cms-service/
rm -r /data/data/com.amazon.kindle.devicecontrols/
#rm -r /data/data/com.amazon.kindleautomatictimezone/
rm -r /data/data/com.amazon.kso.blackbird/
#rm -r /data/data/com.amazon.metrics.api/
rm -r /data/data/com.amazon.ods.kindleconnect/
rm -r /data/data/com.amazon.parentalcontrols/
rm -r /data/data/com.amazon.precog/
rm -r /data/data/com.amazon.securitysyncclient/
rm -r /data/data/com.amazon.sharingservice.android.client.proxy.release/
rm -r /data/data/com.amazon.shoptv.client/
rm -r /data/data/com.amazon.tcomm/
rm -r /data/data/com.amazon.tmm.tutorial/
rm -r /data/data/com.amazon.tv.aiv.support/
rm -r /data/data/com.amazon.tv.csapp/
#rm -r /data/data/com.amazon.tv.ime/
#rm -r /data/data/com.amazon.tv.launcher/
rm -r /data/data/com.amazon.tv.legal.notices/
rm -r /data/data/com.amazon.tv.oobe/
rm -r /data/data/com.amazon.tv.parentalcontrols/
#rm -r /data/data/com.amazon.tv.settings/
rm -r /data/data/com.amazon.venezia/
rm -r /data/data/com.amazon.videoads.app/
rm -r /data/data/com.amazon.visualonawv/

#rm -r /data/data/ConnectivityDiag/
rm -r /data/data/ContentSupportProvider/
rm -r /data/data/CrashManager/
#rm -r /data/data/DefaultContainerService/
rm -r /data/data/DeviceClientPlatformContractsFramework/
rm -r /data/data/DeviceMessagingAndroid/
rm -r /data/data/DeviceMessagingAndroidInternalSDK/
rm -r /data/data/DeviceMessagingAndroidSDK/
rm -r /data/data/DeviceSoftwareOTA/
rm -r /data/data/DeviceSoftwareOTAIdleOverride/
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
#rm -r /data/data/MetricsApi/
#rm -r /data/data/MetricsService/
#rm -r /data/data/OneTimeInitializer/
#rm -r /data/data/ProxyHandler/
#rm -r /data/data/SettingsProvider/
#rm -r /data/data/SharedStorageBackup/
#rm -r /data/data/Shell/
rm -r /data/data/shipmode/
rm -r /data/data/sync-provider_ipc-release/
rm -r /data/data/sync-service-fireos-release/
rm -r /data/data/SystemStatusMonitor/
rm -r /data/data/SystemUpdatesUI/
rm -r /data/data/UnifiedShareActivityChooser/
#rm -r /data/data/VpnDialogs/
rm -r /data/data/WallpaperCropper/

#rm -r /data/data/android.amazon.perm

# Amazon Remote Android App
#rm -r /data/data/com.amazon.storm.lightning.services/
#rm -r /data/data/com.amazon.storm.lightning.tutorial/
#rm -r /data/data/WhisperlinkSdk/
#rm -r /data/data/WhisperplayCore/
#rm -r /data/data/WhisperplayInstall

# Captive Portal Launcher
#rm -r /data/data/CaptivePortalLauncher/

# Amazon Voice Support
#rm -r /data/data/com.amazon.vizzini/

# Screen Mirroring???
#rm -r /data/data/WhisperCastConnect/

# Needed For Amazon Settings UI (ONLY FOR /system NOT /data/)
#rm -r /data/data/DeviceSoftwareOTAContracts/
#rm -r /data/data/RemoteSettingsAndroid/
#rm -r /data/data/RemoteSettingsInternalSDK/


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


# FireOS 5.2.1.1
rm -r /data/data/com.amazon.tv.nimh
rm -r /data/data/AdvertisingIdSettings
rm -r /data/data/FireTvSaleService
rm -r /data/data/IvonaTTS
rm -r /data/data/IvonaTtsOrchestrator
rm -r /data/data/Logan
rm -r /data/data/TvProvider

# FireOS 5.2.6.2
# rm -r /data/data/com.amazon.alexashopping
# rm -r /data/data/com.amazon.cardinal
# rm -r /data/data/com.amazon.device.settings
# rm -r /data/data/com.amazon.ftv.glorialist
# rm -r /data/data/com.amazon.malcolm
# rm -r /data/data/com.amazon.ssdpservice
# rm -r /data/data/com.amazon.ssmsys
# rm -r /data/data/com.amazon.tv.livetv
# rm -r /data/data/com.amazon.tv.notificationcenter
# rm -r /data/data/com.amazon.tv.ottssocompanionapp
# rm -r /data/data/com.amazon.tv.ottssolib
# rm -r /data/data/com.amazon.webview.awvdeploymentservice
# rm -r /data/data/com.amazon.whisperplay.service.install
# rm -r /data/data/com.amazon.wifilocker
# rm -r /data/data/com.amazon.amazonvideo.livingroom
# rm -r /data/data/logan
# rm -r /data/data/DeviceSoftwareOTAContracts
# rm -r /data/data/CredentialLockerAndroid-tablet-release
# rm -r /data/data/LogManager-logd
# rm -r /data/data/SsdpService
# rm -r /data/data/SystemStatusMonitorSys
# rm -r /data/data/com.amazon.kor.demo






