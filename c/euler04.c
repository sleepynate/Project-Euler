/*
 * Project Euler - Problem 4
 * Find the largest palindrome made from the
 * product of two 3-digit numbers.
 *
 * solution by nathan dotz
 * nathan (period) dotz (at sign) gmail (period) com
 *
 * itoa and reverse borrowed from k&r.
 */

#include <stdio.h>
#include <string.h>

typedef enum {false,true} bool;

char temp[7];
unsigned long	highest = 0;

/* reverse:  reverse string s in place */
void reverse(char s[]) {
	int i, j;
	char c;
	for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
		c = s[i];
		s[i] = s[j];
		s[j] = c;
	}
}


/* itoa: convert n to characters in s */
void itoa(int n, char s[]) {
	int i = 0;
	do {       
		s[i++] = n % 10 + '0';
	} while ((n /= 10) > 0);
	s[i] = '\0';
	reverse(s);
} 

bool ispalin(int n) {
	itoa(n,temp);
	char first[7];
	char second[7];
	strcpy(first, temp);
	strcpy(second, first);
	reverse(second);
	return !strcmp(first,second);
}

int hix, hiy;
int main(int argc, const char *argv[]) {
	int t;
	int x = 111;
	for (; x < 1000; x++) {
		int y = 111;
		for (; y < 1000; y++) {
			t = x*y;
			if (ispalin(t) && t > highest) {
				highest = t;
				hix = x;
				hiy = y;
			}
		}
	}
	printf("Highest palindrome was %ld\n",  highest);
	printf("High X was %d and high Y was %d\n",hix, hiy );
	return 0;
}
