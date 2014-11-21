define ["color"], (color) ->
    ({x, y, width, height}) ->
        update : ->
        getRenderTargets : () -> {
            shape : "Rectangle"
            color : color.red
            x, y, width, height
        }
