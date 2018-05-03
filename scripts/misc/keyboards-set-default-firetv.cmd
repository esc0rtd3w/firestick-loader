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
echo Setting Keyboard To Default Amazon FireTV IME....
echo.
%adb% shell ime set com.amazon.tv.ime/.FireTVIME
