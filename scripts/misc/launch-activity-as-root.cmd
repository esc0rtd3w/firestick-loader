@echo off

color 0b

set adb="..\..\bin\adb.exe"
set _color="..\..\bin\cocolor.exe"


:loop
%_color% 0b

cls
echo Enter Action and Press Enter:
echo.
echo.
echo Example: com.amazon.device.settings.action.DISPLAY_AND_SOUNDS
echo.
echo.
echo.

%_color% 0e

set /p arg1=


cls
echo Enter Activity and Press Enter:
echo.
echo.
echo Example: com.amazon.tv.settings/com.amazon.tv.settings.tv.display_sounds.DisplayAndSoundsActivity
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

