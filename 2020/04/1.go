package main

import (
	"fmt"
	"io/ioutil"
	"strings"
)

func main() {
	data, _ := ioutil.ReadFile("input")
	passports := strings.Split(string(data), "\n\n")

	validPassports := 0
	for _, passport := range passports {
		if isValidPassport(passport) {
			validPassports++
		}
	}
	fmt.Println(validPassports)
}

func isValidPassport(passport string) bool {
	pairs := strings.Fields(passport)
	keys := map[string]bool{}

	for _, pair := range pairs {
		key := strings.Split(pair, ":")[0]
		keys[key] = true
	}

	return keys["byr"] && keys["iyr"] && keys["eyr"] && keys["hgt"] &&
		keys["hcl"] && keys["ecl"] && keys["pid"] // optional: && keys["cid"]
}
