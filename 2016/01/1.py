P = (0, 0)
O = (1, 0)
for i in open("input").read().split(", "):
    if i[0] == 'L':
        O = (O[1], -O[0])
    elif i[0] == 'R':
        O = (-O[1], O[0])
    P = (P[0] + int(i[1:]) * O[0],
         P[1] + int(i[1:]) * O[1])
print(abs(P[0]) + abs(P[1]))
