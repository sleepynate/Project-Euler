// Project Euler -- Problem #6
// Solution by nathan dotz aka sleepynate
// nathan (period) dotz (at sign) gmail (period) com
//
// Find the difference between the sum of the squares of the first one
// hundred natural numbers and the square of the sum.

#include <iostream>
using namespace std;

int working_set[100] = {};

bool Fill_working_set() {
  int i = 0;
  while (i<100)
    working_set[i] = ++i;
  return true;
}

int main() {
  if (Fill_working_set())
    cout << "Sample array filled" << endl;
    // find sum of squares
    int i = 0;
    unsigned long int SUM_OF_SQUARES = 0;
    while (i<100) {
      SUM_OF_SQUARES += (working_set[i] * working_set[i]);
      i++;
    }
    cout << SUM_OF_SQUARES << " is the sum of the squares 1..100" << endl;
    // find the square of the sum
    i = 0;
    unsigned long int SQUARE_OF_SUM = 0;
    while (i<100) {
      SQUARE_OF_SUM += working_set[i];
      i++;
    }
    SQUARE_OF_SUM *= SQUARE_OF_SUM;
    cout << SQUARE_OF_SUM << " is the square of the sum" << endl;
    cout << SQUARE_OF_SUM - SUM_OF_SQUARES << " is the difference" << endl;
  return 0;
}
