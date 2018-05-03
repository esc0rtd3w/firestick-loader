#!/system/bin/sh

mount -o rw,remount /system

chmod 755 /data/local/tmp/busybox

/data/local/tmp/busybox --install -s /system/xbin/

export PATH=/system/xbin/busybox:$PATH

