@echo off

color 0b

set adb="..\..\bin\adb.exe"

set adbKill=%adb% kill-server
set adbStart=%adb% start-server
set install=%adb% install
set installOverwrite=%adb% install -r -t -d
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell
set adbwait=%adb% wait-for-device

set amStart=%shell% am start -a android.intent.action.MAIN -n

%amStart% com.amazon.bueller.photos/com.amazon.bueller.photos.daydream.ScreenSaverService

pause