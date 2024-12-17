function tomap(d)
    m = Vector{Union{Nothing, Int}}()
    for (i, n) in enumerate(d)
        isodd(i) && append!(m, repeat([i÷2], n))
        iseven(i) && append!(m, repeat([nothing], n))
    end
    return m
end
function compact(m)
    m = @view m[:]
    while any(isnothing, m)
        isnothing(m[end]) || (m[findfirst(isnothing, m)] = m[end])
        m = @view m[1:end-1]
    end
    return m
end
checksum(m) = sum((i - 1) * n for (i, n) in enumerate(m))
println(parse.(UInt, Char.(read("input"))) |> tomap |> compact |> checksum)
