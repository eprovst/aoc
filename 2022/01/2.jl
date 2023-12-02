open("input") do i
    cals = Int[]
    acc = 0
    for line in readlines(i)
        if line == ""
            push!(cals, acc)
            acc = 0
        else
            acc += parse(Int, line)
        end
    end

    println(sum(sort(cals)[end-2:end]))
end
