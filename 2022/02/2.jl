value(c) = Int(c) - 64
goal(c) = Int(c) - 88

function pick(o, g)
    o = value(o); g = goal(g)
    g == 1 && return o
    if g == 0
        o == 1 && return 3
        o == 2 && return 1
        o == 3 && return 2
    else
        o == 1 && return 2
        o == 2 && return 3
        o == 3 && return 1
    end
end

open("input") do i
    tot = 0
    for l in readlines(i)
        o = l[1]; g = l[3]
        tot += 3*goal(g)
        tot += pick(o, g)
    end
    println(tot)
end
