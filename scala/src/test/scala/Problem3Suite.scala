import com.sleepynate.euler.Problem3
import org.scalatest.{FunSuite, Matchers}

class Problem3Suite extends FunSuite with Matchers with Problem3 {
  /*
   * The prime factors of 13195 are 5, 7, 13 and 29.
   * What is the largest prime factor of the number 600851475143 ?
   */

  test("largest prime factor of 3 is 3") {
    3.primeFactors.lastOption should be(Some(3))
  }

  test("largest prime factor of 15 is 5") {
    15.primeFactors.lastOption should be(Some(5))
  }

  test("largest prime factor of 13195 is 29") {
    13195.primeFactors.lastOption should be(Some(29))
  }

  test("largest prime factor of 600851475143 is 6857") {
    600851475143L.primeFactors.lastOption should be(Some(6857))
  }
}
