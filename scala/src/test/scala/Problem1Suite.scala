import org.scalatest.FunSuite
import com.sleepynate.euler.Problem1

class Problem1Suite extends FunSuite with Problem1 {
  /*
   * Find the sum of all the multiples of 3 or 5 below 1000.
   */

  var expected = 0
  var target = 3
  test(s"sum of all fizzbuzz numbers below ${target} is ${expected}") {
    assert(problem1(target) == expected)
  }

  expected = 3
  target = 4
  test(s"sum of all fizzbuzz numbers below ${target} is ${expected}") {
    assert(problem1(target) == expected)
  }

  expected = 8
  target = 6
  test(s"sum of all fizzbuzz numbers below ${target} is ${expected}") {
    assert(problem1(target) == expected)
  }

  expected = 233168
  target = 1000
  test(s"sum of all fizzbuzz numbers below ${target} is ${expected}") {
    assert(problem1(target) == expected)
  }

}
