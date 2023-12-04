Ps = [(0, 0)]
O = (1, 0)
for i in open("input").read().split(", "):
    if i[0] == 'L':
        O = (O[1], -O[0])
    elif i[0] == 'R':
        O = (-O[1], O[0])
    for _ in range(int(i[1:])):
        P = (Ps[-1][0] + O[0],
             Ps[-1][1] + O[1])
        if P in Ps:
            print(abs(P[0]) + abs(P[1]))
            exit(0)
        Ps.append(P)
