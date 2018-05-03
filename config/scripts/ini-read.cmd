@echo off


set pathScriptsConfig="%~dp0config\scripts"


for /f "delims=" %%a in ("%inifile% %iniFileCurrent% [%iniSectionCurrent%] %iniItemCurrent%") do %%a>>"%iniReadTempFile%"

call %iniReadTempFile%

:end

