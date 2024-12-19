mem = Dict{Tuple{Int, Int}, Int}()
function countaftern(s, n)
    get!(mem, (s, n)) do
        n == 0 && return 1
        s == 0 && return countaftern(1, n-1)
        st = string(s)
        ds = length(st)
        iseven(ds) && return countaftern(parse(Int, st[1:ds÷2]), n-1) +
                             countaftern(parse(Int, st[ds÷2+1:end]), n-1)
        return countaftern(2024 * s, n-1)
    end
end

i = parse.(Int, split(read("input", String)))
println(sum(countaftern.(i, 75)))
