@echo off

if [%1]==[] (
	g++ "%cd%\main.cpp" -o "%cd%\main.exe"
	GOTO :EOF
)

:: This section should executed only from the test script
set directory=%~1
g++ "%directory:"=%\main.cpp" -o "%directory:"=%\main.exe"

