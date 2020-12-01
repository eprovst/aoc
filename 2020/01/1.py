inp = open("input.in", 'r')

report = []
for num in inp:
    report.append(int(num))

N = len(report)
for i in range(N):
    for j in range(i, N):
        if report[i] + report[j] == 2020:
            print(report[i] * report[j])
            exit(0)
