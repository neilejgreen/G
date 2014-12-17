lodash = require('lodash')


castList = ["empty", "baddie", "treasure", "wall", "player", "door"]

externals = ("./actors/#{a}" for a in castList)

module.exports =
    empty : require './actors/empty'
    baddie : require './actors/baddie'
    treasure : require './actors/treasure'
    wall : require './actors/wall'
    player : require './actors/player'
    door : require './actors/door'

