value(c) = Int(c) > 70 ? Int(c) - 87 : Int(c) - 64

function result(m, o)
    m = value(m); o = value(o)
    m == o && return 1
    m == 1 && o == 3 && return 2
    m == 2 && o == 1 && return 2
    m == 3 && o == 2 && return 2
    return 0
end


open("input") do i
    tot = 0
    for l in readlines(i)
        o = l[1]; m = l[3]
        tot += value(m)
        tot += 3result(m, o)
    end
    println(tot)
end
