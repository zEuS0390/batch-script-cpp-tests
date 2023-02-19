@echo OFF

:: Check if there is a given argument
:: otherwise, end the script
if [%1]==[] GOTO :EOF

:: Declare global variables
set directory=%1

:: Check if the directory exist
:: otherwise, end the script
if not exist %directory% (
	echo File/Directory does not exist!
	GOTO :EOF
)

GOTO :MAIN

:: This is where the test happens
:EXECUTE_TEST
if %directory% == addition CALL %directory%\test.bat
if %directory% == loop CALL %directory%\test.bat
if %directory% == triangle CALL %directory%\test.bat
EXIT /B 0

:: This is the main function
:MAIN
g++ compare_output.cpp -o compare_output.exe
CALL :EXECUTE_TEST
pause
EXIT /B 0
