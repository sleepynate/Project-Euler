use std::mem;

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

