ll, rl = map(l -> parse.(Int, split(l)), readlines("input")) |> eachrow ∘ stack
println(sum(abs, sort(ll) .- sort(rl)))
