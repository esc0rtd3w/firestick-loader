#!/system/bin/sh
# install_su_arm64_api21+.sh
# Convert of your ADB sequence into an on-device installer.
# Target: API 21+ (Lollipop+) on arm64 devices.
#
# Usage:
#   su -c "sh /data/local/tmp/install_su_arm64_api21+.sh [/path/to/payload]"
#
# Payload layout expected under $SRC (default: /data/local/tmp/supersu_payload):
#   common/Superuser.apk
#   common/install-recovery.sh
#   arm64/su
#   arm64/supolicy
#   arm64/libsupol.so
#
# This script will:
#  - Remount /system RW (tries several strategies)
#  - Copy files to /system with proper perms/contexts
#  - Replace app_process/app_process64 with symlinks to daemonsu (per original)
#  - Mark daemon installed and run su --install
#
# NOTE: You MUST run as root. Proceed at your own risk.

set -u

# ---------- config ----------
SRC_DEFAULT="/data/local/tmp/supersu_payload"
LOG_BASE="/sdcard/SuperSUInstall"
LOG="$LOG_BASE/run.log"

# ---------- helpers ----------
ts() { date 2>/dev/null || echo "(no date)"; }
log() { printf "%s | %s\n" "$(ts)" "$*" | tee -a "$LOG" >/dev/null; }
die() { log "ERROR: $*"; exit 1; }

have() { command -v "$1" >/dev/null 2>&1; }
chcon_safe() {
  if have chcon; then
    chcon "$@" 2>/dev/null || log "WARN: chcon $* failed (continuing)"
  else
    log "WARN: chcon not available; continuing without SELinux context set"
  fi
}

require_file() {
  [ -f "$1" ] || die "Missing file: $1"
}

mkdirp() { mkdir -p "$1" 2>/dev/null || true; }

sanitize_path() { # strips CRs if any
  printf '%s' "$1" | tr -d '\r'
}

remount_rw() {
  log "[*] Remounting /system read-write..."
  # Try common variants (toolbox/toybox/busybox)
  mount | grep " on /system " >/dev/null 2>&1 && {
    mount -o remount,rw /system 2>/dev/null && return 0
  }

  # SAR devices sometimes need root (/)
  mount -o remount,rw / 2>/dev/null && return 0

  # Try block device path for /system if known
  SYS_DEV="$(mount | awk '/ on \/system /{print $1}' 2>/dev/null)"
  if [ -n "${SYS_DEV:-}" ]; then
    mount -o remount,rw "$SYS_DEV" /system 2>/dev/null && return 0
  fi

  # BusyBox fallback
  if have busybox; then
    busybox mount -o remount,rw /system 2>/dev/null && return 0
    busybox mount -o remount,rw / 2>/dev/null && return 0
  fi

  log "WARN: remount attempt #1 failed; trying bind trick"
  # Bind trick (rarely needed; may fail silently on newer builds)
  mount -o rw,remount /system 2>/dev/null && return 0

  die "Unable to remount /system as RW. Aborting."
}

remount_ro() {
  log "[*] Remounting /system read-only..."
  mount -o remount,ro /system 2>/dev/null || mount -o remount,ro / 2>/dev/null || true
}

# ---------- start ----------
umask 022

# Ensure log dir
mkdirp "$LOG_BASE"
printf "==== START %s ====\n" "$(ts)" > "$LOG"

# Root check
if [ "$(id -u)" != "0" ]; then
  die "Must be run as root (use: su -c \"sh $0\")"
fi

# Device sanity checks
ABI="$(getprop ro.product.cpu.abilist64 2>/dev/null)"
SDK="$(getprop ro.build.version.sdk 2>/dev/null)"
[ -n "$SDK" ] || SDK=0
case "$ABI" in
  *arm64*|*aarch64*) : ;;
  *) log "WARN: Device may not be 64-bit (abilist64='$ABI'). Continuing anyway...";;
esac
[ "$SDK" -ge 21 ] || log "WARN: SDK=$SDK < 21; script was tested for API21+. Continuing..."

# Source payload path
SRC_RAW="${1:-$SRC_DEFAULT}"
SRC="$(sanitize_path "$SRC_RAW")"
COMMON="$SRC/common"
A64="$SRC/arm64"

log "[*] Using payload from: $SRC"
require_file "$COMMON/Superuser.apk"
require_file "$COMMON/install-recovery.sh"
require_file "$A64/su"
require_file "$A64/supolicy"
require_file "$A64/libsupol.so"

# Remount /system RW
remount_rw

# Create target dirs
mkdirp /system/app/SuperSU
mkdirp /system/bin/.ext
mkdirp /system/xbin
mkdirp /system/lib64
mkdirp /system/etc

# 1) SuperSU app
log "[*] Installing SuperSU.apk"
cp -fp "$COMMON/Superuser.apk" /system/app/SuperSU/SuperSU.apk || die "copy SuperSU.apk failed"
chmod 0644 /system/app/SuperSU/SuperSU.apk
chcon_safe u:object_r:system_file:s0 /system/app/SuperSU/SuperSU.apk

# 2) install-recovery.sh
log "[*] Installing install-recovery.sh"
cp -fp "$COMMON/install-recovery.sh" /system/etc/install-recovery.sh || die "copy install-recovery.sh failed"
chmod 0755 /system/etc/install-recovery.sh
# Original label in your sequence:
chcon_safe u:object_r:toolbox_exec:s0 /system/etc/install-recovery.sh

# Symlink to /system/bin/install-recovery.sh
ln -sf /system/etc/install-recovery.sh /system/bin/install-recovery.sh

# 3) su + daemonsu + .ext/.su
log "[*] Installing su binaries"
cp -fp "$A64/su" /system/xbin/su || die "copy /system/xbin/su failed"
chmod 0755 /system/xbin/su
chcon_safe u:object_r:system_file:s0 /system/xbin/su

cp -fp "$A64/su" /system/bin/.ext/.su || die "copy /system/bin/.ext/.su failed"
chmod 0755 /system/bin/.ext/.su
chcon_safe u:object_r:system_file:s0 /system/bin/.ext/.su

cp -fp "$A64/su" /system/xbin/daemonsu || die "copy /system/xbin/daemonsu failed"
chmod 0755 /system/xbin/daemonsu
chcon_safe u:object_r:system_file:s0 /system/xbin/daemonsu

# 4) supolicy
log "[*] Installing supolicy"
cp -fp "$A64/supolicy" /system/xbin/supolicy || die "copy supolicy failed"
chmod 0755 /system/xbin/supolicy
chcon_safe u:object_r:system_file:s0 /system/xbin/supolicy

# 5) libsupol
log "[*] Installing libsupol.so"
cp -fp "$A64/libsupol.so" /system/lib64/libsupol.so || die "copy libsupol.so failed"
chmod 0644 /system/lib64/libsupol.so
chcon_safe u:object_r:system_file:s0 /system/lib64/libsupol.so

# 6) Backup/replace app_process & app_process64
log "[*] Backing up and replacing app_process binaries"
if [ -f /system/bin/app_process64 ]; then
  cp -fp /system/bin/app_process64 /system/bin/app_process64_original || die "backup app_process64_original failed"
  chmod 0755 /system/bin/app_process64_original
  chcon_safe u:object_r:zygote_exec:s0 /system/bin/app_process64_original

  cp -fp /system/bin/app_process64 /system/bin/app_process_init || die "backup app_process_init failed"
  chmod 0755 /system/bin/app_process_init
  chcon_safe u:object_r:zygote_exec:s0 /system/bin/app_process_init
else
  log "WARN: /system/bin/app_process64 not found; continuing"
fi

# Remove originals (as per original sequence)
rm -f /system/bin/app_process 2>/dev/null
rm -f /system/bin/app_process64 2>/dev/null

# Symlink daemonsu -> app_process variants
ln -sf /system/xbin/daemonsu /system/bin/app_process
ln -sf /system/xbin/daemonsu /system/bin/app_process64

# 7) Mark daemon installed & run su --install
log "[*] Marking daemon installed"
echo 1 > /system/etc/.installed_su_daemon || log "WARN: could not write marker file"

log "[*] Running su --install"
if [ -x /system/xbin/su ]; then
  /system/xbin/su --install 2>&1 | tee -a "$LOG" >/dev/null || log "WARN: 'su --install' returned non-zero"
else
  log "WARN: /system/xbin/su is not executable?"
fi

sync
remount_ro

log "[*] Done."
printf "==== END %s ====\n" "$(ts)" >> "$LOG"
exit 0
