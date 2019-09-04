use std::str::FromStr;

fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}

#[test]
fn problem4_can_reverse_string() {
    let actual = reverse_string(&String::from_str("abc").unwrap());
    assert_eq!(actual, String::from_str("cba").unwrap());
}


fn is_palindrome(s: &String) -> bool {
    s.eq(&reverse_string(s))
}

#[test]
fn problem4_is_string_palindrome() {
    assert!(is_palindrome(&String::from_str("abba").unwrap()));
}


fn is_number_palindrome(n: u32) -> bool {
    is_palindrome(&n.to_string())
}

#[test]
fn problem4_is_number_palindrome() {
    assert!(!is_number_palindrome(123325));
    assert!(is_number_palindrome(123321))
}

fn biggest_number_with_digits(n: u32) -> u32 {
    (10 as u32).pow(n) - 1
}

#[test]
fn problem4_biggest_number_with_digits() {
    assert_eq!(biggest_number_with_digits(2), 99);
    assert_eq!(biggest_number_with_digits(4), 9999)
}
