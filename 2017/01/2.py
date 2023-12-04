l = open("input").read().strip()
N = len(l)
s = 0
for i in range(N):
    if l[i] == l[(i + N//2) % N]:
        s += int(l[i])
print(s)
