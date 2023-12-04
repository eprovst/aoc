ds = [int(d) for d in open("input")]
fs = {0}
f = 0
while True:
    for d in ds:
        f = f + int(d)
        if f in fs:
            print(f)
            exit(0)
        fs.add(f)
