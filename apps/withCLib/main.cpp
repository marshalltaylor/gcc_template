#include <iostream>
#include <iomanip> 
#include "c_thing.h"

using namespace std;

int main ()
{
	printf("Hello butt\n");
	cout << "Hello, world!\n";
	cout << "test: " << 6 << "\n";
	
	// This won't print as return is uint8_t, which is cast as char
	cout << "straight call: " << thing_init() << "\n";
	
	// Similarly, this will print !
	cout << "Example (uint8_t)0x21: " << (uint8_t)0x21 << "\n";
	
	cout << "cast call: " << (uint32_t)thing_init() << "\n";
	cout << "+ call: " << +thing_init() << "\n";
	cout << "Damn this is weird\n";
	
	cout << endl;
	
	int i;
	cout << "Please enter an integer value: ";
	cin >> i;
	cout << "The value you entered is " << i;
	cout << " and its double is " << i*2 << ".\n";
	
	return 0;
}