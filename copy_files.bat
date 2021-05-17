@echo off
setlocal
pushd %~dp0

@REM set LIST=list_bar.csv
set LIST=list_foo.csv
set SRC_DIR=%~dp0test\src
set DST_DIR=%~dp0test\dst

call :FUNC_COPY_SELECTFILES "%SRC_DIR%" "%DST_DIR%" %LIST%

popd
endlocal & exit /b %ERRORLEVEL%


@REM ------------------
@REM FUNC_COPY_SELECTFILES %1 %2 %3
@REM %3で指定したCSVファイルに従って%1から%2へファイルをコピーする
@REM 
@REM %1: src directory (path)
@REM %2: dst directory (path)
@REM %3: file list (csv)
@REM   ex) %3
@REM    foo.txt or foo.txt: copy to foo.txt
@REM    bar.txt,bar001.txt: copy to bar001.txt
@REM    :comment out
@REM ------------------
:FUNC_COPY_SELECTFILES
setlocal EnableDelayedExpansion
FOR /f "delims=, tokens=1-2 eol=:" %%A IN (%~3) DO (
    IF NOT "%%A"=="" set _SRC=%~1\%%A
    IF NOT "%%B"=="" (
        set _DST=%~2\%%B
    ) ELSE set _DST=%~2\%%A

    echo src: !_SRC!
    echo dst: !_DST!
    echo.

    copy /y "!_SRC!" "!_DST!"
)
endlocal
exit /b %ERRORLEVEL%
