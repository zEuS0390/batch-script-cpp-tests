#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <iterator>
#include <algorithm>

// Function to count the number of lines from a given file
unsigned int count_number_of_lines(std::ifstream &file) {

	std::string line;
	unsigned int count = 0;

	while (std::getline(file, line)) {
		count++;
	}

	file.clear();
	file.seekg(0, std::ios::beg);

	return count;
}

int main (int argc, char **argv) {

	// Declare variables
	std::string output(argv[1]), expected(argv[2]);
	std::ifstream file1(output), file2(expected);
	std::string line1, line2;
	int count_file1 = 0, count_file2 = 0;
	bool result = false;

	// The program requires to two command-line arguments
	if (argc != 3) {
		std::cout << "compare_output.exe: requires 2 inputs (output, expected)" << std::endl;
		return -1;
	}

	// Check if the first file is opened or not 
	if (!file1.is_open()) {
		std::cout << "test.exe: Can't open " << output << std::endl;
		return -1;
	}

	// Check if the second file is opened or not 
	if (!file2.is_open()) {
		std::cout << "test.exe: Can't open " << expected << std::endl;
		return -1;
	}

	// Count the number of lines of the files
	count_file1 = count_number_of_lines(file1);
	count_file2 = count_number_of_lines(file2);

	if (count_file1 == count_file2) {
		while (std::getline(file1, line1) && std::getline(file2, line2)) {
			if (line1 == line2) { result = true; } 
			else { result = false; break; }
		}
	}

	std::cout << ((result == 1)? "SUCCESS":"FAILED");

	return 0;
}

