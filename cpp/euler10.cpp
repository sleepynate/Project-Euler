// Project Euler
//
// Problem 10
// 08 February 2002
// 
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
// 
// Find the sum of all the primes below two million.

#include <iostream>
using namespace std;

int MAX = 2000000;              // Limit for the top prime.

int primes[10000000];          // Set up a holder for the primes
int primeCounter;               // Set a counter to keep track of them
int currentPrime;               // And a reference variable with our
                                // current highest prime.

int gen_primes(int);            // declarations

int main() {
  primes[0] = 2;                // Start with the first non-one prime
  primeCounter = 0;             // count that first prime
  currentPrime = primes[0];     // and set the highest one
	int temp = 0;
  while(temp<MAX) {                         // build the prime array
    // cout << "Passing: "  << currentPrime << endl;
    temp = gen_primes( currentPrime );
    // cout << temp << ' ';
    primes[primeCounter] = currentPrime = temp;
    primeCounter++;
  }
  cout << gen_primes(2);
  for(int j = 0; j <= primeCounter; j++) {
    cout << primes[j] << ' ';
  }
  return 0;
}

/*
 * 
 * name: gen_primes
 *
 * @param: int current - start at this number
 * @return: int - the next (hopefully prime) number that is not indexed
 * in primes[].
 */

int gen_primes(int current) {
  bool divisible = false;
  do {
    current++;
      for(int iterator_index=0; iterator_index<primeCounter; iterator_index++) {
        // cout << "testing " << current << endl;
        if(current % primes[iterator_index] == 0) {
          divisible = true;
          // cout << current << " is divisible";
          break;
        } else {
          divisible = false;
        }
      }
  } while ( (current < MAX) && ( divisible == true ) );
  // cout << "returning: " << current << endl;
  return current;
}
