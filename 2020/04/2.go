package main

import (
	"fmt"
	"io/ioutil"
	"strconv"
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
		pair := strings.Split(pair, ":")
		key := pair[0]
		value := pair[1]

		keys[key] = true

		switch key {
		case "byr":
			year, err := strconv.Atoi(value)
			if !(len(value) == 4 && err == nil && 1920 <= year && year <= 2002) {
				return false
			}
		case "iyr":
			year, err := strconv.Atoi(value)
			if !(len(value) == 4 && err == nil && 2010 <= year && year <= 2020) {
				return false
			}
		case "eyr":
			year, err := strconv.Atoi(value)
			if !(len(value) == 4 && err == nil && 2020 <= year && year <= 2030) {
				return false
			}
		case "hgt":
			if len(value) < 3 {
				return false
			}
			unit := value[len(value)-2 : len(value)]
			value, err := strconv.Atoi(value[0 : len(value)-2])
			if unit == "cm" {
				if !(err == nil && 150 <= value && value <= 193) {
					return false
				}
			} else if unit == "in" {
				if !(err == nil && 59 <= value && value <= 76) {
					return false
				}
			} else {
				return false
			}
		case "hcl":
			if !(len(value) == 7 && value[0] == '#') {
				return false
			}
			_, err := strconv.ParseInt(value[1:7], 16, 25)
			if !(err == nil) {
				return false
			}
		case "ecl":
			if !(value == "amb" || value == "blu" || value == "brn" ||
				value == "gry" || value == "grn" || value == "hzl" ||
				value == "oth") {
				return false
			}
		case "pid":
			if !(len(value) == 9) {
				return false
			}
			_, err := strconv.Atoi(value)
			if err != nil {
				return false
			}
		case "cid":
			// Always accept
		}
	}

	return keys["byr"] && keys["iyr"] && keys["eyr"] && keys["hgt"] &&
		keys["hcl"] && keys["ecl"] && keys["pid"] // optional: && keys["cid"]
}
