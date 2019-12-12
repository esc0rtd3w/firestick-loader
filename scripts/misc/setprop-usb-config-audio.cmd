@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


%shell% setprop sys.usb.config "audio_source"

