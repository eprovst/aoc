grammar Card {
    token TOP { 'Card' \s+ <num> ':' \s+ <nums> \s+ '|' \s+ <nums> }
    regex nums { [<num> \s+]* <num> }
    token num { \d+ }
}

class Score {
    method TOP ($/) {
        my @w = $<nums>[0].made;
        my @m = $<nums>[1].made;
        my $n = ($_ ~~ any @w for @m).grep(* == True).elems;
        make $n > 0 ?? 2**($n-1) !! 0
    }

    method nums($/) {
        make (+$_ for $<num>)
    }
}

say sum (Card.parse($_, :actions(Score)).made for lines)
