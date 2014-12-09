define ["lodash"], (_) ->
    map = "
        wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
        w........................b.....w
        w......................b.......w
        w....................b.........w
        wwwwwwww.wwwwwwwwwwwwwwwwww....w
        w...b...d.................w....w
        w.........................w....w
        w....ww.w.w.wwb...ww......w....w
        w....w.......w.....wwwwwwwwww..w
        w....w.......w.................w
        w....wwwwwwwww....w.......w....w
        w............ww..wwwwwwwwww....w
        w........w....w.......b...w....w
        w........w................w....w
        wwwwwwwwwwwwwwwwwwwwwwwwwww....w
        w..P......................w....w
        w...................www........w
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
