@echo off
cd svcbin
if "%1"=="server start config" call startsvcconf.bat
if "%1"=="server start" call startsvc.bat
if "%1"=="plugin load" call plgload.bat