define(["color"], (color) ->

    black = ->
        speed = .1 # pixels / millisecond
        initialized = no
        mainBlock =
            shape : "Rectangle"
            color : color.black
            x : 0, y : 0
            width : 10, height : 80

        update : (state) ->
            if not initialized
                mainBlock.x =
                    (state.width -  mainBlock.width) / 2
                mainBlock.y =
                    (state.height - 20 - mainBlock.height)
                initialized = yes

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
            [mainBlock]

    blue = ->
        mainBlock =
            shape : "Rectangle"
            color : color.blueTint
            x : 0, y : 30
            width : 55, height : 50

        altBlock =
            shape : "Rectangle"
            color : color.blueTint
            x : -100, y : 30
            width : 55, height : 50

        return {
            update : (state) ->
                mainBlock.x =
                    state.width * (state.startElapsed % 10 ** 4 ) / 10 ** 4

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

    green = ->
        block =
            shape : "Rectangle"
            color : color.green
            x : 0, y : 0
            width : 20, height : 20
        update : (state) ->

            baseHeight = 20
            extraHeight = 20
            cycleLength = 200

            positionInCycle = state.startElapsed % cycleLength / cycleLength
            #Cos of (position * Tau) adjusted to be [0..1] rather than [-1..1]
            tween = ((Math.cos positionInCycle * Math.PI * 2) + 1 ) / 2

            block.x = (state.width - block.width) / 2
            block.y = (state.height - block.height) / 2

            block.height = block.width = baseHeight + tween * extraHeight

        getRenderTargets : () ->
            [block]


    red =
        update : ->
        getRenderTargets : () ->
            [
                shape : "Rectangle"
                color : color.red
                x : 10, y : 10
                width : 55, height : 50
            ]

    [
        red
        blue()
        green()
        black()
    ]
)
