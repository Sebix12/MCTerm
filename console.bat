@echo off
::config
set termfsurl=https://github.com/Sebix12/MCTerm/raw/main/svcbin.zip
set deflocint=%~dp0
if exist plugins goto :pluginok
if not exist plugins goto :pluginskip

:pluginok
cd plugins
echo cd plugins > %deflocint%plgload.bat
dir /b >> %deflocint%plgload.bat
echo dir.. >> %deflocint%plgload.bat
cd %deflocint%
:pluginskip
goto :terminal
goto :error
exit

:error
echo egy hiba tortent a szerverrrel! probald meg debugolni!
pause > NUL
exit

:createconfig
echo No config detected creating!
set /p serverfilename=svcfilename$
set /p versionn=version$
set /p cusservername=servername$
set /p ram=ram(MB)$
echo set ram=%ram% >> config.bat
echo set serverfilename=%serverfilename% >> config.bat
echo set version=%version% >> config.bat
echo set cusservername=%cusservername% >> config.bat
echo connfig created!
timeout /t 2 > NUL
echo conntiuning!
goto :terminal
goto :error
exit

:importconfig
call config.bat
echo config loaded!
goto :terminal
goto :error
exit

:doconfig
if exist config.bat goto :importconfig
if not exist config.bat goto :createconfig
goto :terminal
goto :error
exit

:terminal
set /p terminp=">"
goto :commands
goto :error
exit

:termfsch
if exist svcbin echo svcbin. OK.
if not exist svcbin goto :downloadsvcbin
if not exist vars mkdir vars | echo vars didnt exist creating one!
echo checked vars. OK
if not exist plugins mkdir plugins | echo plugins didnt exist creating one!
echo checked plugins. OK
if not exist server mkdir server | echo server didnt exist creating one!
echo checked server. OK
goto :terminal
:conttermfscha
echo extracting!
timeout /t 2 /nobreak > NUL
start /wait tar -xf temp.zip
timeout /t 3 /nobreak > NUL
echo done!
echo deleting temp file!
del temp.zip
echo done fscheck!
goto :terminal
goto :error
exit

:downloadsvcbin
echo downloading...
start /wait powershell -Command "(New-Object Net.WebClient).DownloadFile('%termfsurl%', 'temp.zip')"
echo downloaded!
goto :conttermfscha
goto :error
exit

:updatestart
cd svcbin
start update.bat
exit

:commands
if "%terminp%"=="config load" goto :importconfig
if "%terminp%"=="config check" goto :doconfig
if "%terminp%"=="terminal checkfs" goto :termfsch
if "%terminp%"=="terminal update" goto :updatestart
if "%terminp%"=="help" type help.db
if exist svcbin start tsvc.bat %terminp%
goto :terminal