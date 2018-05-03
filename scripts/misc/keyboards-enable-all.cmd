@echo off

color 0b

set adb="..\..\bin\adb.exe"
set _color="..\..\bin\cocolor.exe"


:: Some Common IME Keyboards



cls
echo Enabling Known Keyboards....
echo.

%_color% 0a
%adb% shell ime enable com.amazon.tv.ime/.FireTVIME
%adb% shell ime enable com.android.adbkeyboard/.AdbIME
%adb% shell ime enable com.ccpcreations.android.WiiUseAndroid/.WiiControllerIME
%adb% shell ime enable com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME
%adb% shell ime enable uk.co.shenye.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME
%adb% shell ime enable com.hexad.bluezime/.BluezIME
%adb% shell ime enable com.mercury.inputmethod.wpad/.WiiControllerIME
%adb% shell ime enable com.wondershare.mobilego.connector/com.wondershare.mobilego.ime.MirrorGoKeyboard
echo.
echo.
echo.
echo.

%_color% 0b
pause

