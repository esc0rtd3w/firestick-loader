@echo off

:reset

title Kodi Log Viewer                                                      esc0rtd3w 2016

tail -f "%AppData%\Kodi\kodi.log"

goto reset

:end