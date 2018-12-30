#!/system/bin/sh

#clear
echo "Disabling Amazon OTA Updates...."
echo ""
echo ""


#pm disable com.amazon.dcp
pm disable com.amazon.device.software.ota
pm disable com.amazon.device.software.ota.override
pm disable com.amazon.settings.systemupdates/.OTAEventReceiver
pm disable com.amazon.tv.forcedotaupdater
