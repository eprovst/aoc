m = list(map(lambda l: list(map(int, l.strip().split('\t'))),
             open("input").readlines()))
s = 0
for r in m:
    for a in r:
        for b in r:
            if a > b and a % b == 0:
                s += a // b
print(s)
