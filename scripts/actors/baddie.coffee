define ["color", "collision"], (color, collision) ->
    ({x, y, width, height}) ->
        direction = +1
        speed = .2
        startX = x
        mainBlock =
            shape : "Rectangle"
            color : color.red
            x : startX, y : y
            width : width, height : height

        return {
            type : "baddie"
            update : (state, stage) ->
                oldX = mainBlock.x
                mainBlock.x += direction * speed * state.frameElapsed
                wallBlocks = stage
                    .filter (it) -> it.type is "wall"
                    .map (it) -> it.boundingBlock()
                if wallBlocks.some collision.hit.bind collision, mainBlock
                    mainBlock.x = oldX
                    direction *= -1

            boundingBlock : () -> mainBlock
            getRenderTargets : () ->
                mainBlock
        }
