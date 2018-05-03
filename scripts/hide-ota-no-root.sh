#!/system/bin/sh

echo "Hiding Amazon OTA Updates and Update Services...."
echo ""
echo ""


pm hide com.amazon.dcp
pm hide com.amazon.device.software.ota
pm hide com.amazon.device.software.ota.override
pm hide com.amazon.settings.systemupdates/.OTAEventReceiver

