define ["../../lib/lodash"], (_) ->
    map = "
        ................................
        .P..............................
        ................................
        ....g....................g......
        ................................
        ....b...........................
        .............rrrrrr.............
        .............r....r.............
        .............r.g..r.............
        .............r....r.............
        .............r....r.............
        .............rr..rr.............
        ................................
        .........................b......
        ................................
        ....g....................g......
        ................................
        ................................
    ".split(' ').map (r) -> r.split ''

    key =
        '.' : 'empty'
        'P' : 'player'
        'r' : 'red'
        'b' : 'blue'
        'g' : 'green'

    if (map.length is not 18 and map.every (row) -> row.length is 32)
        throw new Error("Map is not 32 * 18!")

    for c in _.flatten(map) when c isnt ' '
        if not (c of key)
            console.warn "unknown character in map '#{c}'"

    return {
        map
        key
    }
