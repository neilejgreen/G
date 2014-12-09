define ["lodash"], (_) ->
    map = "
        wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
        wb............wb...............w
        wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
        w..............................w
        w....wwwwwwwwwwwwwwwwww........w
        w...bwP..............bw...b....w
        w....www....wwwwwwwwwww........w
        w......w....w.............b....w
        w....www....wwwwwwwwwww........w
        w....wb...............w...b....w
        w...wwww....wwwwwwwwwww........w
        ww...www....w.............b....w
        wwww..ww....wwwwwwwwwww........w
        wwwww..w.............bw...b....w
        wwwwww..wwww....wwwwwwwwww.....w
        w........b......w........w.....w
        w...............w..d..w........w
        wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
    ".split(' ').map (r) -> r.split ''

    key =
        '.' : 'empty'
        'P' : 'player'
        'w' : 'wall'
        'b' : 'baddie'
        'd' : 'door'

    if (map.length is not 18 and map.every (row) -> row.length is 32)
        throw new Error("Map is not 32 * 18!")

    for c in _.flatten(map) when c isnt ' '
        if not (c of key)
            console.warn "unknown character in map '#{c}'"

    return {
        map
        key
    }
