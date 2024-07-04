@echo off
setlocal enabledelayedexpansion

REM Check if a directory path was provided as an argument
if "%~1"=="" (
    set "directory=%cd%"
) else (
    set "directory=%~1"
)

REM Navigate to the specified directory
cd /d "%directory%"

REM Redirect output to list.txt and overwrite if it exists
(
    REM List files with their sizes
    for /f "tokens=1,* delims=" %%A in ('dir /b /a-d') do (
        set "filename=%%A"
        set "filesize=%%~zA"
        echo !filename! - !filesize! bytes
    )
) > list.txt
endlocal
