counttrails(p, m) = m[p...] == 9 ? 1 :
    sum(counttrails(p.+d, m) for d in zip([-1:1;0],[0;-1:1])
        if (get(m, p.+d, -999) - m[p...]) == 1; init=0)
m = stack(map(l->parse.(Int, Vector{Char}(l)), readlines("input")); dims=1)
println(sum(counttrails(Tuple(i), m) for i in findall(==(0), m)))
