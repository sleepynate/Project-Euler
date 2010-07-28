// Project Euler -- Problem #2
// Solution by nathan dotz aka sleepynate
// nathan (period) dotz (at sign) gmail (period) com

#include <iostream>
using namespace std;

int main() {
  int termA = 1;
  int termB = 2;
  int nextTerm;
  int total = 0;
  while(termA <=4000000) {
    if(termA % 2 == 0){
      total += termA;
    }
    nextTerm = termA + termB;
    termA = termB;
    termB = nextTerm;
  }
  cout << total << endl;
  return 0;s
}
