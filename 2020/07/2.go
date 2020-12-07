package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

type valueMap map[string]int
type graph map[string]valueMap

func main() {
	file, _ := os.Open("input")
	defer file.Close()

	bags := parseBags(file)
	fmt.Println(numberOfChildren("shiny gold", bags))
}

func numberOfChildren(parent string, bags graph) int {
	sum := 0
	for bag, count := range bags[parent] {
		sum += count * (1 + numberOfChildren(bag, bags))
	}
	return sum
}

func parseBags(input io.Reader) graph {
	scanner := bufio.NewScanner(input)
	scanner.Split(bufio.ScanLines)

	bags := graph{}
	for scanner.Scan() {
		line := strings.Split(strings.TrimSuffix(scanner.Text(), "."), " bags contain ")

		parent := line[0]
		bags[parent] = valueMap{}

		if line[1] != "no other bags" {
			for _, child := range strings.Split(line[1], ", ") {
				child = strings.TrimSuffix(strings.TrimSuffix(child, "s"), " bag")
				spec := strings.SplitN(child, " ", 2)
				count, _ := strconv.Atoi(spec[0])
				child = spec[1]
				bags[parent][child] = count
			}
		}
	}
	return bags
}
