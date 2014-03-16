import com.sleepynate.euler.Problem2
import org.scalatest.FunSuite

class Problem2Suite extends FunSuite with Problem2 {
  /*
   * By considering the terms in the Fibonacci sequence whose values do not
   * exceed four million, find the sum of the even-valued terms.
   */

  test("Sum of even fibonacci number up to 2 should be 2") {
    assert(sumOfEvenFibs(2) == 2)
  }

  test("Sum of even fibonacci number up to 5 should be 2") {
    assert(sumOfEvenFibs(5) == 2)
  }

  test("Sum of even fibonacci number up to 100 should be 2") {
    assert(sumOfEvenFibs(100) == 44)
  }

  test("Sum of even fibonacci number up to 4000000 should be 4613732") {
    assert(sumOfEvenFibs(4000000) == 4613732)
  }
}
