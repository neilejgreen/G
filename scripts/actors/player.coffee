define ["color"], (color) ->
    ({x, y, width, height}) ->
        speed = .3 # pixels / millisecond
        mainBlock =
            shape : "Rectangle"
            color : color.black
            x : x, y : y
            width : width, height : height

        update : (state) ->
            permissableMove = speed * state.frameElapsed

            if state.keys.isDown "Down Arrow"
                mainBlock.y += permissableMove
            if state.keys.isDown "Up Arrow"
                mainBlock.y -= permissableMove
            if state.keys.isDown "Right Arrow"
                mainBlock.x += permissableMove
            if state.keys.isDown "Left Arrow"
                mainBlock.x -= permissableMove

        getRenderTargets : () ->
            mainBlock
