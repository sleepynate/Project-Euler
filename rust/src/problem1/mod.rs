pub(crate) fn fizzbuzz(i: u32) -> u32 {
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

