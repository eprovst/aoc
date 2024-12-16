ismas(r) = r == ['M', 'A', 'S']
isxmas(m) = (ismas(m[[1,5,9]]) || ismas(m[[9,5,1]])) &&
            (ismas(m[[3,5,7]]) || ismas(m[[7,5,3]]))
i = stack(Vector{Char}.(readlines("input")); dims=1)
println(count(isxmas(i[r:r+2,c:c+2]) for r∈1:size(i,1)-2, c∈1:size(i,2)-2))
