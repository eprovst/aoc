s = 0
for p in open("input"):
    l, w, h = map(int, p.split('x'))
    d = [l, w, h]
    a = min(d)
    d.remove(a)
    b = min(d)
    s += 2*(a+b) + l*w*h
print(s)
