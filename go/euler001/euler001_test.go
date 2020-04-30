package euler001

import "testing"

func Test_fizzbuzz(t *testing.T) {
	type args struct {
		upto int
	}

	tests := []struct {
		name string
		args args
		want int
	}{
		{"up to 1",args{upto: 1},
			0},
		{"up to 3",
			args{upto: 3},
			0},
		{"up to 5",
			args{upto: 5},
			3},
		{"up to 6",
			args{upto: 6},
			8},
		{"up to 10",
			args{upto: 10},
			23},
		{"up to 1000",
			args{upto: 1000},
		233168},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := fizzbuzz(tt.args.upto); got != tt.want {
				t.Errorf("fizzbuzz() = %v, want %v", got, tt.want)
			}
		})
	}
}
