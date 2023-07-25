package main

import "fmt"

func Calc(x, y int) int {
	return x + y
}

func main() {
	fmt.Println("Hello World")
	fmt.Println(Calc(1, 1))
}
