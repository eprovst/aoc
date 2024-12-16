using LinearAlgebra

cxmas(r) = length(r)<4 ? 0 : count(r[i:i+3]==['X','M','A','S'] for i in 1:length(r)-3)
crows(m) = sum(cxmas, eachrow(m))
eachdiag(m) = map(k->m[diagind(m, k)], -size(m,1)+1:size(m,1)-1)
cdiags(m) = sum(cxmas, eachdiag(m))

i = stack(Vector{Char}.(readlines("input")); dims=1)
println(sum(crows(rotr90(i,r)) + cdiags(rotr90(i,r)) for r in 0:3))
