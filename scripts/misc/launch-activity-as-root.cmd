@echo off

color 0b

set adb="..\..\bin\adb.exe"
set _color="..\..\bin\cocolor.exe"


:loop
%_color% 0b

cls
echo Enter Arg1 and Press Enter:
echo.
echo.
echo Example: de.belu.firestopper
echo.
echo.
echo.

%_color% 0e

set /p arg1=


cls
echo Enter Activity and Press Enter:
echo.
echo.
echo Example: de.belu.firestopper/.gui.MainActivity
echo.
echo.
echo.

set /p activity=

%adb% shell "su -c am start -a %arg1% -n %activity%"

%_color% 0b

echo.
echo.
pause

goto loop

