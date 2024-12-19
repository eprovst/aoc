area(m) = count(m)
edges(m, i) = m[i...] * count(!get(m, i.+d, false) for d in zip([-1:1;0],[0;-1:1]))
perim(m) = sum(edges(m, (r,c)) for r in 1:size(m, 1), c in 1:size(m, 2))
function floodfill!(m, i, p)
    m[p...] = true
    for d in zip([0;-1:1], [-1:1;0])
        !get(m, p.+d, true) && get(i, p.+d, '\0') == i[p...] && floodfill!(m, i, p.+d)
    end
    return m
end
floodfill(i, p) = floodfill!(zeros(Bool, size(i)), i, p)

i = stack(Vector{Char}.(readlines("input")); dims=1)
println(sum(area(m) * perim(m)
            for m in unique(floodfill(i, (r,c))
                            for r in 1:size(i, 1), c in 1:size(i, 2))))
