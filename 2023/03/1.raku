my $m = lines>>.comb>>.list;
my $a = 0;
for ^$m -> $r {
    for $m[$r].join ~~ m:g/\d+/ -> $p {
        if any (($m[.[0];.[1]]||'.') ~~ /<-[\d]-[\.]>/ for $r+(-1..1) X $p.from-1..$p.to) {
            $a += $p
        }
    }
}

say $a;
