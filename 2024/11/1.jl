function blink!(s)
    i = 1
    for i in eachindex(s)
        si = string(s[i])
        ds = length(si)
        if s[i] == 0
            s[i] = 1
        elseif iseven(ds)
            s[i] = parse(Int, si[1:ds÷2])
            push!(s, parse(Int, si[ds÷2+1:end]))
        else
            s[i] *= 2024
        end
        i += 1
    end
    return s
end

Base.:^(f, n) = n==0 ? identity : f ∘ f ^ (n-1)

i = parse.(Int, split(read("input", String)))
println(length((blink!^25)(i)))
