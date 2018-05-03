@echo off

color 0b

set adb="..\..\bin\adb.exe"
set _color="..\..\bin\cocolor.exe"


:: Some Common IME Keyboards

:: com.amazon.tv.ime/.FireTVIME
:: com.android.adbkeyboard/.AdbIME
:: com.ccpcreations.android.WiiUseAndroid/.WiiControllerIME
:: com.hexad.bluezime/.BluezIME
:: com.mercury.inputmethod.wpad/.WiiControllerIME
:: com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME



cls
echo Available Keyboards:
echo.
%adb% shell ime list -a
echo.
echo.
echo.
echo.
echo.

%_color% 0a
echo Enabled Keyboards:
echo.
%adb% shell ime list -s

echo.
echo.
echo.
echo.

%_color% 0b
pause

