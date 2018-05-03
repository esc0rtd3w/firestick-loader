#!/system/bin/sh

echo "Unhiding Amazon OTA Updates and Update Services...."
echo ""
echo ""


pm unhide com.amazon.dcp
pm unhide com.amazon.device.software.ota
pm unhide com.amazon.device.software.ota.override
pm unhide com.amazon.settings.systemupdates/.OTAEventReceiver
