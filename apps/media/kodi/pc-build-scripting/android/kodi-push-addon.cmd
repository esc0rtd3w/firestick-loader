set addon=%1

@echo off

:reset

cls

set adb="..\..\..\bin\adb.exe"
set adbWait=%adb% wait-for-device

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

set addonName=0


title Kodi Addon Pusher for Android                                   esc0rtd3w 2016


if "%addon%"=="" (

	cls
	echo No Addon Set!
	echo.
	echo Drop an addon folder into this window or script to install....
	echo.
	echo.
	set /p addon=
	
	for %%f in (%addon%) do set addonName=%%~nxf
	
	%push% "%addon%" /%sdcard%/Android/data/org.xbmc.kodi/files/.kodi/addons/%addonName%
	
	goto end
)

::set addon=%addon:~0,-1%
for %%f in (%addon%) do set addonName=%%~nxf
%push% "%addon%" /%sdcard%/Android/data/org.xbmc.kodi/files/.kodi/addons/%addonName%



:end