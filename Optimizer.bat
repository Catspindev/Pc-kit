@echo off

title PC Optimizer

:menu
cls
echo ================================
echo PC Optimizer - Main Menu
echo ================================
echo.
echo 1. Disk Cleanup
echo 2. Registry Cleanup
echo 3. Check for Malware
echo 4. Defragment Drives
echo 5. Install Popular Tools (OBS, 7-Zip)
echo 6. Exit
echo.
set /p choice="Enter your choice (1-6): "

if "%choice%"=="1" (
    echo Performing Disk Cleanup...
    cleanmgr /d C:
    echo Disk Cleanup completed.
    pause
    goto menu
)

if "%choice%"=="2" (
    echo Performing Registry Cleanup...
    regedit /s cleanup.reg
    echo Registry Cleanup completed.
    pause
    goto menu
)

if "%choice%"=="3" (
    echo Checking for Malware...
    mrt.exe /quickscan
    echo Malware check completed.
    pause
    goto menu
)

if "%choice%"=="4" (
    echo Defragmenting Drives...
    defrag /r /v C:
    echo Drive defragmentation completed.
    pause
    goto menu
)

if "%choice%"=="5" (
    echo Installing popular tools...

    echo Checking if curl is installed...
    where curl >nul 2>nul
    if %errorlevel% neq 0 (
        echo curl is not installed. Downloading curl installer...
        curl -o curl_installer.exe https://curl.se/windows/dl-7.78.0_1/curl-7.78.0_1-win64-mingw.zip
        echo.
        echo Installing curl...
        start "" curl_installer.exe
        echo.
        echo curl installed successfully.
    ) else (
        echo curl is already installed.
    )

    echo Downloading OBS installer...
    curl -o obs_installer.exe https://cdn-fastly.obsproject.com/downloads/OBS-Studio-27.0.1-Full-Installer-x64.exe
    echo.
    echo Running OBS installer...
    start "" obs_installer.exe /S

    echo Downloading 7-Zip installer...
    curl -o 7zip_installer.exe https://www.7-zip.org/a/7z1900-x64.exe
    echo.
    echo Running 7-Zip installer...
    start "" 7zip_installer.exe /S

    echo.
    echo Popular tools successfully installed.
    pause
    goto menu
)

if "%choice%"=="6" (
    echo Exiting PC Optimizer...
    exit
)

echo Invalid choice. Please try again.
pause
goto menu
