@echo off

:reset

title Prep Kodi For Packaging                             esc0rtd3w 2016



del /f /q "%AppData%\Kodi\kodi.log"
del /f /q "%AppData%\Kodi\kodi.old.log"
del /f /q "%AppData%\Kodi\kodi_crashlog-*.dmp"
del /f /q "%AppData%\Kodi\kodi_stacktrace-*.txt"
del /f /q "%AppData%\Kodi\addons\packages\*"
rd /s /q "%AppData%\Kodi\cache"
rd /s /q "%AppData%\Kodi\media"
rd /s /q "%AppData%\Kodi\system"

rd /s /q "%AppData%\Kodi\userdata\Database"
rd /s /q "%AppData%\Kodi\userdata\Thumbnails"



:end