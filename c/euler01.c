/*
 * Project Euler Problem 1
 *
 * If we list all the natural numbers below 10 that are multiples of 3 or 5
 * we get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 *
 * solution by nathan dotz
 * nathan (period) dotz (at sign) gmail (period) com
 */

#include <stdio.h>

int main() {
	int total = 0;
	int cur = 0;
	for (; cur < 1000; cur++)
		if ( (cur % 3 == 0) || (cur % 5 == 0) ) total += cur;

	printf("The sum of all integers below 1000 that are "
			"divisible by 3 or 5 is %d\n", total);

	return 0;
}
