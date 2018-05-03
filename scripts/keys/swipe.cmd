@echo off

title ADB Swiper v0.2                                         firepwn.com / esc0rtd3w 2017

set adb="..\..\bin\adb.exe"

set x1=200
set y1=900
set x2=200
set y2=300

set x1d=200
set y1d=900
set x2d=200
set y2d=300


:start

cls
color 0e
echo Set X1 and Press ENTER:
echo.
echo.
echo.
echo Current Values:
echo.
echo X1: %x1%
echo.
echo Y1: %y1%
echo.
echo X2: %x2%
echo.
echo Y2: %y2%
echo.
echo.
echo.
echo.
echo Press D To Reset Back To Default Values
echo.
echo.

set /p x1=

if %x1%==D goto reset
if %x1%==d goto reset

cls
color 0b
echo Set Y1 and Press ENTER:
echo.
echo.
echo.
echo Current Values:
echo.
echo X1: %x1%
echo.
echo Y1: %y1%
echo.
echo X2: %x2%
echo.
echo Y2: %y2%
echo.
echo.
echo.
echo.
echo Press D To Reset Back To Default Values
echo.
echo.

set /p y1=

if %y1%==D goto reset
if %y1%==d goto reset

cls
color 0d
echo Set X2 and Press ENTER:
echo.
echo.
echo.
echo Current Values:
echo.
echo X1: %x1%
echo.
echo Y1: %y1%
echo.
echo X2: %x2%
echo.
echo Y2: %y2%
echo.
echo.
echo.
echo.
echo Press D To Reset Back To Default Values
echo.
echo.

set /p x2=

if %x2%==D goto reset
if %x2%==d goto reset

cls
color 0a
echo Set Y2 and Press ENTER:
echo.
echo.
echo.
echo Current Values:
echo.
echo X1: %x1%
echo.
echo Y1: %y1%
echo.
echo X2: %x2%
echo.
echo Y2: %y2%
echo.
echo.
echo.
echo.
echo Press D To Reset Back To Default Values
echo.
echo.

set /p y2=

if %y2%==D goto reset
if %y2%==d goto reset

%adb% shell input swipe %x1% %y1% %x2% %y2%

goto start


:reset

set x1=%x1d%
set y1=%y1d%
set x2=%x2d%
set y2=%y2d%

goto start



:end



