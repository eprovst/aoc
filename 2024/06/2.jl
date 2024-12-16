function loops(m, p0)
    h = Set{Tuple{Tuple{Int, Int}, Tuple{Int, Int}}}()
    d = (-1, 0)
    p = p0
    while true
        n = p .+ d
        checkbounds(Bool, m, n...) || return false
        while m[n...]
            d = (d[2], -d[1])
            n = p .+ d
        end
        (p, n) ∈ h && return true
        push!(h, (p, n))
        p = n
    end
end

setindex(m, x, i...) = setindex!(copy(m), x, i...)
i = stack(Vector{Char}.(readlines("input")); dims=1)
m = i.=='#'
p0 = Tuple(findfirst(==('^'), i))
println(count(loops(setindex(m, true, i...), p0) for i ∈ eachindex(m) if !m[i]))
