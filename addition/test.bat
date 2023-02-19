@echo OFF

:: Declare global variables
set name="addition"
set directory="%cd%\%name:"=%"
set tests_directory="%directory:"=%\tests"
set test_file="%cd%\compare_output.exe"
set exe_file="%directory:"=%\main.exe"
set output_file="%directory:"=%\output.txt"
set /A case_number=0

:: Check if the directory exist
:: otherwise, end the script
if not exist %directory% (
	echo %name% does not exist!
	GOTO :EOF
)

GOTO :MAIN

:EXECUTE_TESTS
	setlocal ENABLEDELAYEDEXPANSION
	for /D %%i in ("%tests_directory:"=%\*") do (
		set /A case_number=!case_number!+1
		(echo|set /p="Test Case !case_number!: ")
		%exe_file% < %%i\inputs.txt > %output_file%
		%test_file% %output_file% "%%i\expected_output.txt"
		echo.
	)
	endlocal
EXIT /B 0

:MAIN
	echo Test Program: %directory%
	echo --------------------
	CALL :EXECUTE_TESTS
EXIT /B 1
