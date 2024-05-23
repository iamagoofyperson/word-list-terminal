@echo off
setlocal enabledelayedexpansion

:: Prompt for username
set /p username=Enter Username: 

:: Prompt for password
set /p password=Enter Password: 

:: Check if wordlist.txt exists
if not exist wordlist.txt (
    echo Wordlist file not found!
    pause
    exit /b
)

:main
:: Prompt for a search term
set /p searchterm=Enter a word to search in wordlist: 

:: Initialize found flag
set found=0

:: Search the wordlist
for /f "usebackq tokens=*" %%A in ("wordlist.txt") do (
    if /i "%%A"=="!searchterm!" (
        echo Found: %%A
        set found=1
    )
)

:: If not found
if !found! equ 0 (
    echo No match found for "!searchterm!".
)

:: Ask if the user wants to search again
set /p again=Do you want to search again? (y/n): 
if /i "!again!"=="y" goto main

echo Exiting...
pause
endlocal
exit /b
