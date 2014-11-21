@echo off

SET NEWLINE=^& echo.

FIND /C /I "fischer.dev" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^192.168.56.101 fischer.dev www.fischer.dev>>%WINDIR%\System32\drivers\etc\hosts
