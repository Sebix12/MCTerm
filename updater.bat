@echo off
title MCTerm FS installer
::-----------------------
set ghconsole=https://raw.githubusercontent.com/Sebix12/MCTerm/main/console.bat
set ghhelp=https://raw.githubusercontent.com/Sebix12/MCTerm/main/help.db
set ghtsvc=https://raw.githubusercontent.com/Sebix12/MCTerm/main/tsvc.bat
title install script : %ghconsole%, %ghhelp%, %ghtsvc%
if exist console.bat del console.bat
if exist help.db del help.db
if exist tsvc.bat del tsvc.bat
timeout /t 3 /nobreak > NUL
echo --------------------
start /wait curl --output console.bat --ssl-no-revoke "%ghconsole%"
echo downloaded console
start /wait curl --output help.db --ssl-no-revoke "%ghhelp%"
echo downloaded help database
start /wait curl --output tsvc.bat --ssl-no-revoke "%ghtsvc%"
echo downloaded termsvc
echo update complete!
timeout /t 5
exit