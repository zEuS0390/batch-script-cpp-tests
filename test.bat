@echo OFF

:: Check if there is a given argument
:: otherwise, end the script
if [%1]==[] (
	echo test.bat: requires 1 input ^(directory^)
	GOTO :EOF
)

GOTO :MAIN

:: This is where the test happens
:EXECUTE_TEST
	:: Declare variables
	set directory="%cd%\%~1"
	set tests_directory="%directory:"=%\tests"
	set test_file="%cd%\compare_output.exe"
	set source_file="%directory:"=%\main.cpp"
	set exe_file="%directory:"=%\main.exe"
	set compile_file="%directory:"=%\compile.bat"
	set output_file="%directory:"=%\output.txt"
	set /A case_number=0

	:: Check if the directory exist
	:: otherwise, end the script
	if not exist %directory% (
		echo %directory% does not exist!
		EXIT /B 0
	)

	echo Test Program: %directory%
	echo --------------------
	setlocal ENABLEDELAYEDEXPANSION
	for /D %%i in ("%tests_directory:"=%\*") do (
		set /A case_number=!case_number!+1
		(echo|set /p="Test Case !case_number!: ")
		CALL %compile_file% %directory%
		if exist %exe_file% (
			%exe_file% < %%i\inputs.txt > %output_file%
			%test_file% %output_file% "%%i\expected_output.txt"
			echo.
		)
	)
	endlocal

	EXIT /B 0

:: This is the main function
:MAIN
	:: Compile the testing tool
	g++ compare_output.cpp -o compare_output.exe

	:: Execute the test to the specified C++ program
	CALL :EXECUTE_TEST %1

	EXIT /B 0
