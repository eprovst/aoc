rs = map(l -> parse.(Int, split(l)), readlines("input"))
issafe(r) = (issorted(r) || issorted(r, rev=true)) &&
            minimum(abs, diff(r)) >= 1 &&
            maximum(abs, diff(r)) <= 3
deleteat(c, args...) = deleteat!(copy(c), args...)
ispdsafe(r) = issafe(r) ||
              any(issafe(deleteat(r, i)) for i in eachindex(r))
println(count(ispdsafe, rs))
