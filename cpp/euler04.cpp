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

#include <cstdlib>
#include <string>
#include <cstring>
#include <algorithm>
#include <iostream>
using	namespace std;

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

/* itoa:  convert n to characters in s */
void itoa(int n, char s[]) {
	int i = 0;
	do {       /* generate digits in reverse order */
		s[i++] = n % 10 + '0';   /* get next digit */
	} while ((n /= 10) > 0);     /* delete it */
	s[i] = '\0';
	reverse(s);
} 

bool ispalin(int n) {
	itoa(n,temp);
	string first(temp);
	string second = first;
	reverse(second.begin(), second.end());
	return !first.compare(second);
}

int hix, hiy;
int main(int argc, const char *argv[]) {
	int t;
	for (int x = 111; x < 1000; x++) {
		for (int y = 111; y < 1000; y++) {
			t = x*y;
			if (ispalin(t) && t > highest) {
				highest = t;
				hix = x;
				hiy = y;
			}
		}
	}
	cout << "Highest palindrome was " << highest << endl;
	cout << "High X was " << hix << " and high Y as " << hiy << endl;
	return 0;
}
