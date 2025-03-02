#include <iostream>
#include <chrono>
#include <thread>
#include <cstdlib>
// CoSMo_C++
void cl(); void printCosmos();
int main() {
	cl();
	while (true) {
			std::this_thread::sleep_for(std::chrono::milliseconds(70));
			printCosmos();
	} return 0;
}

void printCosmos() {
	for(int i=0;i<11;i++)
	std::cout << "*"
	     << "      "
	     << "      "
	     << "      "
         << "      ";
}
#ifdef __WIN32
void cl() {system("cls");}
#endif
#ifdef __unix
void cl() {system("clear");}
#endif
