package main

import (
	"fmt"
	"os"
)

func main() {
	if err := run(); err != nil {
		println("ERROR", err.Error())
		os.Exit(1)
	}
}

func run() error {
	if len(os.Args) != 2 {
		return fmt.Errorf("usage: FILE")
	}

	b, err := os.ReadFile(os.Args[1])
	if err != nil {
		return fmt.Errorf("read file: %w", err)
	}
	println(string(b))
	return nil
}
