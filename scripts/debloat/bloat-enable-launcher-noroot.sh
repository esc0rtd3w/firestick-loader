#!/system/bin/sh

clear
echo "Enabling Amazon Bloat...."
echo ""
echo ""

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