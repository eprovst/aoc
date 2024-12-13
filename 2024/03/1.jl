println(sum(map(m -> parse(Int, m[1]) * parse(Int, m[2]), eachmatch(r"mul\((\d{1,3}),(\d{1,3})\)", read("input", String)))))
