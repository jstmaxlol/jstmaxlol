#include <iostream>
#include <termios.h>
#include <unistd.h>
#include <escape.ansi>

char getch() {
    struct termios oldt, newt;
    char ch;
    tcgetattr(STDIN_FILENO, &oldt); // Get the current terminal settings
    newt = oldt;                     // Copy the settings
    newt.c_lflag &= ~(ICANON | ECHO); // Disable canonical mode and echo
    tcsetattr(STDIN_FILENO, TCSANOW, &newt); // Set the new settings
    ch = getchar();                  // Read a character
    tcsetattr(STDIN_FILENO, TCSANOW, &oldt); // Restore the old settings
    return ch;
}

int main() {
    std::cout << "Press " << red << "any key" << def << " to see its ASCII keycode. | Press " << red << "ESC" << def << " to exit." << std::endl;

    while (true) {
        char ch = getch(); // Get a character from the user

        // Check for ESC key to exit
        if (ch == 27) { // ASCII code for ESC
        	std::cout << "ESC = 27\n" << red << "Quitting ..\n" << def;
			break;
        }
		
		if (ch == 32) {
			std::cout << "SPACEBAR = " << static_cast<int>(ch) << std::endl;
		} else if (ch == 9) {
			std::cout << "TAB = " << static_cast<int>(ch) << std::endl;
		} else if (ch == 127) {
			std::cout << "BACKSPACE = " << static_cast<int>(ch) << std::endl;
		} else if (ch == 10) {
			std::cout << "ENTER = " << static_cast<int>(ch) << std::endl;
		} else {
			// Output pressed key
       		std::cout << ch << " = " << static_cast<int>(ch) << std::endl;
		}
    }

    return 0;
}

