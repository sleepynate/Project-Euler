#[allow(dead_code)]
fn fizzbuzz(i: i32) -> i32 {
    range(0, i)
        .filter(|&x| x % 3 == 0 || x % 5 == 0)
        .fold(0, |a, b| a + b)
}


#[test]
fn problem1() {
    assert_eq!(fizzbuzz(10), 23);
    assert_eq!(fizzbuzz(1000), 233168)
}
