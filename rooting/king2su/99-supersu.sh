#!/sbin/sh
#
# /system/addon.d/99-supersu.sh (root:root 755)
# During an upgrade, this script backs up SuperSU-related files,
# /system is formatted and reinstalled, then the files are restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/Superuser.apk
xbin/su
xbin/sugote
xbin/daemonsu
xbin/otasurvival.sh
bin/log
bin/.ext/.su
etc/init.d/99SuperSUDaemon
etc/install-recovery.sh
etc/.installed_su_daemon
.pin
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Nuke the shipped Superuser+su from /system
    list_files | while read FILE DUMMY; do
      [ -e "$S/$FILE" ] && rm $S/"$FILE"
    done
  ;;
  post-restore)
    # Stub
  ;;
esac