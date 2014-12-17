lodash = require('lodash')
map = "
    wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
    w..............................w
    w..............................w
    w..b.wwwwwwwwwwwwwwwwwwwwww....w
    w....w...bbbb.............w....w
    w....w.............bbbb...w....w
    w....w....wwwwwwwwwwww....w....w
    w....w....w........b.w....w....w
    w....w....w....t.....w....w....w
    w.b..w....w.b........w....w....w
    w....w....w....wwwwwww....w....w
    w....w....w........b......w....w
    w....w....wwwwwwwwwwwwwwwww....w
    w....w.........b..............bw
    w....w...............b....b....w
    wb...wwwwwwwwwwwwwwww..........w
    w..................Pw..........w
    wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
".split(' ').map (r) -> r.split ''

key =
    '.' : 'empty'
    'P' : 'player'
    'w' : 'wall'
    'b' : 'baddie'
    't' : 'treasure'

if (map.length is not 18 and map.every (row) -> row.length is 32)
    throw new Error("Map is not 32 * 18!")

for c in lodash.flatten(map) when c isnt ' '
    if not (c of key)
        console.warn "unknown character in map '#{c}'"

module.exports ={
        map
        key
    }
