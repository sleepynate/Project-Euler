/*
 * Project Euler - Problem 5
 *
 * 2520 is the smallest number that can be divided by 
 * each of the numbers from 1 to 10 without any remainder.
 * What is the smallest number that is evenly divisible
 * by all of the numbers from 1 to 20?
 *
 * solution by nathan dotz
 * nathan (period) dotz (at sign) gmail (period) com
 */

#include <stdio.h>
typedef enum {false,true} bool;

int main() {
	unsigned int cur = 20;
	bool found = 1;
	for ( ; found != 0 ; cur+=20) {
		found = 0;
		int div = 2;
		for ( ; div < 21 ; div++) 
			if (cur % div != 0) {
				found = 1;
				break;
			}
		if (!found) break;
	}
	printf("checking %d\n" , cur);
	int bob = 1;
	for ( ;  bob < 21 ; bob++) {
		printf("%d %% %d = %d\n", cur, bob, cur % bob);
	}
	printf("%d is the smallest number evenly divisible by"
		" all the numbers from one to twenty", cur);
	return 0;
}

