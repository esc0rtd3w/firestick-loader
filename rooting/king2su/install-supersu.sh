#!/system/bin/sh

# Install SuperSU

# esc0rtd3w 2016



rm /system/bin/.ext/.su
rm /system/bin/install-recovery.sh

busybox chattr -i /system/xbin/.su
#busybox chattr.pie -i /system/xbin/.su
busybox chattr -i /system/bin/.ext/.su
#busybox chattr.pie -i /system/bin/.ext/.su
busybox chattr -i /system/xbin/daemonsu
#busybox chattr.pie -i /system/xbin/daemonsu
busybox chattr -i /system/etc/install-recovery.sh
#busybox chattr.pie -i /system/etc/install-recovery.sh

sleep 1

#mount -o rw,remount /system
cat /data/local/tmp/su > /system/bin/su
cat /data/local/tmp/su > /system/xbin/su
cat /data/local/tmp/su > /system/xbin/daemonsu
cat /data/local/tmp/su > /system/xbin/sugote
cat /system/bin/sh > /system/xbin/sugote-mksh
cat /data/local/tmp/superuser.apk > /system/app/Superuser.apk

sleep 1

chown 0.0 /system/xbin/su
chmod 6755 /system/xbin/su
chown 0.0 /system/xbin/sugote
chmod 0755 /system/xbin/sugote
chown 0.0 /system/xbin/sugote-mksh
chmod 0755 /system/xbin/sugote-mksh
chown 0.0 /system/xbin/daemonsu
chmod 0755 /system/xbin/daemonsu
chown 0.0 /system/app/Superuser.apk
chmod 0644 /system/app/Superuser.apk

#mount -o rw,remount /system
mkdir /system/bin/.ext
chown 0.0 /system/bin/.ext
chmod 0777 /system/bin/.ext

#cat /data/local/tmp/su > /system/xbin/otasurvival.sh
cat /data/local/tmp/su > /system/bin/.ext/.su
cat /data/local/tmp/su > /system/xbin/daemonsu
cat /data/local/tmp/install-recovery.sh > /system/etc/install-recovery.sh
ln -s /system/etc/install-recovery.sh /system/bin/install-recovery.sh
cat /data/local/tmp/99SuperSUDaemon > /system/etc/init.d/99SuperSUDaemon
cat /data/local/tmp/.installed_su_daemon > /system/etc/.installed_su_daemon

chmod 06755 /system/bin/.ext/.su
chmod 06755 /system/xbin/su

#chown 0.0 /system/xbin/otasurvival.sh
#chmod 0755 /system/xbin/otasurvival.sh
chown 0.0 /system/etc/init.d/99SuperSUDaemon
chmod 0755 /system/etc/init.d/99SuperSUDaemon
chown 0.0 /system/etc/.installed_su_daemon
chmod 0644 /system/etc/.installed_su_daemon


chown 0.0 /data/local/tmp/chattr
chmod 0755 /data/local/tmp/chattr

busybox chattr +i /system/xbin/.su
#busybox chattr.pie +i /system/xbin/.su
busybox chattr +i /system/bin/.ext/.su
#busybox chattr.pie +i /system/bin/.ext/.su
busybox chattr +i /system/xbin/daemonsu
#busybox chattr.pie +i /system/xbin/daemonsu
busybox chattr +i /system/etc/install-recovery.sh
#busybox chattr.pie +i /system/etc/install-recovery.sh


chcon /system/bin/.ext/.su
chcon /system/xbin/su
chcon /system/xbin/sugote-mksh

chcon /system/xbin/daemonsu
chcon /system/etc/install-recovery.sh
chcon /system/etc/init.d/99SuperSUDaemon
chcon /system/etc/.installed_su_daemon
chcon /system/app/Superuser.apk

/system/xbin/su --install

daemonsu -d

#sleep 1

#mount -o rw,remount /system
#pm uninstall eu.chainfire.supersu >/dev/null  2>&1
#pm install /data/local/tmp/superuser.apk
#mkdir /system/app/Superuser/
#mkdir /system/app/Superuser/arm
#cat /data/local/tmp/superuser.apk > /system/app/Superuser/Superuser.apk
#chown 0.0 /system/app/Superuser/Superuser.apk
#chmod 0644 /system/app/Superuser/Superuser.apk

sleep 1

pm install /data/local/tmp/superuser.apk

sleep 1

am start -a android.intent.action.MAIN -n eu.chainfire.supersu/.MainActivity

sleep 1

pm install /data/local/tmp/superuser.apk

