$! = [slurp.split("\n\n")>>.lines>>.Array];
my @s = [$![0;0].split(' ')[1..*]>>.Int];
my @a = [$![1..*]>>[1..*]>>.&{.split(' ').&{(+.[1] + ^+.[2]) => (.[0]-.[1])}}>>.Array];

for @a -> @m {
    for ^@s -> $i {
        for @m -> $r {
            if @s[$i] ~~ $r.key {
                @s[$i] += $r.value;
                last
            }
        }
    }
}
put min @s;
