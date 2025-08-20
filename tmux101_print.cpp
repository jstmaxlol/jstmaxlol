#include <iostream>
#include <escape.ansi>

int main() {
	std::cout
	<< "[ "<<red<<"TMUX 101 - Terminal MUltipleXer 101 "<<def<<"]\n"

	<< "[ "<<red<<"Basics "<<def<<"]\n"
	<< "> ^b   		   -> Enter command mode ("<<yellow<<"ESC in VIM talk"<<def<<")\n"
	<< "[ "<<red<<"Sessions "<<def<<"]\n"
	<< "> ^b^c 		   -> Open a new sesh\n"
	<< "> ^b^& 		   -> Exit focused sesh (Same as 'exit' command)\n"
	<< "[ "<<red<<"Layout control "<<def<<"]\n"
	<< "> ^b^n           -> Goes to next window\n"
	<< "> ^b^p           -> Goes to previous window\n"
	<< "> ^b^%           -> Horizontal split\n"
	<< "> ^b^' / ^b^("<<yellow<<"S"<<def<<"') -> Vertical split  \n"
	<< "> ^b("<<yellow<<"*ArrowKey"<<def<<")  -> Switch between panes\n"
	; return 0;
}
