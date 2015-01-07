#![feature(associated_types)]

use std::mem;

#[allow(dead_code)]
fn fizzbuzz(i: i32) -> i32 {
    range(0, i)
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
    curr: uint,
    next: uint,
}

impl Iterator for Fibonacci {
    type Item = uint;
    fn next(&mut self) -> Option<uint> {
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
    let actual = fibs().take(10).collect::<Vec<uint>>();
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
