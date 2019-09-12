#!/system/bin/sh

clear
echo "Disabling Amazon Home and Settings Bloat Only...."
echo ""
echo ""



# Home may kill enough by itself (untested)
pm disable com.amazon.tv.launcher/.ui.HomeActivity

pm disable com.amazon.tv.launcher/.ui.ItemLoadingActivity
pm disable com.amazon.tv.launcher/.primefreetrial.PrimeFreeTrialActivity
pm disable com.amazon.tv.launcher/.ui.purchase.OffDeviceSubscriptionActivity
pm disable com.amazon.tv.launcher/.ui.Channel1DActivity
pm disable com.amazon.tv.launcher/.ui.TVActivity
pm disable com.amazon.tv.launcher/.ui.SearchMenuActivity
pm disable com.amazon.tv.launcher/.ui.MoviesActivity
pm disable com.amazon.tv.launcher/.ui.YoursToWatchActivity

pm disable com.amazon.tv.launcher/.ui.ReleaseNotesActivity
pm disable com.amazon.tv.launcher/.ui.purchase.VideoItemPurchaseActivity
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

# Disable Sleep Screen (Hold HOME Button)
#pm disable com.amazon.tv.settings/.hud.HomeLongPressReceiver

#pm disable com.amazon.tv.settings/.tv.usb.AppScanReceiver
#pm disable com.amazon.tv.settings.tv.usb.PackageMovedLocation

pm disable com.amazon.settings.systemupdates/.OTAEventReceiver

# Disable Factory Rest Option
#pm disable com.amazon.tv.settings/com.amazon.tv.settings.tv.FactoryResetActivity


