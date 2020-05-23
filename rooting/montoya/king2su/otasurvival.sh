#!/system/bin/sh
#
# Symlinked from /system/bin/log if OTA survival mode enabled
#
# Adapted from a script by Pau Oliva (@pof)
#
# Requires cat and grep to be operational

if [ "$2" == "recovery" ]; then
	cat /system/etc/install-recovery.sh | grep "daemon" >/dev/null 2>/dev/null
	rc=$?
	if [ "$rc" == "1" ]; then

		mount -o remount,rw /system

		chown root.root /system/xbin/su 2>/dev/null
		chmod 06755 /system/xbin/su 2>/dev/null

		chown root.root /system/bin/.ext/.su 2>/dev/null
		chmod 06755 /system/bin/.ext/.su 2>/dev/null

		chown root.root /system/xbin/daemonsu 2>/dev/null
		chmod 06755 /system/xbin/daemonsu 2>/dev/null

		cat >/system/etc/install-recovery.sh <<-EOF
#!/system/bin/sh

# If you're implementing this in a custom kernel/firmware,
# I suggest you use a different script name, and add a service
# to launch it from init.rc

# Launches SuperSU in daemon mode only on Android 4.3+.
# Nothing will happen on 4.2.x or older, unless SELinux+Enforcing.
# If you want to force loading the daemon, use "--daemon" instead

/system/xbin/daemonsu --auto-daemon &

# Some apps like to run stuff from this script as well, that will 
# obviously break root - in your code, just search this file
# for "install-recovery-2.sh", and if present, write there instead.

/system/etc/install-recovery-2.sh
EOF
		
		chmod 0755 /system/etc/install-recovery.sh 2>/dev/null

		mount -o remount,ro /system

		cat /system/etc/install-recovery.sh | grep "daemon" >/dev/null 2>/dev/null
		rc=$?
		if [ "$rc" == "0" ]; then
			/system/etc/install-recovery.sh >/dev/null 2>/dev/null &
		fi
	fi
fi
toolbox log ${1+"$@"}