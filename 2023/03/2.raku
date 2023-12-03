my $m = lines>>.comb>>.list;
my $a = 0;
for ^$m X ^$m[0] -> ($r, $c) {
    if $m[$r;$c] eq '*' {
        my $h = 0;
        my $p = 1;
        for $r+(-1..1) {
            for $m[$_].join ~~ m:g/\d+/ -> $n {
                if $c ~~ $n.from-1..$n.to {
                    $h++;
                    $p *= $n;
                }
            }
        }
        if $h == 2 {
            $a += $p;
        }
    }
}

say $a;
