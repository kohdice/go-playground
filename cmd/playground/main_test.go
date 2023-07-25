package main

import (
	"reflect"
	"testing"
)

func TestCalc(t *testing.T) {
	tests := []struct {
		name string
		lhs  int
		rhs  int
		want int
	}{
		{name: "Sample test", lhs: 1, rhs: 1, want: 2},
	}

	for _, tc := range tests {
		got := Calc(tc.lhs, tc.rhs)
		if !reflect.DeepEqual(tc.want, got) {
			t.Fatalf("%s: expected: %v, got: %v", tc.name, tc.want, got)
		}
	}
}
