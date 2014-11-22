castList = ["empty", "baddie", "treasure", "wall", "player"]

externals = ["lodash"].concat("actors/#{a}" for a in castList)

define externals, (lodash, actors...) ->
    lodash.zipObject castList, actors
