# Automating Simple C++ Tests with Batch Script
A Windows-based testing batch script that tests simple C++ programs, typically useful for learners. 
You may wonder why I did this instead of using testing frameworks. Well, the main reason is that I want
to test a bunch of small C++ programs that simply compare the outputs to the given expected outputs. I have been
searching for a solution to this problem, but didn't find any. So, then I decided to create this and do the work
for me.

## How to use it?
Make sure you have an installed compiler, specifically the MinGW, because it is defined in the script. 
All you have to do is to open the command-prompt and navigate to the main directory, then type this command:
```
test.bat <folder_name>
```
Inside the specified folder, there should be a subfolder called `tests`. 
This folder also contains subfolders of test cases. 
Each test case folder contains two text files: `expected_output.txt` and `inputs.txt`. 
Keep in mind that the main C++ source file is also contained in the specified folder, along with the `compile.bat` script. 
This batch script is different from the main directory as it handles the compilation of the source file/s.

You can copy one of the given examples and create your own. Here's the structure:
```
batch-script-cpp-tests.
│   .gitignore
│   compare_output.cpp
│   README.md
│   test.bat
│   
├───addition
│   │   compile.bat
│   │   main.cpp
│   │   
│   └───tests
│       ├───test_case_1
│       │       expected_output.txt
│       │       inputs.txt
│       │       
│       └───test_case_2
│               expected_output.txt
│               inputs.txt
│               
├───loop
│   │   compile.bat
│   │   main.cpp
│   │   
│   └───tests
│       └───test_case_1
│               expected_output.txt
│               inputs.txt
│               
└───triangle
    │   compile.bat
    │   main.cpp
    │   
    └───tests
        └───test_case_1
                expected_output.txt
                inputs.txt
```
