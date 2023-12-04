l = 0
for (i, c) in enumerate(open("input").read()):
    if c == '(':
        l += 1
    elif c == ')':
        l -= 1
print(l)
