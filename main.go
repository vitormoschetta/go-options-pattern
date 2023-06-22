package main

import "fmt"

type Person struct {
	name string
	age  int
}

func main() {
	person := new(Person)
	fmt.Println(&person)
}
