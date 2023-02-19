#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

int main (int argc, char **argv) {
	if (argc != 3) {
		std::cout << "compare_output.exe: requires 2 inputs (output, expected)" << std::endl;
		return -1;
	}
	std::string output(argv[1]);
	std::string expected(argv[2]);
	std::ifstream file1(output);
	std::ifstream file2(expected);
	std::string line1, line2;
	bool result = false;
	if (!file1.is_open()) {
		std::cout << "test.exe: Can't open " << output << std::endl;
		return -1;
	}
	if (!file2.is_open()) {
		std::cout << "test.exe: Can't open " << expected << std::endl;
	}
	while (std::getline(file1, line1) && std::getline(file2, line2)) {
		if (line1 == line2) {
			result = true;
		} else {
			result = false;
			break;
		}
	}
	if (result == 1) {
		std::cout << "SUCCESS";
	} else {
		std::cout << "FAILED";
	}
	return 0;
}
