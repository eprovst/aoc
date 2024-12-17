function count_nodes(m)
    ns = zeros(Bool, size(m))
    as = Dict{Char, Vector{Tuple{Int, Int}}}()
    for i in findall(≠('.'), m)
        as = mergewith(vcat, as, Dict(m[i] => [Tuple(i)]))
    end
    for vs in values(as)
        for v in vs, w in vs
           x = 2 .* v .- w
           v ≠ w && checkbounds(Bool, ns, x...) && (ns[x...] = true)
        end
    end
    count(ns)
end

println(count_nodes(stack(Vector{Char}.(readlines("input")); dims=1)))
