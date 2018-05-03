@ECHO OFF

COLOR A

ECHO -------------------------------------------------------------------------
ECHO ^> ** Creating excludes... **

ECHO .svn>exclude.txt
ECHO .git>>exclude.txt
ECHO Thumbs.db>>exclude.txt
ECHO Desktop.ini>>exclude.txt
ECHO dsstdfx.bin>>exclude.txt
ECHO build.bat>>exclude.txt
ECHO \skin.confluence\media\>>exclude.txt
ECHO \skin.confluence\backgrounds\>>exclude.txt
ECHO exclude.txt>>exclude.txt

ECHO -------------------------------------------------------------------------
ECHO.

ECHO -------------------------------------------------------------------------
ECHO                   ** Creating Textures XBT File... **
ECHO -------------------------------------------------------------------------

ECHO.
PING -n 2 -w 1000 127.0.0.1 > NUL
START /B /WAIT TexturePacker -dupecheck -input media\ -output media\Texture.xbt
PING -n 2 -w 20000 127.0.0.1 > NUL
ECHO.
ECHO.
ECHO -------------------------------------------------------------------------
ECHO ^> Deleting excludes...
DEL exclude.txt
ECHO ^> Done
ECHO -------------------------------------------------------------------------
ECHO.
ECHO.

ECHO -------------------------------------------------------------------------
ECHO        ** XBT build complete - scroll up to check for errors. **
ECHO -------------------------------------------------------------------------

PING -n 50 -w 5000 127.0.0.1 > NUL