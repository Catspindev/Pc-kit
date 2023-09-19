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
echo 5. Exit
echo.
set /p choice="Enter your choice (1-5): "

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
    echo Exiting PC Optimizer...
    exit
)

echo Invalid choice. Please try again.
pause
goto menu
