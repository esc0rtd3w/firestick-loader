@echo off

:reset

title Prep Kodi Data For Generic Android Devices                  esc0rtd3w 2016



del /f /q "%AppData%\Kodi\userdata\advancedsettings.xml"
copy /y "%AppData%\Kodi\userdata\advancedsettings___android.xml" "%AppData%\Kodi\userdata\advancedsettings.xml"

del /f /q "%AppData%\Kodi\addons\skin.xonfluence\720p\Home.xml"
copy /y "%AppData%\Kodi\addons\skin.xonfluence\720p\Home___android.xml" "%AppData%\Kodi\addons\skin.xonfluence\720p\Home.xml"


:end