#!/system/bin/sh
PATH=/sbin:/system/sbin:/system/bin:/system/xbin

export FOS_FLAGS_ADB_ON=0x1
export FOS_FLAGS_CONSOLE_ON=0x4
export FOS_FLAGS_RAMDUMP_ON=0x8
export FOS_FLAGS_VERBOSITY_ON=0x10
export FOS_FLAGS_ADB_AUTH_DISABLE=0x20

# General FOS flags, shared across devices
fosflagsfile="/proc/idme/fos_flags"
# Optional device specific flags
devflagsfile="/proc/idme/dev_flags"
# User controllable flags (privilege not required to set)
usrflagsfile="/proc/idme/usr_flags"
# adb closed device
adb_cd="/system/etc/adb_cd.sh"
WIPE="/system/bin/wipe_fos_flags"
FACTORYMODE="/data/system/FACTORYMODE"


function unset_adb_persistent_property()
{
    local lcl_usb_prop=$(getprop persist.sys.usb.config)

    if [[ $lcl_usb_prop != *adb* ]]; then
        log -t FOSFLAGS "adb is not enabled, nothing to do"
        return
    fi

    #adb is typically the last property, but it might not be the case,
    # better be safe and tokenize
    usb_tokens=(${lcl_usb_prop//,/ })
    if [ ${#usb_tokens[@]} -eq 1 ]; then
        lcl_usb_prop="none"
    else
        unset lcl_usb_prop
        for i in ${usb_tokens[@]}; do
            if [[ $i == "adb" ]]; then continue; fi

            if [[ $lcl_usb_prop ]]; then
                lcl_usb_prop=$lcl_usb_prop,$i
            else
                lcl_usb_prop=$i
            fi
        done
    fi
    log -t FOSFLAGS "Disable ADB from persist property"
    setprop persist.sys.usb.config $lcl_usb_prop
}


if [ -f $fosflagsfile ]; then
    FOSFLAGS=$(cat $fosflagsfile)

    # Ensure input is only hexadecimal
    in_size=${#FOSFLAGS}
    FOSFLAGS=${FOSFLAGS//[!^a-fA-F0-9]/}
    # If size differs, there might be something wrong
    if [ ${#FOSFLAGS} -ne $in_size ]; then
        FOSFLAGS=0
    fi
    # If empty, set safe value
    if [[ ! $FOSFLAGS ]];then
        FOSFLAGS=0
    fi

    export FOSFLAGS=0x$FOSFLAGS

    log -t FOSFLAGS Read FOS flags:$FOSFLAGS

    if [ $# -gt 0 -a $1 = "wipe" ]; then
      if [ ! -x ${WIPE} ]; then
        log -t FOSFLAGS No wipe_fos_flags found - fos_flags wipe not supported
        exit 1
      fi
      if [ "$FOSFLAGS" = "0x0" ]; then
        log -t FOSFLAGS FOS flags already cleared - disabling adb
        unset_adb_persistent_property
      else
        FOSFLAGS=0x$(${WIPE} 2>/dev/null)
        if [ "$FOSFLAGS" = "0x0" ]; then
          log -t FOSFLAGS fos_flags wipe succeeded
          unset_adb_persistent_property
        else
          log -t FOSFLAGS fos_flags wipe failed
          exit 1
        fi
      fi
      exit 0
    fi

    if [ $(( $FOS_FLAGS_ADB_ON & $FOSFLAGS )) != 0 ]; then
        log -t FOSFLAGS "Enabling adb from FOS flags"
        old_usb_prop=$(getprop persist.sys.usb.config)

        if [[ ! $old_usb_prop == *adb* ]]; then
            if [[ $old_usb_prop == "none" ]]; then
                usb_prop=adb
            else
                usb_prop="${old_usb_prop},adb"
            fi
            setprop persist.sys.usb.config $usb_prop
        fi
    else
        # Check if cleanup is required
        if [ x$(getprop ro.boot.clear_fos_adb) == xtrue ]; then
            unset_adb_persistent_property
        elif [ -f $adb_cd ]; then
            # Check if its a closed device
            closed_device=$($adb_cd)
            if [ $closed_device == closed ]; then
                unset_adb_persistent_property
            fi
        fi
    fi

    if [ $(( $FOS_FLAGS_CONSOLE_ON & $FOSFLAGS )) != 0 ]; then
        log -t FOSFLAGS "Enabling console from FOS flags"
        start console
    fi

    if [ $(( $FOS_FLAGS_VERBOSITY_ON & $FOSFLAGS )) != 0 ]; then
        log -t FOSFLAGS "Enabling verbose logging from FOS flags"
        # KLOG_DEBUG = 7
        setprop sys.init_log_level 7
    fi

    if [ $(( $FOS_FLAGS_RAMDUMP_ON & $FOSFLAGS )) != 0 ]; then
        log -t FOSFLAGS "Setting ramdump property on"
        setprop persist.sys.mdump.enable 1
    else
        mdump_prop=$(getprop persist.sys.mdump.enable)
        if [[ $mdump_prop && $(getprop persist.sys.mdump.enable) -eq 1 ]]; then
            log -t FOSFLAGS "Disable ramdump property"
            setprop persist.sys.mdump.enable 0
        fi
    fi

    if [ $(( $FOS_FLAGS_ADB_AUTH_DISABLE & $FOSFLAGS )) != 0 -o -f $FACTORYMODE ]; then
      # set a property to signal higher layers that adb auth is temporarily
      # suspended
      setprop amazon.fos_flags.noadbauth 1
    fi
fi

if [ -f $usrflagsfile ]; then
    export USRFLAGS=`cat $usrflagsfile`
    log -t FOSFLAGS Read USR flags:$USRFLAGS
fi

PRODUCT=$(getprop ro.product.device)
if [ -z "$PRODUCT" ]; then
    log -t FOSFLAGS "ro.product.device is not set";
    PRODUCT="NOTSET_ERROR_ro.product.device";
fi

DEVFLAGS_SH="/system/etc/init.fosflags.${PRODUCT}.sh"
if [ -f "$devflagsfile" -a -f "$DEVFLAGS_SH" ]; then
    /system/bin/sh $DEVFLAGS_SH
fi
