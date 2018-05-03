#!/system/bin/sh


echo "Installing ADB Secure Binaries...."
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

rm /sbin/adbd
cat /sbin/adbd.original > /sbin/adbd
chown 0.0 /sbin/adbd
chmod 0750 /sbin/adbd

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