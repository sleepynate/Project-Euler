// Project Euler -- Problem #1
// Solution by nathan dotz aka sleepynate
// nathan (period) dotz (at sign) gmail (period) com

#include <iostream>
using namespace std;

int main() {
  int total = 0;
  for (int current = 0; current < 1000; current++) {
    if ( (current % 3 == 0) || (current % 5 == 0) ) {
      total += current;
      cout << total << " ";
    }
  }
  cout << endl << "Final total : " << total << endl;
  return 0;
}
