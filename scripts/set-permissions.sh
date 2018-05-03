#!/system/bin/sh

#clear
echo "Setting Permissions...."
echo ""
echo ""

mount -o rw,remount /system

find /system/app -type d -exec chmod 0755 {} \;
find /system/app -type f -exec chmod 0644 {} \;

find /system/priv-app -type d -exec chmod 0755 {} \;
find /system/priv-app -type f -exec chmod 0644 {} \;