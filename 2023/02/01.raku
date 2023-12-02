grammar Game {
    token TOP { 'Game ' <num> ': ' [<pair> ['; ' | ', ']]* <pair> }
    token pair { <num> ' ' <color> }
    token color { red | green | blue }
    token num { \d+ }
}

class ValidGame {
    method TOP ($/) {
        make all($<pair>>>.made) ?? +$<num> !! 0
    }

    method pair($/) {
        given $<color> {
            when 'red'   { make $<num> <= 12 }
            when 'green' { make $<num> <= 13 }
            when 'blue'  { make $<num> <= 14 }
        }
    }
}

say sum (Game.parse($_, :actions(ValidGame)).made for lines)
