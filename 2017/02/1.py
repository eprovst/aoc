s = list(map(lambda l: list(map(int, l.strip().split('\t'))),
             open("input").readlines()))
print(sum([max(r) - min(r) for r in s]))
