using Base.Iterators
tomap(d) = collect(flatten(repeated(isodd(i) ? i÷2 : nothing, n) for (i, n) in enumerate(d)))
function compact!(m)
    e = length(m)
    while any(isnothing, @view m[1:e])
        isnothing(m[e]) || (m[findfirst(isnothing, m)] = m[e])
        e -= 1
    end
    return m[1:e]
end
checksum(m) = sum((i - 1) * n for (i, n) in enumerate(m))
println(parse.(Int, Char.(read("input"))) |> tomap |> compact! |> checksum)
