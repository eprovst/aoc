using Base.Iterators
tomap(d) = collect(flatten(repeated(isodd(i) ? i÷2 : nothing, n) for (i, n) in enumerate(d)))
function compact!(m)
    maxid = maximum(i -> isnothing(i) ? 0 : i, m)
    for i in maxid:-1:1
        s, e = findfirst(==(i), m), findlast(==(i), m)
        for p = 1:2s-e
            if all(isnothing, m[p:p+e-s])
                m[s:e] .= nothing
                m[p:p+e-s] .= i
                break
            end
        end
    end
    return m
end
checksum(m) = sum(isnothing(n) ? 0 : (i - 1) * n for (i, n) in enumerate(m))
println(parse.(Int, Char.(read("input"))) |> tomap |> compact! |> checksum)
