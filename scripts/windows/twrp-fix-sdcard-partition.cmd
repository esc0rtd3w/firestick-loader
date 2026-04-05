@echo off

color 0e

set adb="..\..\bin\adb.exe"
set shell=%adb% shell
set twrp=%shell% twrp

:: Source: https://forum.xda-developers.com/showthread.php?t=2222297

%shell% "chown -R media_rw:media_rw /data/media/"
%shell% "find /data/media/ -type d -exec chmod 775 {} ';'"
%shell% "find /data/media/ -type f -exec chmod 664 {} ';'"

%shell% "restorecon -FR /data/media/"

:end



