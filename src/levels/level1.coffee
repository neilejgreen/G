lodash = require('lodash')
map = "
    wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
    wP.............................w
    w..............................w
    w..............................w
    w..............................w
    w...b..........................w
    w............wwwwww............w
    w............w....w............w
    w............w.d..w............w
    w............w....w............w
    w............w....w............w
    w............ww..ww............w
    w..............................w
    w........................b.....w
    w..............................w
    w..............................w
    w..............................w
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

for c in lodash.flatten(map) when c isnt ' '
    if not (c of key)
        console.warn "unknown character in map '#{c}'"

module.exports ={
        map
        key
    }
