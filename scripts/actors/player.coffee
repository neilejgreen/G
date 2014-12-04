define ["lodash", "color", "collision", "input"], (lodash, color, collision, input) ->
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
            permissableMove = speed * state.frameElapsed

            vector = {x:0, y:0}

            if input.isDown "Down Arrow"
                vector.y += permissableMove
            if input.isDown "Up Arrow"
                vector.y -= permissableMove
            if input.isDown "Right Arrow"
                vector.x += permissableMove
            if input.isDown "Left Arrow"
                vector.x -= permissableMove

            #normalize vector when movig diagonally
            if vector.x and vector.y
                vector.x *= Math.SQRT1_2
                vector.y *= Math.SQRT1_2

            return if not (vector.x or vector.y)

            ###
            Split move into two different collisionTests :(
            This prevents you slipping through one wall because you collided
            with a different wall first and allows you to move along a wall
            whilst trying to move toward it
            ###
            attemptMove = (v) ->
                movedBlock = _.clone(mainBlock)
                movedBlock.x += v.x
                movedBlock.y += v.y

                wallBlocks = stage
                    .filter (it) -> it.type is "wall"
                    .map (it) -> it.boundingBlock()

                movedBlockCollision = collision.hit.bind collision, movedBlock
                hitBlk = _.find wallBlocks, movedBlockCollision
                if hitBlk
                    collision.moveTo mainBlock, hitBlk, v
                else
                    mainBlock = movedBlock
            attemptMove({x:vector.x, y:0})
            attemptMove({x:0, y:vector.y})
        getRenderTargets : () ->
            mainBlock
