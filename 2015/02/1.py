s = 0
for p in open("input"):
    l, w, h = map(int, p.split('x'))
    s1, s2, s3 = l*w, w*h, h*l
    s += 2*s1 + 2*s2 + 2*s3 + min(s1, s2, s3)
print(s)
