@echo off
title Catspins PC Kit

:set_language
cls
echo Catspins PC Kit
echo Please select a language:
echo 1. English-EN
echo 2. Spanish-ES
echo 3. Swedish-SV
set /p lang_selection=Enter language selection (1-3):

if "%lang_selection%"=="1" (
    set "language=English-EN"
) else if "%lang_selection%"=="2" (
    set "language=Spanish-ES"
) else if "%lang_selection%"=="3" (
    set "language=Swedish-SV"
) else (
    echo Invalid language selection!
    pause
    goto :set_language
)

:check_agreement
cls
echo Catspins PC Kit (%language%)
echo Do you agree to proceed? (Y/N):
set /p agree=

if /i "%agree%"=="Y" (
    goto :menu
) else if /i "%agree%"=="N" (
    exit
 else (
)    echo Invalid input! Please enter Y or N.
    pause
    goto :check_agreement
)

:menu
cls
echo Catspins PC Kit (%language%)
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
del /q "%TEMP%\*.*"
echo Temporary files cleaned successfully.
pause
exit

:clear_recycle_bin
echo Clearing recycle bin...
echo **********************************
echo Y|Del /F /S /Q "%systemdrive%\$Recycle.bin\*.*"
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
