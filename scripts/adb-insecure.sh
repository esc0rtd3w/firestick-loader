#!/system/bin/sh


echo "Installing ADB Insecure Binaries...."
echo ""
echo ""
echo ""
echo ""


#getprop ro.build.selinux

#ls /sbin/adbd*
#/sbin/adbd

stop adbd

getprop init.svc.adbd

mount -o rw,remount / /

rm /sbin/adbd.original
cat /sbin/adbd > /sbin/adbd.original
chown 0.0 /sbin/adbd.original
chmod 644 /sbin/adbd.original

rm /sbin/adbd
cat /data/local/tmp/adbd > /sbin/adbd
chown 0.0 /sbin/adbd
chmod 0750 /sbin/adbd

cat /system/bin/sh > /sbin/adbdsh
chown 0.0 /sbin/adbdsh
chmod 0750 /sbin/adbdsh
mount -o ro,remount / /

/system/xbin/supolicy --live "permissive init_shell" "allow adbd adbd process setcurrent" "allow adbd init process dyntransition" "allow servicemanager {init_shell zygote } dir search" "allow servicemanager { init_shell zygote } file { read open }" "allow servicemanager { init_shell zygote } process getattr" "allow system_server init_shell binder { transfer call}" "allow zygote { servicemanager system_server } binder call"

start adbd

#rm /sbin/adbd.original
#ls /sbin/adbd*
#/sbin/adbd
#/sbin/adbd.original
#/sbin/adbdsh
getprop init.svc.adbd
#ls /sbin/adbd*
#/sbin/adbd
#/sbin/adbd.original
#/sbin/adbdsh