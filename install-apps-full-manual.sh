#!/bin/sh


# Part of The FireStick Loader

# esc0rtd3w 2016


adb="$PWD/bin/adb.linux"

sdcard="sdcard"
#sdcard="external_sd"
#sdcard="extSdCard"



extractRAR="$PWD/bin/rar -y x"
extractZIP="$PWD/bin/unzip -o"

appName="0"
choice="2"

install="$adb install"
uninstall="$adb uninstall"
push="$adb push"
pull="$adb pull"

pathAndroid="Android/data/org.xbmc.kodi/files/.kodi"
pathIOS="private/var/mobile/Library/Preferences/Kodi"
pathMac="Users/USER_NAME_HERE/Library/Application Support/Kodi"
pathLinux="~/.kodi"
pathWindows="$AppData\Kodi"

apk=""
info=""
requirements=""

isKodi="0"
isPopcornTime="0"
hasData="0"

temp="/tmp"

sdcard="sdcard"
#sdcard="external_sd"
#sdcard="extSdCard"

fireOsVersion="0.0.0.0"

#baddieStringOne="ro.build.version.name=\"Fire OS 5.0.5.1 (537175520)\""
#baddieStringTwo="ro.build.version.incremental=\"54.5.3.7_user_537175520\""
#baddieStringThree="ro.build.version.fireos=\"5.0.5.1\""
baddieStringOne="537175520"
baddieStringTwo="54.5.3.7_user_537175520"
baddieStringThree="5.0.5.1"

# This Flag To "0" For Original FireStarter (pre 5.0.5.1)
# This Flag To "1" For New Firestopper (post 5.0.5.1)
baddieFlagOne="0"
baddieFlagTwo="0"

# This Flag To "0" For Original Firestarter
baddieFlagActive="0"

buildDotProp="/system/build.prop"


nextApp="1"
lastApp="0"


# Install Firestarter Specific
installFirestarter(){

	appName="FireStarter"
	apk="$PWD/apps/system/firestarter.apk"
	requirements="NONE"
	info="Home Replacement App"


	clear
	echo "Install $appName"
	echo ""
	echo "1) Yes   2) No"
	echo ""
	echo ""
	echo "Requirements: $requirements"
	echo ""
	echo "Info: $info"
	echo ""

	read choice

	case "$choice" in

		"1")
		appName="FireStarter"
		apk="$PWD/apps/system/firestopper.apk"
		
		clear
		echo ""
		echo ""
		echo "Installing $appName..."
		echo ""
		
		$install $apk
		
		
		appName="FireStarter"
		apk="$PWD/apps/system/firestarter.apk"
		
		clear
		echo ""
		echo ""
		echo "Installing $appName..."
		echo ""
		
		$install $apk
		
		;;
	esac

}


# Install App Generic
installApp(){

	appName="$1"
	apk="$2"
	requirements="$3"
	info="$4"

	clear
	echo "Install $1"
	echo ""
	echo "1) Yes   2) No"
	echo ""
	echo ""
	echo "$3"
	echo ""
	echo "$4"
	echo ""

	read choice

	case "$choice" in

		"1")
		
		case "$isSplit" in
		
			"0")
			$install $apk
			;;
		
			"1")
			case "$isKodi" in
			
				"1")
				$extractRAR "$PWD/apps/media/kodi.apk.split" "$temp/firestick-loader/apps/media"
				sleep 3
				$install "$temp/firestick-loader/apps/media/kodi.apk"
				#$install $apk
				;;
			
			esac
			
			case "$isPopcornTime" in
			
				"1")
				$extractRAR "$PWD/apps/media/popcorntime.apk.split" "$temp/firestick-loader/apps/media"
				sleep 3
				$install "$temp/firestick-loader/apps/media/popcorntime.apk"
				#$install $apk
				;;
			
			esac
			;;
		
		esac
		
		case "$hasData" in
		
			"1")
			case "$isKodi" in
			
				"1")
				$extractRAR "$PWD/apps/media/kodi/kodi.data.split" "$temp/firestick-loader/apps/media/kodi"
				$push "$temp/firestick-loader/apps/media/kodi/addons" "/$sdcard/$pathAndroid/addons"
				$push "$temp/firestick-loader/apps/media/kodi/userdata" "/$sdcard/$pathAndroid/userdata"
				#rm -r "$temp/firestick-loader/apps/media/kodi/"
				;;
			
			esac
			;;
		
		esac
		
		;;

		"2")
		nextApp=1
		;;
	esac

}
	

# Check If Last App To Determine Exit Status
case "$lastApp" in

	"0"
	
	case "$nextApp" in
	
		"0")
		end
		;;
	
		"1")
		# Install An App SAMPLE (Pass 5 Variables To installApp() Function)
		#appName="FireStarter"
		#apk="apps/system/firestarter.apk"
		#requirements="Requirements: NONE"
		#info="Info: Home Replacement App"
		#hasData="0"
		
		installApp "$appName" "$apk" "$requirements" "$info" "$hasData"
		;;
	
	esac
	
	;;

	"1"
	end
	;;

esac



# See Ya!
end(){

	exit

}



