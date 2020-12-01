inp = open("input", 'r')

ns = set()
for n in inp:
    ns.add(int(n))

for n in ns:
    for k in ns:
        if 2020 - n - k in ns:
            print(n * k * (2020 - n - k))
            exit(0)

exit(1)
