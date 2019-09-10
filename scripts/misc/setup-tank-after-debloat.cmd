@echo off

color 0e


set adb="..\..\bin\adb.exe"
set adbKill="%~dp0bin\adb.exe" kill-server
set adbStart="%~dp0bin\adb.exe" start-server
set adbWait=%adb% wait-for-device

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set accessibility="..\settings\tank\system\scripts\accessibility.sh"
set applications="..\settings\tank\system\scripts\applications.sh"
set device="..\settings\tank\system\scripts\device.sh"
set displaysounds="..\settings\tank\system\scripts\display-sounds.sh"
set help="..\settings\tank\system\scripts\help.sh"
set myaccount="..\settings\tank\system\scripts\my-account.sh"
set network="..\settings\tank\system\scripts\network.sh"
set notifications="..\settings\tank\system\scripts\notifications.sh"
set preferences="..\settings\tank\system\scripts\preferences.sh"


%shell% "su -c mount -o rw /system"

%push% %accessibility% /data/local/tmp/
%push% %applications% /data/local/tmp/
%push% %device% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %notifications% /data/local/tmp/
%push% %preferences% /data/local/tmp/

%shell% "su -c mkdir /system/scripts/"
%shell% "su -c chmod 0755 /system/scripts/"

%shell% "su -c cp /data/local/tmp/accessibility.sh /system/scripts/accessibility.sh"
%shell% "su -c cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "su -c cp /data/local/tmp/device.sh /system/scripts/device.sh"
%shell% "su -c cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "su -c cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "su -c cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "su -c cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "su -c cp /data/local/tmp/notifications.sh /system/scripts/notifications.sh"
%shell% "su -c cp /data/local/tmp/preferences.sh /system/scripts/preferences.sh"

%shell% "su -c chmod 0777 /system/scripts/*.sh"
%shell% "su -c chown root:root /system/scripts/*.sh"

%shell% "mkdir /sdcard/restore/"
%push% "..\..\data\tank\post-debloated\restore\" /sdcard/restore/

%shell% "su -c mkdir /system/restore/"
%shell% "su -c chmod 0755 /system/restore/"
%shell% "su -c cp -r /sdcard/restore/ca.dstudio.atvlauncher.pro/ /system/restore/"
%shell% "su -c cp -r /sdcard/restore/com.adamioan.scriptrunner/ /system/restore/"
%shell% "su -c cp -r /sdcard/restore/com.fluxii.android.mousetoggleforfiretv/ /system/restore/"






echo.
echo Success if not output or error!
echo.
pause



:end



