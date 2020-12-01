inp = open("input", 'r')

ns = set()
for n in inp:
    ns.add(int(n))

for n in ns:
    if 2020 - n in ns:
        print(n * (2020 - n))
        exit(0)

exit(1)
