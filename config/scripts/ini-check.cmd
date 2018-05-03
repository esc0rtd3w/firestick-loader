@echo off


set pathScriptsConfig="%~dp0config\scripts"


for /f "delims=" %%a in ('dir /a-d /b "%pathScriptsConfig%"') do echo "%pathScriptsConfig%\%%~na.ini"


:end

