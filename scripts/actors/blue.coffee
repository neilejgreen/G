define ["color"], (color) ->
    ({x, y, width, height}) ->
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
            width : width, height : height

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
