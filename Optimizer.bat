@echo off
REM Title: PC Optimizer
REM Rest of the script...

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
echo 5. Install Programsecho
 6. Exit
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
    :install_menu
    cls
    echo ================================
    echo Program Installation Menu
    echo ================================
    echo.
    echo 1. OBS Studio
    echo 2. 7-Zip
    echo 3. Back to Main Menu
    echo.

    set /p install_choice="Enter your choice (1-3): "

    if "%install_choice%"=="1" (
        echo Installing OBS Studio...
        mkdir C:\Pc_toolkit_catspin_installers
        powershell.exe -Command "Start-BitsTransfer -Source https://cdn-fastly.obsproject.com/downloads/OBS-Studio-27.0.1-Full-Installer-x64.exe -Destination C:\Pc_toolkit_catspin_installers\obs_installer.exe"
        if exist C:\Pc_toolkit_catspin_installers\obs_installer.exe (
            start "" C:\Pc_toolkit_catspin_installers\obs_installer.exe /S
            echo OBS Studio installed successfully.
        ) else (
            echo OBS Studio installer not found in the specified folder.
        )
        pause
        goto install_menu
    )

    if "%install_choice%"=="2" (
        echo Installing 7-Zip...
        mkdir C:\Pc_toolkit_catspin_installers
        powershell.exe -Command "Start-BitsTransfer -Source https://www.7-zip.org/a/7z1900-x64.exe -Destination C:\Pc_toolkit_catspin_installers\7zip_installer.exe"
        start "" C:\Pc_toolkit_catspin_installers\7zip_installer.exe /S
        echo 7-Zip installed successfully.
        pause
        goto install_menu
    )

    if "%install_choice%"=="3" (
        goto menu
    )

    echo Invalid choice. Please try again.
    pause
    goto install_menu
)

if "%choice%"=="6" (
    echo Exiting PC Optimizer...
    exit
)

echo Invalid choice. Please try again.
pause
goto menu
