define(["color"], (color) ->

    player = ({x, y, width, height}) ->
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

    blue = ({x, y, width, height}) ->
        startX = x
        mainBlock =
            shape : "Rectangle"
            color : color.blueTint
            x : 0, y : y
            width : width, height : height

        altBlock =
            shape : "Rectangle"
            color : color.blueTint
            x : -100, y : y
            width : 55, height : 50

        return {
            update : (state) ->
                mainBlock.x =
                    ((state.width * state.startElapsed / 10 ** 4) + startX)\
                    % state.width

                altBlock.x =
                    if mainBlock.x + mainBlock.width > state.width
                        mainBlock.x - state.width
                    else -100
            getRenderTargets : () ->
                if altBlock.x is -100
                    [mainBlock]
                else
                    [mainBlock, altBlock]
        }

    green = ({x, y, width, height}) ->
        block =
            shape : "Rectangle"
            color : color.green
            x : x, y : y
            width : width, height : height
        update : (state) ->

            baseHeight = height / 2
            extraHeight = height / 2
            cycleLength = 200

            positionInCycle = state.startElapsed % cycleLength / cycleLength
            #Cos of (position * Tau) adjusted to be [0..1] rather than [-1..1]
            tween = ((Math.cos positionInCycle * Math.PI * 2) + 1 ) / 2

            block.x = (state.width - block.width) / 2
            block.y = (state.height - block.height) / 2

            block.height = block.width = baseHeight + tween * extraHeight

        getRenderTargets : () ->
            [block]


    red = ({x, y, width, height}) ->
        update : ->
        getRenderTargets : () ->{
            shape : "Rectangle"
            color : color.red
            x, y, width, height
        }
    empty = () ->

    {
        red
        blue
        green
        player
        empty
    }
)
