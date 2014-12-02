define ["lodash", "color", "collision"], (lodash, color, collision) ->
    ({x, y, width, height}) ->
        speed = .3 # pixels / millisecond
        mainBlock =
            shape : "Rectangle"
            color : color.black
            x : x, y : y
            width : width, height : height

        type : "player"
        boundingBlock : -> mainBlock
        update : (state, stage) ->
            movedBlock = _.clone(mainBlock)
            permissableMove = speed * state.frameElapsed
            if state.keys.isDown "Down Arrow"
                movedBlock.y += permissableMove
            if state.keys.isDown "Up Arrow"
                movedBlock.y -= permissableMove
            if state.keys.isDown "Right Arrow"
                movedBlock.x += permissableMove
            if state.keys.isDown "Left Arrow"
                movedBlock.x -= permissableMove

            wallBlocks = stage
                .filter (it) -> it.type is "wall"
                .map (it) -> it.boundingBlock()

            hitBlk = _.find wallBlocks, collision.hit.bind collision, movedBlock
            if hitBlk
                collision.moveTo mainBlock, hitBlk, {
                    x: movedBlock.x - mainBlock.x
                    y: movedBlock.y - mainBlock.y
                }
            else
                mainBlock = movedBlock
        getRenderTargets : () ->
            mainBlock
