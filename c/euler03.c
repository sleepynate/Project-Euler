/*
 * Project Euler Problem 3
 * Solution by nathan dotz - nathan (period) dotz (at sign) gmail (period) com
 *
 * What is the largest prime factor of the number 600851475143 ?
 */

#include <stdio.h>
#include <math.h>

typedef enum {false, true} bool;

#define MAX 600851475143

unsigned long long big = 600851475143;

int main() {

	unsigned long lastfound = 0;
	int i = 3;
	while ( i < sqrt(MAX) ) {
		while (big % i == 0) {
			lastfound = i;
			big = big/i;
		}
		i=i+2;
	}
	printf("highest prime of %ld is: %ld\n", MAX, lastfound);
	return 0;
}
