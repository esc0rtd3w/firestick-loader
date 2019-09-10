set apk=%1

@echo off

color 0e


set adb="..\..\bin\adb.exe"
set install=%adb% install



cls
set apk=0

cls
echo Type Name of Package or Drop and Press ENTER:
echo.
echo.

set /p apk=


%install% %apk%


pause


:end



