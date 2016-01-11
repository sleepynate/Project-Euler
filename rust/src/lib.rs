use std::mem;
use std::collections::LinkedList;
#[allow(unused_imports)]
use std::str::FromStr;

#[allow(dead_code)]
fn fizzbuzz(i: u32) -> u32 {
    (0..i)
        .filter(|&x| x % 3 == 0 || x % 5 == 0)
        .fold(0, |a, b| a + b)
}

#[test]
fn problem1_matches_given() {
    assert_eq!(fizzbuzz(10), 23);
}

#[test]
fn problem1_solves() {
    assert_eq!(fizzbuzz(1000), 233168)
}

struct Fibonacci {
    curr: u32,
    next: u32,
}

impl Iterator for Fibonacci {
    type Item = u32;
    fn next(&mut self) -> Option<u32> {
        let new_next = self.curr + self.next;
        let new_curr = mem::replace(&mut self.next, new_next);
        Some(mem::replace(&mut self.curr, new_curr))
    }
}


#[allow(dead_code)]
fn fibs() -> Fibonacci {
    Fibonacci { curr: 1, next : 2 }
}

#[test]
fn problem2_generates_a_sequence() {
    let actual = fibs().take(10).collect::<Vec<u32>>();
    assert_eq!(actual, [1, 2, 3, 5, 8, 13, 21, 34, 55, 89]);
}

#[test]
fn problem2_solves() {
    let actual = fibs()
                    .filter(|&x| x % 2 == 0)
                    .take_while(|&x| x <= 4000000)
                    .fold(0, |a, b| a + b);
    assert_eq!(actual, 4613732)
}

#[allow(dead_code)]
fn prime_factors(n:u64) -> LinkedList<u64> {
    let helper = |i:u64| -> LinkedList<u64> {
     let mut l = LinkedList::new();
     l.push_front(i);
     l.append(&mut prime_factors(n/i));
     l
    };
    let mut possible_divisors = 2 .. ((n as f64).sqrt() as u64);
    let first_divisor = possible_divisors.find(|&x| n % x == 0);
    let rest_of_factors = first_divisor.map(|i| helper(i));
    let mut this_is_prime = LinkedList::new();
    this_is_prime.push_front(n);
    if rest_of_factors.is_some() {
        rest_of_factors.unwrap()
    } else {
        this_is_prime
    }

}

#[test]
fn problem3_given() {
    assert_eq!(prime_factors(13195).pop_back().unwrap(), 29);
}

#[test]
fn problem3_solves() {
    assert_eq!(prime_factors(600851475143).pop_back().unwrap(), 6857);
}

#[allow(dead_code)]
fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}

#[test]
fn problem4_can_reverse_string() {
    let actual = reverse_string(&String::from_str("abc").unwrap());
    assert_eq!(actual, String::from_str("cba").unwrap());
}

#[allow(dead_code)]
fn is_palindrome(s: &String) -> bool {
    s.eq(&reverse_string(s))
}

#[test]
fn problem4_is_string_palindrome() {
    assert!(is_palindrome(&String::from_str("abba").unwrap()));
}

#[allow(dead_code)]
fn is_number_palindrome(n: u32) -> bool {
    is_palindrome(&n.to_string())
}

#[test]
fn problem4_is_number_palindrom() {
    assert!(!is_number_palindrome(123325));
    assert!(is_number_palindrome(123321))
}

#[allow(dead_code)]
fn biggest_number_with_digits(n: u32) -> u32 {
    (10 as u32).pow(n) - 1
}

#[test]
fn problem4_biggest_number_with_digits() {
    assert_eq!(biggest_number_with_digits(2), 99);
    assert_eq!(biggest_number_with_digits(4), 9999)
}
