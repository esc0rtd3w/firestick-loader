@echo off

title Android Event Keymap Script [Pulled From ADB Toolkit]  [esc0rtd3w]

color 0b

::mode con lines=50


:reset

:: Setting ADB variables
:set_var
set get="%~dp0bin\adb.exe" shell input keyevent
set gettxt="%~dp0bin\adb.exe" shell input text
set inifile="%~dp0bin\inifile.exe"

::call "scripts\get_info_bar.cmd"



:: Old (ORIGINAL) keymap
:: Setting variables for all known events
::set KEYCODE_UNKNOWN=0
::set KEYCODE_MENU=1
::set KEYCODE_SOFT_RIGHT=2
::set KEYCODE_HOME=3
::set KEYCODE_BACK=4
::set KEYCODE_CALL=5
::set KEYCODE_ENDCALL=6
::set KEYCODE_0=7
::set KEYCODE_1=8
::set KEYCODE_2=9
::set KEYCODE_3=10
::set KEYCODE_4=11
::set KEYCODE_5=12
::set KEYCODE_6=13
::set KEYCODE_7=14
::set KEYCODE_8=15
::set KEYCODE_9=16
::set KEYCODE_STAR=17
::set KEYCODE_POUND=18
::set KEYCODE_DPAD_UP=19
::set KEYCODE_DPAD_DOWN=20
::set KEYCODE_DPAD_LEFT=21
::set KEYCODE_DPAD_RIGHT=22
::set KEYCODE_DPAD_CENTER=23
::set KEYCODE_VOLUME_UP=24
::set KEYCODE_VOLUME_DOWN=25
::set KEYCODE_POWER=26
::set KEYCODE_CAMERA=27
::set KEYCODE_CLEAR=28
::set KEYCODE_A=29
::set KEYCODE_B=30
::set KEYCODE_C=31
::set KEYCODE_D=32
::set KEYCODE_E=33
::set KEYCODE_F=34
::set KEYCODE_G=35
::set KEYCODE_H=36
::set KEYCODE_I=37
::set KEYCODE_J=38
::set KEYCODE_K=39
::set KEYCODE_L=40
::set KEYCODE_M=41
::set KEYCODE_N=42
::set KEYCODE_O=43
::set KEYCODE_P=44
::set KEYCODE_Q=45
::set KEYCODE_R=46
::set KEYCODE_S=47
::set KEYCODE_T=48
::set KEYCODE_U=49
::set KEYCODE_V=50
::set KEYCODE_W=51
::set KEYCODE_X=52
::set KEYCODE_Y=53
::set KEYCODE_Z=54
::set KEYCODE_COMMA=55
::set KEYCODE_PERIOD=56
::set KEYCODE_ALT_LEFT=57
::set KEYCODE_ALT_RIGHT=58
::set KEYCODE_SHIFT_LEFT=59
::set KEYCODE_SHIFT_RIGHT=60
::set KEYCODE_TAB=61
::set KEYCODE_SPACE=62
::set KEYCODE_SYM=63
::set KEYCODE_EXPLORER=64
::set KEYCODE_ENVELOPE=65
::set KEYCODE_ENTER=66
::set KEYCODE_DEL=67
::set KEYCODE_GRAVE=68
::set KEYCODE_MINUS=69
::set KEYCODE_EQUALS=70
::set KEYCODE_LEFT_BRACKET=71
::set KEYCODE_RIGHT_BRACKET=72
::set KEYCODE_BACKSLASH=73
::set KEYCODE_SEMICOLON=74
::set KEYCODE_APOSTROPHE=75
::set KEYCODE_SLASH=76
::set KEYCODE_AT=77
::set KEYCODE_NUM=78
::set KEYCODE_HEADSETHOOK=79
::set KEYCODE_FOCUS=80
::set KEYCODE_PLUS=81
::set KEYCODE_MENU=82
::set KEYCODE_NOTIFICATION=83
::set KEYCODE_SEARCH=84
::set TAG_LAST_KEYCODE=85


:: New keymap
:: Setting variables for all known events
set UNKNOWN=0
set MENU=1
set SOFT_RIGHT=2
set HOME=3
set BACK=4
set CALL=5
set ENDCALL=6
set 0=7
set 1=8
set 2=9
set 3=10
set 4=11
set 5=12
set 6=13
set 7=14
set 8=15
set 9=16
set STAR=17
set POUND=18
set DPAD_UP=19
set DPAD_DOWN=20
set DPAD_LEFT=21
set DPAD_RIGHT=22
set DPAD_CENTER=23
set VOLUME_UP=24
set VOLUME_DOWN=25
set POWER=26
set CAMERA=27
set CLEAR=28
set A=29
set B=30
set C=31
set D=32
set E=33
set F=34
set G=35
set H=36
set I=37
set J=38
set K=39
set L=40
set M=41
set N=42
set O=43
set P=44
set Q=45
set R=46
set S=47
set T=48
set U=49
set V=50
set W=51
set X=52
set Y=53
set Z=54
set COMMA=55
set PERIOD=56
set ALT_LEFT=57
set ALT_RIGHT=58
set SHIFT_LEFT=59
set SHIFT_RIGHT=60
set TAB=61
set SPACE=62
set SYM=63
set EXPLORER=64
set ENVELOPE=65
set ENTER=66
set DEL=67
set GRAVE=68
set MINUS=69
set EQUALS=70
set LEFT_BRACKET=71
set RIGHT_BRACKET=72
set BACKSLASH=73
set SEMICOLON=74
set APOSTROPHE=75
set SLASH=76
set AT=77
set NUM=78
set HEADSETHOOK=79
set FOCUS=80
set PLUS=81
set MENU=82
set NOTIFICATION=83
set SEARCH=84
set TAG_LAST_KEYCODE=85


:startnow
echo.
echo.
echo UNKNOWN=0
echo MENU=1
echo SOFT_RIGHT=2
echo HOME=3
echo BACK=4
echo CALL=5
echo ENDCALL=6
echo 0=7
echo 1=8
echo 2=9
echo 3=10
echo 4=11
echo 5=12
echo 6=13
echo 7=14
echo 8=15
echo 9=16
echo STAR=17
echo POUND=18
echo DPAD_UP=19
echo DPAD_DOWN=20
echo DPAD_LEFT=21
echo DPAD_RIGHT=22
echo DPAD_CENTER=23
echo VOLUME_UP=24
echo VOLUME_DOWN=25
echo POWER=26
echo CAMERA=27
echo CLEAR=28
echo A=29
echo B=30
echo C=31
echo D=32
echo E=33
echo F=34
echo G=35
echo H=36
echo I=37
echo J=38
echo K=39
echo L=40
echo M=41
echo N=42
echo O=43
echo P=44
echo Q=45
echo R=46
echo S=47
echo T=48
echo U=49
echo V=50
echo W=51
echo X=52
echo Y=53
echo Z=54
echo COMMA=55
echo PERIOD=56
echo ALT_LEFT=57
echo ALT_RIGHT=58
echo SHIFT_LEFT=59
echo SHIFT_RIGHT=60
echo TAB=61
echo SPACE=62
echo SYM=63
echo EXPLORER=64
echo ENVELOPE=65
echo ENTER=66
echo DEL=67
echo GRAVE=68
echo MINUS=69
echo EQUALS=70
echo LEFT_BRACKET=71
echo RIGHT_BRACKET=72
echo BACKSLASH=73
echo SEMICOLON=74
echo APOSTROPHE=75
echo SLASH=76
echo AT=77
echo NUM=78
echo HEADSETHOOK=79
echo FOCUS=80
echo PLUS=81
echo MENU=82
echo NOTIFICATION=83
echo SEARCH=84
echo TAG_LAST_KEYCODE=85
echo.
echo.
echo Scroll up to see a list of available events.
echo.
echo Last Executed Event: %command%
echo.
echo.
echo Enter next event (number or name) and press ENTER:
echo.
echo Examples: HOME (3), MENU (1), BACK (4), SEARCH (84)
echo.
echo.
echo Type "text" without quotes to send text strings to phone
::echo.
::echo Type "exit" without quotes to close script
echo.
echo.

set event=0

set /p event=

if %event%==0 goto startnow

if %event%==text goto txtmode

if %event%==exit goto end

::if %event% gtr 85 goto startnow

goto bycmd

:txtmode
cls
echo Enter text to send (no spaces):
echo.

set event=0

set /p event=

if %event%==0 goto txtmode

%gettxt% "%event%"

goto startnow


:bycmd
cls
%inifile% "eventmap.ini" [%event%] command
for /f "delims=" %%a in ('%inifile% "eventmap.ini" [%event%] command') do %%a
if not defined command goto bynum

goto execute


:bynum
%inifile% "eventmap.ini" [%event%] number
for /f "delims=" %%b in ('%inifile% "eventmap.ini" [%event%] number') do %%b


:: Swip Swap of variables (makes crap work)
set event_=%event%
set number_=%number%

set event=%number_%
set number=%event_%

set command=%number%

goto execute


:: For writing new INI
::echo [%command%] >> tmp.txt
::echo number=%event%  >> tmp.txt
::echo. >> tmp.txt



:execute
cls
echo COMMAND IS DEFINED AS %command%
echo.
echo.


%get% %event%

::pause
goto startnow



:end


