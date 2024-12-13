rs = map(l -> parse.(Int, split(l)), readlines("input"))
issafe(r) = (issorted(r) || issorted(r, rev=true)) &&
            minimum(abs, diff(r)) >= 1 &&
            maximum(abs, diff(r)) <= 3
println(count(issafe, rs))
