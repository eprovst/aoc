grammar Game {
    token TOP { 'Game ' <num> ': ' [<pair> ['; ' | ', ']]* <pair> }
    token pair { <num> ' ' <color> }
    token color { red | green | blue }
    token num { \d+ }
}

class PowerOfGame {
    method TOP($/) {
        make [*] [Zmax] $<tuple>>>.made
    }

    method pair($/) {
        given $<color> {
            when 'red'   { make (+$<num>, 0, 0) }
            when 'green' { make (0, +$<num>, 0) }
            when 'blue'  { make (0, 0, +$<num>) }
        }
    }
}

say sum (Game.parse($_, :actions(PowerOfGame)).made for lines)
