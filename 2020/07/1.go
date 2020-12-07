package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
)

type set map[string]bool
type graph map[string]set

func main() {
	file, _ := os.Open("input")
	defer file.Close()

	bags := parseBags(file)
	possibilities := 0
	for bag := range bags {
		if canContain(bag, "shiny gold", bags) {
			possibilities++
		}
	}

	fmt.Println(possibilities)
}

func canContain(parent string, child string, bags graph) bool {
	for bag := range bags[parent] {
		if bag == child || canContain(bag, child, bags) {
			return true
		}
	}
	return false
}

func parseBags(input io.Reader) graph {
	scanner := bufio.NewScanner(input)
	scanner.Split(bufio.ScanLines)

	bags := graph{}
	for scanner.Scan() {
		line := strings.Split(strings.TrimSuffix(scanner.Text(), "."), " bags contain ")

		parent := line[0]
		bags[parent] = set{}

		if line[1] != "no other bags" {
			for _, child := range strings.Split(line[1], ", ") {
				child = strings.TrimSuffix(strings.TrimSuffix(child, "s"), " bag")
				child = strings.SplitN(child, " ", 2)[1]
				bags[parent][child] = true
			}
		}
	}
	return bags
}
