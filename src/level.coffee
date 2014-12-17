cast = require './cast'
grids = require './grids'
lodash = require 'lodash'

class level
    constructor : ({@width, @height, levelName}) ->
        @loadLevel levelName

    loadLevel : (levelName) ->
        @stage = []

        grid = grids[levelName]

        #parse the map
        [gridRows, gridCols] = [grid.map.length, grid.map[0].length]
        [cellWidth, cellHeight] = [@width / gridCols, @height / gridRows]

        for row, ri in grid.map
            for actorCode, ci in row
                actorType = grid.key[actorCode]
                x = ci / gridCols * @width
                y = ri / gridRows * @height

                @stage.push cast[actorType] {
                    x, y,
                    width : cellWidth, height : cellHeight
                }

        @stage = lodash.compact (@stage)

    update : (state) ->
        actor.update state, @stage for actor in @stage

    render : (state, display) ->
        targets = lodash.flatten( actor.getRenderTargets() for actor in @stage )
        display.renderWorld state, targets

level.createLevel = (state) ->
    if state.levelName.indexOf("level") is 0
        return new level state
    else
        return grids[state.levelName]

module.exports = level
