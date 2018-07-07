@echo off

if {%1}=={} (
    call :help
    exit /b
)
if {%1}=={-h} (
    call :help
    exit /b
)
if not {%1}=={-c} (
    call :install %1
    echo.
    echo=====
    echo.
)
call :cleanup %2 %3
exit /b

:install
where openmpt123 1>nul 2>&1 && if exist openmpt-mpg123.dll goto :play
echo Downloading unzipper and .IT music player...
wget https://lib.openmpt.org/files/libopenmpt/bin/libopenmpt-0.3.10+release.bin.win.zip -O openmpt123.zip >nul 2>&1 || exit /b
wget ftp://ftp.info-zip.org/pub/infozip/win32/unz600xn.exe -O unzinst.exe >nul 2>&1 || exit /b
echo Extracting unzipper and .IT music player...
unzinst.exe -o unzip.exe >nul 2>&1 || exit /b
unzip -o openmpt123.zip openmpt123/x86_64/openmpt123.exe openmpt123/x86_64/openmpt-mpg123.dll >nul 2>&1 || exit /b
move openmpt123\x86_64\* . >nul 2>&1 || exit /b
rmdir /s /q openmpt123 >nul 2>&1 || exit /b

:play
echo Downloading music from '%1'...
wget %1 -O temp.it >nul 2>&1 || exit /b
echo.
echo Playing!
echo.
openmpt123 --no-restart temp.it
exit /b

:cleanup
echo Cleaning up downloaded files...
if not {%1}=={-k} ( del /f /q temp.it >nul 2>nul ) else (
    if not "%~2"=="" (
        if exist "%~2.it" (
            setlocal EnableDelayedExpansion
            set /p "overwrite=%~2.it already exists, overwrite? (y/n): "
            if "!overwrite!"=="y" (
                del "%~2.it"
                ren temp.it "%~2.it"
            )
            if "!overwrite!"=="Y" ( 
                del "%~2.it"
                ren temp.it "%~2.it"
            )
            endlocal
        ) else ( ren temp.it "%~2.it" )
    )
)
del /f /q openmpt123.zip >nul 2>nul
rem del /f /q openmpt123.exe >nul 2>nul
rem del /f /q openmpt-mpg123.dll >nul 2>nul
del /f /q unzinst.exe >nul 2>nul
del /f /q unzip.exe >nul 2>nul
echo Done!
exit /b

:help
echo WIPS: Windows Impulse Player Script
echo.
echo    by Gustavo6046
echo.
echo ===============
echo.
echo wips -c [-k]
echo   Cleans up the folder. If -k is supplied, the .IT music
echo   file isn't deleted.
echo.
echo wips -h
echo   Shows this message.
echo.
echo wips <link> [-k <new music file's title>]
echo   Plays an online Impulse Tracker module. -k allows to
echo   keep the music file. Give it a name to rename it from
echo   the temporary file's initial name.
echo.
echo.
echo   To stop, press Ctrl-C.
echo.
echo v2018.07.07.7
echo            (c)2018 Gustavo R. Rehermann. The MIT License.
exit /b