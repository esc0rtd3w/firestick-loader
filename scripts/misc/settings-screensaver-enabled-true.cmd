@echo off

color 0b

set adb="..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: screensaver_enabled 1
echo Settings^: screensaver_activate_on_dock 1
echo Settings^: screensaver_activate_on_sleep 1
echo Settings^: screensaver_components com.amazon.bueller.photos/.daydream.ScreenSaverService
echo Settings^: screensaver_default_component com.amazon.bueller.photos/.daydream.ScreenSaverService

%shell% settings --user 0 put secure screensaver_enabled 1
%shell% settings --user 0 put secure screensaver_activate_on_dock 1
%shell% settings --user 0 put secure screensaver_activate_on_sleep 1
%shell% settings --user 0 put secure screensaver_components com.amazon.bueller.photos/.daydream.ScreenSaverService
%shell% settings --user 0 put secure screensaver_default_component com.amazon.bueller.photos/.daydream.ScreenSaverService

exit

