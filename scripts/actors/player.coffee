define ["lodash", "color", "collision", "input"], (lodash, color, collision, input) ->
    ({x, y, width, height}) ->
        speed = .3 # pixels / millisecond
        mainBlock =
            shape : "Rectangle"
            color : color.black
            x : x + width / 4, y : y + height / 4
            width : width / 2, height : height / 2

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

            ###
            Wall collisions

            Split move into two different collisionTests :(
            This prevents you slipping through one wall because you collided
            with a different wall first and allows you to move along a wall
            whilst trying to move toward it
            ###
            attemptMove = (v) ->
                return if not (v.x or v.y)
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

            #Baddie Collision
            state.failed = state.failed or stage
                .filter (it) -> it.type is "baddie"
                .map (baddie) -> baddie.boundingBlock()
                .some (baddie) -> collision.hit mainBlock, baddie

            #Door Collision
            state.worldComplete = state.worldComplete or stage
                .filter (it) -> it.type is "door" or it.type is "treasure"
                .map (door) -> door.boundingBlock()
                .some (door) -> collision.hit mainBlock, door

        getRenderTargets : () ->
            mainBlock
