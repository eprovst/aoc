function reachable9s(p, m)
    h = zeros(Bool, size(m))
    m[p...] == 9 && return setindex!(h, true, p...)
    reduce((m, n) -> m .|| n, reachable9s(p.+d, m) for d in zip([-1:1;0],[0;-1:1])
           if (get(m, p.+d, -999) - m[p...]) == 1; init=h)
end
m = stack(map(l->parse.(Int, Vector{Char}(l)), readlines("input")); dims=1)
println(sum(count(reachable9s(Tuple(i), m)) for i in findall(==(0), m)))
