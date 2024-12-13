ll, rl = map(l -> parse.(Int, split(l)), readlines("input")) |> eachrow ∘ stack
println(sum(c * count(==(c), rl) for c in ll))
