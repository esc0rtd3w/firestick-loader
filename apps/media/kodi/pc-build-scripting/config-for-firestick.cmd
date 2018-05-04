@echo off

:reset

title Prep Kodi Data For FireStick                             esc0rtd3w 2016



del /f /q "%AppData%\Kodi\userdata\advancedsettings.xml"
copy /y "%AppData%\Kodi\userdata\advancedsettings___firestick.xml" "%AppData%\Kodi\userdata\advancedsettings.xml"

del /f /q "%AppData%\Kodi\addons\skin.xonfluence\720p\Home.xml"
copy /y "%AppData%\Kodi\addons\skin.xonfluence\720p\Home___firestick.xml" "%AppData%\Kodi\addons\skin.xonfluence\720p\Home.xml"


:end