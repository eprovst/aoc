function anyop(t, ns)
    length(ns) == 1 && return only(ns) == t
    return anyop(t - ns[end], ns[1:end-1]) ||
           (t % ns[end] == 0 && anyop(t ÷ ns[end], ns[1:end-1]))
end

i = map(fs -> (parse(Int, fs[1]), parse.(Int, split(fs[2]))),
        split.(readlines("input"), ':'))
println(sum(fs -> anyop(fs[1], fs[2]) * fs[1], i))
