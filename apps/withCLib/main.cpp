#include <iostream>
#include "c_thing.h"

int main ()
{
	std::cout << "Hello, world!\n";
	std::cout << "test: " << 6 << "\n";
	std::cout << "return: " << thing_init() << "\n";
	return 0;
}