import org.scalatest.{FunSuite, Matchers}

class Problem4Suite extends FunSuite with Matchers with Problem4 {
  /*
   * A palindromic number reads the same both ways. The largest palindrome made
   * from the product of two 2-digit numbers is 9009 = 91 × 99.
   * Find the largest palindrome made from the product of two 3-digit numbers.
   */

  test("121 is a palindrome") {
    121.isPalindromic should be(true)
  }

  test("1221 is a palindrome") {
    1221.isPalindromic should be(true)
  }

  test("12321 is a palindrome") {
    12321.isPalindromic should be(true)
  }

  test("find largest palindromic number") {
    val n = (for ( x <- (999 to 100 by -1)
                ; y <- (999 to 100 by -1)
                ; if (x*y).isPalindromic)
                yield x*y).toList
    n.max should be(906609)
  }
}
