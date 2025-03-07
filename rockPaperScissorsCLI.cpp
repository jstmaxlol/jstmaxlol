#include <iostream>
#include <cstdlib>
// scuffed rock/paper/scissors cli game
int convertUserMoveToInt(char& user);
char returnRoundResult(int& user, int& cpu);
void clearScreen();
int main() {
    clearScreen();
    std::cout << "welcome to RockPaperScissorsCLI\n\n";
    
    int userScore = 0, cpuScore = 0;
    while (true) {
        char userMove;
        std::cout << "[ rpsCLI / scoreboard ]\n"
                  << "[ user="<<userScore<<" cpu="<<cpuScore<<" ]\n\n"
                  << "[ choose your move ]\n"
                  << "[ (R)ock ]\n[ (P)aper ]\n[ (S)cissors ]\n[ (Q)uit ]\n\n:: ";
        std::cin >> userMove;
        if (userMove == 'Q' || userMove == 'q') return 0;
        int userMoveCorr = convertUserMoveToInt(userMove);

        int cpuMove = 1 + (rand() % 3);
        
        char round = returnRoundResult(userMoveCorr, cpuMove);
        
        clearScreen();
        if (round == 'w') {
            ++userScore;
            std::cout << "[ user won! ]\n\n";
        } else if (round == 'l') {
            ++cpuScore;
            std::cout << "[ cpu won! ]\n\n";
        } else if (round == 'd') {
            std::cout << "[ it's a draw! ]\n\n";
        }
    }
}
int convertUserMoveToInt(char& user) {
    if (user == 'R' || user == 'r') return 1;
    if (user == 'P' || user == 'p') return 2;
    if (user == 'S' || user == 's') return 3;
    else return -1;
}
char returnRoundResult(int& user, int& cpu) {
    if (user == cpu) return 'd';
    
    if (user == 1 && cpu == 2) return 'l';
    if (user == 1 && cpu == 3) return 'w';
    
    if (user == 2 && cpu == 1) return 'w';
    if (user == 2 && cpu == 3) return 'l';

    if (user == 3 && cpu == 1) return 'l';
    if (user == 3 && cpu == 2) return 'w';

    else return 'E';
}
#ifdef __WIN32
void clearScreen() {system("cls");}
#endif
#ifdef __unix
void clearScreen() {system("clear");}
#endif
