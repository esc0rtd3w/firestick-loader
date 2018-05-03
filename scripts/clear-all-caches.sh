#!/system/bin/sh

#clear
echo "Clearing All Caches...."
echo ""
echo ""


#mount -o rw,remount /cache

# Clearing Dalvik Cache
rm -rf /data/dalvik-cache
rm -rf /cache/dalvik-cache

# Clearing Cache
#rm -rf /cache/
#mkdir /cache/

#rm -f /cache/*.apk
#rm -f /cache/*.bin
rm -f /cache/*.*

#reboot

