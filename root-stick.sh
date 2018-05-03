#!/bin/sh


# Part of The FireStick Loader

# esc0rtd3w 2016


adb="$PWD/bin/adb.linux"

sdcard="sdcard"
#sdcard="external_sd"
#sdcard="extSdCard"


extractRAR="$PWD/bin/rar -y x"
extractZIP="$PWD/bin/unzip -o"

install="$adb install"
uninstall="$adb uninstall"
push="$adb push"
pull="$adb pull"
shell="$adb shell"
adbWait="$adb wait-for-device"

temp="/tmp"

swipeUp="$shell input swipe 200 900 200 300"
keyEnter="$shell input keyevent 66"
keyOk="$shell input keyevent 23"
keyTab="$shell input keyevent 61"
keyArrowUp="$shell input keyevent 19"
keyArrowDown="$shell input keyevent 20"
keyArrowLeft="$shell input keyevent 21"
keyArrowRight="$shell input keyevent 22"

keyBack="$shell input keyevent 3"
keyHome="$shell input keyevent 4"

bloatAction="disable"

sdcard="sdcard"
#sdcard="external_sd"
#sdcard="extSdCard"

fireOsVersion="0.0.0.0"

buildDotProp="/system/build.prop"

rootable="0"
rootableText="NOT EXPLOITABLE"
firstCheck="0"
firstTimeRootAttempt="1"


# Direct Invoking

# Settings -> Main
showSettingsMain="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.launcher/.ui.SettingsActivity"

# Settings -> Display & Sounds
showSettingsDisplay="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.BuellerDisplayAndSoundsSettingsActivity"

# Settings -> Parental Controls
showSettingsParental="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.parentalcontrols/.PCONSettingsActivity"

# Settings -> Controllers and Bluetooth Devices
showSettingsControllers="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.BuellerControllersSettingsActivity"

# Settings -> Applications
showSettingsApplications="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.BuellerApplicationsSettingsActivity"
showSettingsApplicationsManage="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.AllApplicationsSettingsActivity"

# Settings -> System
showSettingsSystemMain="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.BuellerSystemSettingsActivity"
showSettingsSystemDeveloper="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.BuellerDevelopmentSettingsActivity"
showSettingsSystemFactoryReset="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.FactoryResetActivity"

# Settings -> My Account
showSettingsMyAccount="$shell am start -a android.intent.action.MAIN -n com.amazon.tv.settings/.tv.BuellerAccountSettingsActivity"


returnTo="menu"





menu(){

	

}







# See Ya!
end(){

	exit

}



