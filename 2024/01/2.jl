ll = Int[]
rl = Int[]
for l in readlines("input")
    lc, rc = match(r"(\d+)\s+(\d+)", l).captures
    push!(ll, parse(Int, lc))
    push!(rl, parse(Int, rc))
end

println(sum(c * count(==(c), rl) for c in ll))
