// Project Euler -- Problem #7
// Solution by nathan dotz aka sleepynate
// nathan (period) dotz (at sign) gmail (period) com
//
// What is the 10001st prime number?

#include <iostream>
using namespace std;

int primes[10001] = {};
int primeCounter = 0;

int gen_primes(int current) {
  bool divisible = false;
  do {
    current++;
    for ( int iterator_index = 0; iterator_index <= primeCounter ; iterator_index++ ) {
      if( current % primes[iterator_index] == 0 ) {
        divisible = true;
        break;
      } else {
        divisible = false;
      }
    }
  } while ( divisible == true );
  return current;
}

int main() {
  primes[primeCounter] = 2;
  int temp = 0;
  while (primeCounter < 10001) {
    temp = gen_primes( primes[primeCounter] );
    primes[++primeCounter] = temp;
    cout << primes[primeCounter] << " @ primes[" << primeCounter
      << "]" << endl;
  }
  cout << primes[primeCounter] << endl;
  return 0;
}
