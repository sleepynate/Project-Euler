package euler001

func fizzbuzz(upto int) int {
	var sum = 0
	for i := 0; i < upto; i++ {
		if i % 3 == 0 || i % 5 == 0 {
			sum += i
		}
	}
	return sum
}