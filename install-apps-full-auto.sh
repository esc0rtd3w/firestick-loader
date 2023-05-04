#/bin/sh

adb="$PWD/bin/adb"
fastboot="$PWD/bin/fastboot"
extractRAR="$PWD/bin/rar" -y x
extractZIP="$PWD/bin/unzip" -o

install=$adb install
uninstall=$adb uninstall
push=$adb push
pull=$adb pull
adbkill=$adb kill-server

pathAndroid=Android/data/org.xbmc.kodi/files/.kodi
pathIOS=private/var/mobile/Library/Preferences/Kodi
pathMac=Users/USER_NAME_HERE/Library/Application Support/Kodi
pathLinux=~/.kodi
pathWindows=$AppData/Kodi

temp=/tmp

appName=0

sdcard=sdcard
sdcard2=external_sd
sdcard2=extSdCard


chmod 777 $adb
chmod 777 $fastboot


clear
appName=TeaTV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/teatv.apk"

clear

appName=Popcorn Time

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/popcorntime.apk"

clear

appName=Cat Mouse

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/cat-mouse.apk"

clear

appName=Cinema HD

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/cinemahd.apk"

clear

appName=Typhoon TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/typhoon-tv.apk"

clear

appName=Bee TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/bee-tv.apk"

clear

appName=Nova TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/nova-tv.apk"

clear

appName=FreeFlix HQ

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/freeflixhq.apk"

clear

appName=Pluto TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/pluto-tv.apk"

clear

appName=Tubi TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/tubi-tv.apk"

clear

appName=Xumo TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/xumo-tv.apk"

clear

appName=LiveNET TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/live-net-tv.apk"

clear

appName=SOPlayer

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/so-player.apk"

clear

appName=Popcornflix

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/popcornflix.apk"

clear

appName=NetFlix

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/netflix-amazon.apk"

clear

appName=Hulu

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/hulu-amazon.apk"

clear

appName=Amazon Prime Video

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/amazon/amazon-prime-video.apk"

clear

appName=Smart Youtube TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/smart-youtube.apk"

clear

appName=Smart Youtube TV Bridge

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/smart-youtube-bridge.apk"

clear

appName=Twitch

echo ""
echo ""
echo Installing $appname...
echo ""
$install "/$temp/firestick-loader/$PWD/apps/media/twitch-amazon.apk"

clear

appName=Crackle

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/crackle.apk"

clear

appName=VLC TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/vlc.apk"

clear

appName=Podcast Addict

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/media/podcast-addict.apk"

clear

appName=Aptoid TV

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/stores/aptoid-tv.apk"

clear

appName=Firefox TV Web Browser

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/web/firefox-tv.apk"

clear

appName=TV Games

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/games/tv-games.apk"

clear

appName=Pacman 256

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/games/pacman-256.apk"

clear

appName=Flappy Birds Family

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/games/flappy-birds-family-amazon.apk"


clear

appName=Falling Lightblocks

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/games/falling-lightblocks.apk"

clear

appName=Solitaire

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/games/solitaire.apk"

clear

appName=Big Shark

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/games/big-shark.apk"

clear

appName=Orb Wars

echo ""
echo ""
echo Installing $appname...
echo ""
$install "$PWD/apps/games/orb-wars.apk"

goto end

:end



