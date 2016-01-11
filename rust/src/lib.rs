use std::mem;
use std::collections::LinkedList;
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
