function (@main)(_)
    re = r"do\(\)|don't\(\)|mul\((\d{1,3}),(\d{1,3})\)"
    active = true
    total = 0
    for m in eachmatch(re, read("input", String))
        if m.match[1] == 'd'
            active = m.match == "do()"
        else
            total += active * parse(Int, m[1]) * parse(Int, m[2])
        end
    end
    println(total)
end
