open("input") do i
    max = 0
    acc = 0
    for line in readlines(i)
        if line == ""
            acc > max && (max = acc)
            acc = 0
        else
            acc += parse(Int, line)
        end
    end

    println(max)
end
