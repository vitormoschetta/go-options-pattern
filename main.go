package main

import (
	"embed"
	_ "embed"
	"fmt"
)

//go:embed sqlfiles/*
var sqlFiles embed.FS

func main() {
	fmt.Println(sqlFiles)
}
