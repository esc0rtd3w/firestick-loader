@echo off

color 0e


set adb="..\..\bin\adb.exe"


set pull=%adb% pull



cls

mkdir "%temp%\firestick-loader"
mkdir "%temp%\firestick-loader\TitaniumBackup"

%pull% /sdcard/TitaniumBackup/ "%temp%\firestick-loader\backups\TitaniumBackup"


start "" explorer "%temp%\firestick-loader\backups\TitaniumBackup"

pause

:end



