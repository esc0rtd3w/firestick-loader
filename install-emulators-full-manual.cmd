@echo off

color 0e

set adb="%~dp0bin\adb.exe"

set emuName=0



:: NES
cls
set emuName=NES
echo Install %emuName% Emulator?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %emuName% Emulator...
echo.
%adb% install "emulators\nes.apk"
)

cls
echo Copy %emuName% Roms To SD Card?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Copying %emuName% Roms...
echo.

md "%cd%\emulators\roms\nes"

"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\nes.zip" -d "%temp%\firestick-loader\emulators\roms\nes"

%adb% push "emulators\roms\nes" "/sdcard/roms/nes"

del /f /q "%cd%\emulators\roms\nes\*.*"
rd "%cd%\emulators\roms\nes"
)


:: Super Nintendo
cls
set emuName=SNES
echo Install %emuName% Emulator?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %emuName% Emulator...
echo.
%adb% install "emulators\snes.apk"
)

cls
echo Copy %emuName% Roms To SD Card?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Copying %emuName% Roms...
echo.

md "%cd%\emulators\roms\snes"

"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\snes.zip" -d "%temp%\firestick-loader\emulators\roms\snes"

%adb% push "emulators\roms\snes" "/sdcard/roms/snes"

del /f /q "%cd%\emulators\roms\snes\*.*"
rd "%cd%\emulators\roms\snes"
)


:: Gameboy Advance
cls
set emuName=Gameboy Advance
echo Install %emuName% Emulator?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %emuName% Emulator...
echo.
%adb% install "emulators\gba.apk"
)

cls
echo Copy %emuName% Roms To SD Card?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Copying %emuName% Roms...
echo.

md "%cd%\emulators\roms\gba"

"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\gba.zip" -d "%temp%\firestick-loader\emulators\roms\gba"

%adb% push "emulators\roms\gba" "/sdcard/roms/gba"

del /f /q "%cd%\emulators\roms\gba\*.*"
rd "%cd%\emulators\roms\gba"
)


:: Sega Genesis
cls
set emuName=Sega Genesis
echo Install %emuName% Emulator?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %emuName% Emulator...
echo.
%adb% install "emulators\genesis.apk"
)

cls
echo Copy %emuName% Roms To SD Card?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Copying %emuName% Roms...
echo.

md "%cd%\emulators\roms\genesis"

"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\genesis.zip" -d "%temp%\firestick-loader\emulators\roms\genesis"

%adb% push "emulators\roms\genesis" "/sdcard/roms/genesis"

del /f /q "%cd%\emulators\roms\genesis\*.*"
rd "%cd%\emulators\roms\genesis"
)



:: Intellivision
cls
set emuName=Intellivision
echo Install %emuName% Emulator?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %emuName% Emulator...
echo.
%adb% install "emulators\intv.apk"
)

cls
echo Copy %emuName% Roms To SD Card?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Copying %emuName% Roms...
echo.

md "%cd%\emulators\roms\intv"

"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\intv.zip" -d "%temp%\firestick-loader\emulators\roms\intv"

%adb% push "emulators\roms\intv" "/sdcard/roms/intv"

del /f /q "%cd%\emulators\roms\intv\*.*"
rd "%cd%\emulators\roms\intv"
)



:: Colecovision
cls
set emuName=Colecovision
echo Install %emuName% Emulator?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %emuName% Emulator...
echo.
%adb% install "emulators\colecovision.apk"
)

cls
echo Copy %emuName% Roms To SD Card?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Copying %emuName% Roms...
echo.

md "%cd%\emulators\roms\colecovision"

"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\colecovision.zip" -d "%temp%\firestick-loader\emulators\roms\colecovision"

%adb% push "emulators\roms\colecovision" "/sdcard/roms/colecovision"

del /f /q "%cd%\emulators\roms\colecovision\*.*"
rd "%cd%\emulators\roms\colecovision"
)


:: Atari
cls
set emuName=Atari 2600
echo Install %emuName% Emulator?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Installing %emuName% Emulator...
echo.
%adb% install "emulators\2600.apk"
)

cls
echo Copy %emuName% Roms To SD Card?
echo.
echo 1) Yes   2) No
echo.
set /p choice=
if %choice%==1 (
echo.
echo.
echo Copying %emuName% Roms...
echo.

md "%cd%\emulators\roms\2600"

"%cd%\bin\unzip.exe" -o "%cd%\emulators\roms\2600.zip" -d "%temp%\firestick-loader\emulators\roms\2600"

%adb% push "emulators\roms\2600" "/sdcard/roms/2600"

del /f /q "%cd%\emulators\roms\2600\*.*"
rd "%cd%\emulators\roms\2600"
)


