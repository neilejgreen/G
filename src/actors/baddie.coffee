color = require('../color')
collision = require('../collision')

module.exports = 
    ({x, y, width, height}) ->
        direction = +1
        speed = .2
        startX = x + width / 4
        mainBlock =
            shape : "Rectangle"
            color : color.red
            x : startX, y : y + height / 4
            width : width / 2, height : height / 2

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
