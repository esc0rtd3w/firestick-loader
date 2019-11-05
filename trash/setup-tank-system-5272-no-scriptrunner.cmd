@echo off

title Full Setup Script For Tank

set fwVersion=0.0.0.0
set fwVersionSelect=0

set adb="%~dp0bin\adb.exe"
set adbKill=%adb% kill-server
set adbStart=%adb% start-server
set adbWait=%adb% wait-for-device
set sleep="%~dp0bin\wait.exe"
set extractRAR="%~dp0bin\rar.exe" -y x
set cocolor="%~dp0bin\cocolor.exe"

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell
set twrp=%shell% twrp

if not exist "%temp%\firestick-loader" md "%temp%\firestick-loader"

%shell% "su -c mount -o remount,rw /system"
%sleep% 5

:start
color 0e
set accessibility="scripts\settings\tank\system\scripts\5272\accessibility.sh"
set alexa="scripts\settings\tank\system\scripts\5272\alexa.sh"
set applications="scripts\settings\tank\system\scripts\5272\applications.sh"
set btcontroller="scripts\settings\tank\system\scripts\5272\btcontroller.sh"
set device="scripts\settings\tank\system\scripts\5272\device.sh"
set displaysounds="scripts\settings\tank\system\scripts\5272\display-sounds.sh"
set equipment="scripts\settings\tank\system\scripts\5272\equipment.sh"
set help="scripts\settings\tank\system\scripts\5272\help.sh"
set myaccount="scripts\settings\tank\system\scripts\5272\my-account.sh"
set network="scripts\settings\tank\system\scripts\5272\network.sh"
set notifications="scripts\settings\tank\system\scripts\5272\notifications.sh"
set preferences="scripts\settings\tank\system\scripts\5272\preferences.sh"

cls
echo Setting Up Directories For Restore...
echo.
%shell% "su -c rm -r /sdcard/restore/"
%shell% "su -c mkdir /sdcard/restore/"
%shell% "su -c rm -r /sdcard/TitaniumBackup/"
%shell% "su -c mkdir /sdcard/restore/apk/"
%shell% "su -c mkdir /sdcard/restore/apk/system/"
%sleep% 2

cls
echo Pushing Restore Data to /sdcard/...
echo.
%push% "data\tank\post-debloated\restore" /sdcard/restore/
%sleep% 2

cls
echo Copying TitaniumBackup Data For Restore...
echo.
%shell% "su -c cp -r /sdcard/restore/TitaniumBackup/ /sdcard/"
%sleep% 2

cls
echo Creating System Restore Directories and Setting Permissions...
echo.
%shell% "su -c rm -r /system/restore/"
%shell% "su -c mkdir /system/restore/"
%shell% "su -c mkdir /system/restore/apk/"
%shell% "su -c mkdir /system/restore/apk/system/"

%shell% "su -c chmod 0777 /system/restore/"
%shell% "su -c chown root:root /system/restore/"

%shell% "su -c chmod 0777 /system/restore/apk/"
%shell% "su -c chown root:root /system/restore/apk/"

%shell% "su -c chmod 0777 /system/restore/apk/system/"
%shell% "su -c chown root:root /system/restore/apk/system/"

cls
echo Copying Data from /sdcard to /system...
echo.
%shell% "su -c cp -r /sdcard/restore/ /system/"
%sleep% 2

cls
echo Removing Unused Images and Sounds...
echo.
%shell% "su -c rm -r /system/res/images/*.*"
%shell% "su -c rm -r /system/res/sound/*.*"
%sleep% 2

cls
echo Pushing Settings Scripts to Temp...
echo.
%push% %accessibility% /data/local/tmp/
%push% %alexa% /data/local/tmp/
%push% %applications% /data/local/tmp/
%push% %btcontroller% /data/local/tmp/
%push% %device% /data/local/tmp/
%push% %displaysounds% /data/local/tmp/
%push% %equipment% /data/local/tmp/
%push% %help% /data/local/tmp/
%push% %myaccount% /data/local/tmp/
%push% %network% /data/local/tmp/
%push% %notifications% /data/local/tmp/
%push% %preferences% /data/local/tmp/

%sleep% 2

cls
echo Pushing Restore Home Script to Temp...
echo.
%push% "scripts\restore-home.sh" /data/local/tmp/

%sleep% 2

cls
echo Making Directories and Setting Permissions for Settings Scripts...
echo.
%shell% "su -c rm -r /system/scripts/"
%shell% "su -c mkdir /system/scripts/"
%shell% "su -c chmod 0777 /system/scripts/"

%sleep% 2

cls
echo Copying Settings Scripts From Temp to /system...
echo.
%shell% "su -c cp /data/local/tmp/accessibility.sh /system/scripts/accessibility.sh"
%shell% "su -c cp /data/local/tmp/alexa.sh /system/scripts/alexa.sh"
%shell% "su -c cp /data/local/tmp/applications.sh /system/scripts/applications.sh"
%shell% "su -c cp /data/local/tmp/btcontroller.sh /system/scripts/btcontroller.sh"
%shell% "su -c cp /data/local/tmp/device.sh /system/scripts/device.sh"
%shell% "su -c cp /data/local/tmp/display-sounds.sh /system/scripts/display-sounds.sh"
%shell% "su -c cp /data/local/tmp/equipment.sh /system/scripts/equipment.sh"
%shell% "su -c cp /data/local/tmp/help.sh /system/scripts/help.sh"
%shell% "su -c cp /data/local/tmp/my-account.sh /system/scripts/my-account.sh"
%shell% "su -c cp /data/local/tmp/network.sh /system/scripts/network.sh"
%shell% "su -c cp /data/local/tmp/notifications.sh /system/scripts/notifications.sh"
%shell% "su -c cp /data/local/tmp/preferences.sh /system/scripts/preferences.sh"

%sleep% 2

cls
echo Copying Restore Home Script From Temp to /system...
echo.
%shell% "su -c cp /data/local/tmp/restore-home.sh /system/scripts/restore-home.sh"

%sleep% 2

cls
echo Setting Permissions...
echo.
%shell% "su -c chmod 0777 /system/scripts/*.sh"
%shell% "su -c chown root:root /system/scripts/*.sh"

%sleep% 2

cls
echo Copying Apps to /system/app/...
echo.
%shell% "su -c rm -r /system/app/Launcher/"
%shell% "su -c mkdir /system/app/Launcher/"
%shell% "su -c chmod 0755 /system/app/Launcher/"
%shell% "su -c chown root:root /system/app/Launcher/"
%shell% "su -c cp /system/restore/apk/system/Launcher.apk /system/app/Launcher/Launcher.apk"

%shell% "su -c rm -r /system/app/TitaniumBackup/"
%shell% "su -c mkdir /system/app/TitaniumBackup/"
%shell% "su -c chmod 0755 /system/app/TitaniumBackup/"
%shell% "su -c chown root:root /system/app/TitaniumBackup/"
%shell% "su -c cp /system/restore/apk/system/TitaniumBackup.apk /system/app/TitaniumBackup/TitaniumBackup.apk"

%shell% "su -c rm -r /system/app/TitaniumBackupAddon/"
%shell% "su -c mkdir /system/app/TitaniumBackupAddon/"
%shell% "su -c chmod 0755 /system/app/TitaniumBackupAddon/"
%shell% "su -c chown root:root /system/app/TitaniumBackupAddon/"
%shell% "su -c cp /system/restore/apk/system/TitaniumBackupAddon.apk /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"

%sleep% 2

cls
echo Setting Permissions For System Apps...
echo.
%shell% "su -c chmod 0644 /system/app/Launcher/Launcher.apk"
%shell% "su -c chown root:root /system/app/Launcher/Launcher.apk"

%shell% "su -c chmod 0644 /system/app/TitaniumBackup/TitaniumBackup.apk"
%shell% "su -c chown root:root /system/app/TitaniumBackup/TitaniumBackup.apk"

%shell% "su -c chmod 0644 /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"
%shell% "su -c chown root:root /system/app/TitaniumBackupAddon/TitaniumBackupAddon.apk"

%sleep% 2

%adb% reboot

:end



