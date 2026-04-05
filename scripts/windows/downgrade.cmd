@echo off

set adb="..\..\bin\adb.exe"

%adb% push update-kindle-montoya-54.5.3.7_user_537174420.bin /sdcard/update.bin

%adb% shell mv /sdcard/update.bin /cache/


%adb% shell rm -f /cache/*.bin
%adb% shell rm -f /cache/*.zip

%adb% shell echo --update_package=/cache/update.bin > /cache/recovery/command