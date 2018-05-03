#!/system/bin/sh

#clear
echo "Restoring Amazon Android Remote App Services...."
echo ""
echo ""


pm enable com.amazon.storm.lightning.services
pm enable com.amazon.storm.lightning.tutorial
pm enable com.amazon.whisperlink.core.android
pm enable com.amazon.whisperplay.contracts
pm enable com.amazon.whisperplay.service.install


