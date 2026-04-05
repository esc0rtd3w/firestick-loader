@echo off

python --version>NUL
if %errorlevel%==0 goto start

cls
echo Python Not Found!
echo.
echo Install Python and Retry...
echo.
pause>NUL
goto end

:start
cd kamakiri
python handshake2.py FACTORYM
cd ..

echo.
pause

:end
