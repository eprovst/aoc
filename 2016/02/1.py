pad = [[1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]]
clamp = lambda n: max(0, min(n, 2))

r, c = 1, 1
for i in open("input"):
    for m in i:
        match m:
            case 'U':
                r = clamp(r - 1)
            case 'D':
                r = clamp(r + 1)
            case 'R':
                c = clamp(c + 1)
            case 'L':
                c = clamp(c - 1)
    print(pad[r][c], end='')
print()
