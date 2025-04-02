@echo off
chcp 65001 > nul
title Search Script

:menu
cls

echo [!] Which Script Would You Like to Run?
echo [1] Search and Report the Number of Found Files (MORE DETAILED)
echo [2] Search Only and List All Found Files Without Counting (FASTER)
echo [E] Exit
set /p choice="Make your selection (1/2/E): "

if "%choice%"=="1" goto detailed_search
if "%choice%"=="2" goto fast_search
if "%choice%"=="E" exit
goto menu



:: CODE FOR DETAILED SEARCH:

:detailed_search

@echo off
cls

set /p d="Select Disk to Search (C, D, etc.): "
set /p a="Enter the term you want to search for: "

echo Starting search...

:: Find files and print them to the screen while counting.
set count=0
for /f "delims=" %%i in ('dir /s /b %d%:\ ^| findstr /i "%a%"') do (
    echo %%i
    set /a count+=1
)

:: Print the number of files found.
if %count% gtr 0 (
    echo.
    echo ============================
    echo [✓] A total of %count% files found.
    echo ============================
) else (
    echo [X] No files found containing "%a%".
)
pause
goto detailed_search



:: CODE FOR FAST SEARCH:

:fast_search

@echo off
cls

set /p d="Select Disk to Search (C, D, etc.): "
set /p a="Enter the term you want to search for: "

echo Starting search...
dir /s %d%:\ | findstr /s /i "%a%"

if %errorlevel% neq 0 (
    echo No files found containing "%a%".
)

pause
goto fast_search
