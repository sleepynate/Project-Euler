use std::collections::LinkedList;

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

