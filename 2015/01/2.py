l = 0
for (i, c) in enumerate(open("input").read()):
    if c == '(':
        l += 1
    elif c == ')':
        l -= 1
    if l < 0:
        print(i + 1)
        break
