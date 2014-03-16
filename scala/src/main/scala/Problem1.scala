package com.sleepynate.euler

trait Problem1 {
  def problem1(x:Int) = (for(y <- 1 until x; if (y % 3 == 0 || y % 5 == 0)) yield y).sum
}
