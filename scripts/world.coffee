define ["actors", "grid", "../../lib/lodash"], (actors, grid, _) ->

    #TODO Define these elsewhere
    [width, height] = [960, 540]

    stage = []

    #parse the map
    [gridRows, gridCols] = [grid.map.length, grid.map[0].length]
    [cellWidth, cellHeight] = [width / gridCols, height / gridRows]

    for row, ri in grid.map
        for actorCode, ci in row
            actorType = grid.key[actorCode]
            x = ci / gridCols * width
            y = ri / gridRows * height

            stage.push actors[actorType] {
                x, y,
                width : cellWidth, height : cellHeight
            }

    stage = _.compact (stage)

    return {
        width
        height
        update : (state) ->
            actor.update state for actor in stage

        render : (state, display) ->
            targets = _.flatten( actor.getRenderTargets() for actor in stage )
            display.renderWorld state, targets
    }
