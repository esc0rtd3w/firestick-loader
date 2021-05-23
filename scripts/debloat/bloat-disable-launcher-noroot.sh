#!/system/bin/sh

clear
echo "Disabling Amazon Bloat...."
echo ""
echo ""

# OTA Related
pm disable-user --user 0 com.amazon.dcp
pm disable-user --user 0 com.amazon.dcp.contracts.framework.library
pm disable-user --user 0 com.amazon.dcp.contracts.library
pm disable-user --user 0 com.amazon.device.software.ota
pm disable-user --user 0 com.amazon.device.software.ota.override
pm disable-user --user 0 com.amazon.settings.systemupdates
pm disable-user --user 0 com.amazon.device.software.ota.handler.OtaTaskHandler

# Launcher Related
pm disable-user --user 0 com.amazon.tv.launcher
pm disable-user --user 0 com.amazon.tv.settings