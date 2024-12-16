function hits(m, p0)
    h = zero(m)
    d = [-1, 0]
    h[p0...] = true
    p = [p0...]
    while true
        n = p + d
        checkbounds(Bool, m, n...) || break
        while m[n...]
            d = [0 1; -1 0] * d
            n = p + d
        end
        h[n...] = true
        p = n
    end
    count(h)
end

i = stack(Vector{Char}.(readlines("input")); dims=1)
println(hits(i.=='#', Tuple(findfirst(==('^'), i))))
