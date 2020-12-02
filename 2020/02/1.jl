function is_valid_line(line)
   m = match(r"(\d+)-(\d+) (.): (.+)", line)
   min = parse(Int32, m[1])
   max = parse(Int32, m[2])
   c = m[3]
   pass = m[4]

   return min <= sum(split(pass, "") .== c) <= max
end

open("input") do f
    map(is_valid_line, readlines(f)) |> sum |> println
end
