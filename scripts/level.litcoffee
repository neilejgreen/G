    define ["cast", "grids", "lodash"], (cast, grids, _) ->

        class level
            constructor : () ->
                #TODO Define these elsewhere
                [@width, @height] = [940, 480]

                @loadLevel "level1"

            loadLevel : (levelName) ->
                @stage = []

                grid = grids.getLevel (levelName)

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

                @stage = _.compact (@stage)

            update : (state) ->
                actor.update state, @stage for actor in @stage

            render : (state, display) ->
                targets = _.flatten( actor.getRenderTargets() for actor in @stage )
                display.renderWorld state, targets
