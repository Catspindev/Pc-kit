batch
@echo off
title PC Optimizer

:menu
cls
echo PC Optimizer
echo 1. Clean temporary files
echo 2. Clear recycle bin
echo 3. Uninstall unused programs
echo 4. Defragment hard drive
echo 5. Exit

set /p choice=Enter your choice (1-5): 

if "%choice%"=="1" (
    call :clean_temp_files
    goto menu
) else if "%choice%"=="2" (
    call :clear_recycle_bin
    goto menu
) else if "%choice%"=="3" (
    call :uninstall_unused_programs
    goto menu
) else if "%choice%"=="4" (
    call :defragment_hard_drive
    goto menu
) else if "%choice%"=="5" (
    exit
) else (
    echo Invalid choice!
    pause
    goto menu
)

:clean_temp_files
echo Cleaning temporary files...
echo **********************************
del /q %TEMP%\*.*
echo Temporary files cleaned successfully.
pause
exit

:clear_recycle_bin
echo Clearing recycle bin...
echo **********************************
echo Y|Del %systemdrive%\$Recycle.bin\*.*
echo Recycle bin cleared successfully.
pause
exit

:uninstall_unused_programs
echo Uninstalling unused programs...
echo **********************************
wmic product get name,identifyingNumber > "%TEMP%\installed_programs.txt"
for /f "skip=1 tokens=*" %%A in ('type "%TEMP%\installed_programs.txt"') do (
    echo Uninstalling %%A...
    msiexec /x %%A /qn
)
del "%TEMP%\installed_programs.txt"
echo Unused programs uninstalled successfully.
pause
exit

:defragment_hard_drive
echo Defragmenting hard drive...
echo **********************************
defrag /c /h /u /v
echo Hard drive defragmented successfully.
pause
exit
```

This batch script presents a menu with options to perform different PC optimization tasks. You can customize each option based on your requirements. When a user chooses an option, the corresponding label is called, and the task is executed. After completion, the script returns to the menu. The script can be terminated by selecting option 5.

To add more options or modify existing ones, you can adjust the menu and add additional labels with their respective tasks.
add befor runing a promt u have to agree with

Sure! Here's the updated version of the PC optimizer batch script with an agreement prompt:

```batch
@echo off
title PC Optimizer

setlocal enabledelayedexpansion

:check_language
cls
echo PC Optimizer
echo Language: English-EN
echo.
set /p agree=Do you agree to proceed? (Y/N): 

if /i "%agree%"=="Y" (
    goto :menu
) else (
    echo You must agree to proceed.
    pause
    goto :check_language
)

:menu
cls
echo PC Optimizer
echo 1. Clean temporary files
echo 2. Clear recycle bin
echo 3. Uninstall unused programs
echo 4. Defragment hard drive
echo 5. Exit

set /p choice=Enter your choice (1-5): 

if "%choice%"=="1" (
    call :clean_temp_files
    goto :menu
) else if "%choice%"=="2" (
    call :clear_recycle_bin
    goto :menu
) else if "%choice%"=="3" (
    call :uninstall_unused_programs
    goto :menu
) else if "%choice%"=="4" (
    call :defragment_hard_drive
    goto :menu
) else if "%choice%"=="5" (
    exit
) else (
    echo Invalid choice!
    pause
    goto :menu
)

:clean_temp_files
echo Cleaning temporary files...
echo **********************************
del /q %TEMP%\*.*
echo Temporary files cleaned successfully.
pause
exit

:clear_recycle_bin
echo Clearing recycle bin...
echo **********************************
echo Y|Del %systemdrive%\$Recycle.bin\*.*
echo Recycle bin cleared successfully.
pause
exit

:uninstall_unused_programs
echo Uninstalling unused programs...
echo **********************************
wmic product get name,identifyingNumber > "%TEMP%\installed_programs.txt"
for /f "skip=1 tokens=*" %%A in ('type "%TEMP%\installed_programs.txt"') do (
    echo Uninstalling %%A...
    msiexec /x %%A /qn
)
del "%TEMP%\installed_programs.txt"
echo Unused programs uninstalled successfully.
pause
exit

:defragment_hard_drive
echo Defragmenting hard drive...
echo **********************************
defrag /c /h /u /v
echo Hard drive defragmented successfully.
pause
exit
