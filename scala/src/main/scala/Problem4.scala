/**
 * Created by sleepynate on 7/6/14.
 */
trait Problem4 {

  implicit def Int2Palindromic(v: Int) = new PalindromicInt(v)
  class PalindromicInt(val of:Int) {
    def isPalindromic: Boolean = {
      of.toString.reverse == of.toString
    }
  }

}
