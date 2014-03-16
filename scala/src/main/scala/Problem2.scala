package com.sleepynate.euler

trait Problem2 {

  val fibs:Stream[Int] = 1 #:: fibs.scanLeft(2)(_+_)

  def fibsUpTo(x:Int) = fibs.takeWhile(_ <= x)

  def evenFibs(x:Int) = fibsUpTo(x).filter(_ % 2 == 0)

  def sumOfEvenFibs(x:Int) = evenFibs(x).toList.sum
}
