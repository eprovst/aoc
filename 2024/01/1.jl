ll = Int[]
rl = Int[]
for l in readlines("input")
    lc, rc = match(r"(\d+)\s+(\d+)", l).captures
    push!(ll, parse(Int, lc))
    push!(rl, parse(Int, rc))
end

println(sum(abs, sort(ll) .- sort(rl)))
