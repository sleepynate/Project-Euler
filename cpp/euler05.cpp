// Project Euler #5
//
// 2520 is the smallest number that can be divided by 
// each of the numbers from 1 to 10 without any remainder.
// What is the smallest number that is evenly divisible
// by all of the numbers from 1 to 20?

#include <iostream>
using namespace std;

int main() {
	unsigned int cur;
	bool found = 1;
	for ( cur = 20 ; found != 0 ; cur+=20) {
		found = 0;
		for ( int div = 2 ; div < 21 ; div++) {
			if (cur % div != 0) {
				found = 1;
				// cout << cur << " does not pass" << endl;
				break;
			}
		}
	}
	cout << "checking " << cur << endl;
        for ( int bob = 1 ;  bob < 21 ; bob++) {
		cout << cur << " % " << bob << " = " << cur % bob << endl;
	}
	cout << cur << " is the smallest number evenly divisible by"
		<< " all the numbers from one to twenty" << endl;
	return 0;
}
