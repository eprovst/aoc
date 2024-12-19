area(m) = count(m)
lvedges(m) = sum(count(1 .== diff([false; c == 1 ? m[:,c] : map(!, m[:,c-1]) .& m[:,c]])) for c in 1:size(m, 2))
edges(m) = lvedges(m) + lvedges(rotl90(m)) + lvedges(rot180(m)) + lvedges(rotr90(m))
function floodfill!(m, i, p)
    m[p...] = true
    for d in zip([0;-1:1], [-1:1;0])
        !get(m, p.+d, true) && get(i, p.+d, '\0') == i[p...] && floodfill!(m, i, p.+d)
    end
    return m
end
floodfill(i, p) = floodfill!(zeros(Bool, size(i)), i, p)

i = stack(Vector{Char}.(readlines("input")); dims=1)
println(sum(area(m) * edges(m)
            for m in unique(floodfill(i, (r,c))
                            for r in 1:size(i, 1), c in 1:size(i, 2))))
