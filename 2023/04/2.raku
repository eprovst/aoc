grammar Card {
    token TOP { 'Card' \s+ <num> ':' \s+ <nums> \s+ '|' \s+ <nums> }
    regex nums { [<num> \s+]* <num> }
    token num { \d+ }
}

class Matches {
    method TOP ($/) {
        my @w = $<nums>[0].made;
        my @m = $<nums>[1].made;
        make ($_ ~~ any @w for @m).grep(* == True).elems;
    }

    method nums($/) {
        make (+$_ for $<num>)
    }
}

my $m = (Card.parse($_, :actions(Matches)).made for lines);
my @n = (1 for ^$m);
for ^$m -> $i {
    for 1..$m[$i] -> $j {
        @n[$i+$j] += @n[$i]
    }
}
put sum @n;
