pad = [[0,  0,   1,   0,  0],
       [0,  2,   3,   4,  0],
       [5,  6,   7,   8,  9],
       [0, 'A', 'B', 'C', 0],
       [0,  0,  'D',  0,  0]]
clamp = lambda n: max(0, min(n, 4))

r, c = 3, 0
for i in open("input"):
    for m in i:
        ro, co = r, c
        match m:
            case 'U':
                r = clamp(r - 1)
            case 'D':
                r = clamp(r + 1)
            case 'R':
                c = clamp(c + 1)
            case 'L':
                c = clamp(c - 1)
        if pad[r][c] == 0:
            r, c = ro, co
    print(pad[r][c], end='')
print()
