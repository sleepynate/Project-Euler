import org.scalatest.FunSuite
import com.sleepynate.euler.Problem1

class Problem1Suite extends FunSuite with Problem1 {
  /*
   * Find the sum of all the multiples of 3 or 5 below 1000.
   */

  test(s"sum of all fizzbuzz numbers below 3 is 0") {
    assert(problem1(3) == 0)
  }

  test(s"sum of all fizzbuzz numbers below 4 is 3") {
    assert(problem1(4) == 3)
  }

  test(s"sum of all fizzbuzz numbers below 6 is 8") {
    assert(problem1(6) == 8)
  }

  test(s"sum of all fizzbuzz numbers below 1000 is 233168") {
    assert(problem1(1000) == 233168)
  }

}
