rs, ps = split(read("input", String), "\n\n") |>
           i -> (Set(map(r -> parse.(Int, split(r,'|')), split(i[1]))),
                 map(p -> parse.(Int, split(p,',')), split(i[2])))
lt(a,b) = a==b || [a,b] ∈ rs
println(sum(issorted(p; lt) * p[ceil(Int, length(p)/2)] for p ∈ ps))
