// Project Euler -- Problem #3
// Solution by nathan dotz aka sleepynate
// nathan (period) dotz (at sign) gmail (period) com
//
// What is the largest prime factor of the number 600851475143?

#include <iostream>
using namespace std;

unsigned long long int MAX = 600851475143ULL;
int primes[10000000] = {};
int primeCounter = 0;

int lastfound = 0;

int gen_primes(int current) {
	bool divisible = false;
	do {
		current++;
		for ( int iterator_index = 0; iterator_index <= primeCounter ; iterator_index++ ) {
			// cout << "checking " << current << " % " << primes[iterator_index]
			//	<< " = " << current % primes[iterator_index] << endl;
			if( current % primes[iterator_index] == 0 ) {
				divisible = true;
				break;
			} else {
				divisible = false;
			}
		}
		
	} while ( (current < MAX) && ( divisible == true ) );
	return current;
}

int main() {
	// Set up some primes to start with
	if(MAX%2 == 0) lastfound = 2;
	if(MAX%3 == 0) lastfound = 3;
	primes[0] = 2; primes[1] = 3; primeCounter = 1;
	do {
		int temp = gen_primes( primes[primeCounter] );
		if (temp == MAX)
			break;
		if ( (MAX % temp) == 0 ) {
			lastfound = temp;
			cout << "found prime: " << lastfound << endl;
		}
		primes[++primeCounter] = temp;
	} while ( primes[primeCounter] < MAX);
	cout << "highest prime is: " << lastfound << endl;
	cin.get();
	return 0;
}
