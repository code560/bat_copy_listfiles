@echo off
setlocal
pushd %~dp0

@REM set BK_DIR=%~dp0test\src_bk
set SRC_DIR=%~dp0test\src
set DST_DIR=%~dp0test\dst

@REM xcopy /E /I /Q /Y %BK_DIR% %SRC_DIR%
del /F /S /Q %DST_DIR%\*

popd
endlocal & exit /b %ERRORLEVEL%
