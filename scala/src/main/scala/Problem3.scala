package com.sleepynate.euler

import scala.collection.immutable.Range.Inclusive

trait Problem3 {

  implicit def Long2PrimeFactorsInt(v: Long) = new PrimeFactorsInt(v)
  class PrimeFactorsInt(val of:Long) {
    def primeFactors: List[Long] = {
      val possibleDivisors = 2 to math.sqrt(of).toInt
      val firstDivisor = possibleDivisors.find(of % _ == 0)
      val andTheRestOfThePrimeFactors = firstDivisor.map(i => i.toLong :: (of / i).primeFactors)
      val thisIsPrime = List(of)
      andTheRestOfThePrimeFactors.getOrElse(thisIsPrime)
    }
  }

}
