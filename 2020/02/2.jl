function is_valid_line(line)
   m = match(r"(\d+)-(\d+) (.): (.+)", line)
   a = parse(Int32, m[1])
   b = parse(Int32, m[2])
   c = m[3][1]
   pass = m[4]

   return (pass[a] == c) ⊻ (pass[b] == c)
end

open("input") do f
    map(is_valid_line, readlines(f)) |> sum |> println
end
