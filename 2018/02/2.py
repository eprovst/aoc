ds = list(map(lambda l: l.strip(), open("input").readlines()))
for d1 in ds:
    for d2 in ds:
        if sum([c1 != c2 for (c1, c2) in zip(d1, d2)]) == 1:
            print(''.join([c1 if c1 == c2 else '' for (c1, c2) in zip(d1, d2)]))
            exit(0)
