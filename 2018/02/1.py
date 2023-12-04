tw = 0
th = 0
for d in open("input"):
    itw = ith = False
    for c in d:
        ct = sum([h == c for h in d])
        itw = itw or ct == 2
        ith = ith or ct == 3
    tw += itw
    th += ith
print(tw * th)
