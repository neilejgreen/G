define ["tinyColor"], (tinyColor) ->
    rgb = (args...) -> "rgb(#{args.join(", ")})"
    rgba = (args...) -> "rgba(#{args.join(", ")})"

    #Colors
    colors = {
        red : rgb 200, 0, 0
        green : rgb 0, 200, 0
        blueTint : rgba 0, 0, 200, 0.5
        black : rgb 0, 0, 0
        wood: rgb 66, 33, 0
        gold: rgb 0xFF, 0xD7, 0
    }

    colors[k] = tinyColor(v).setAlpha(.05).toString() for k,v of colors
    return colors
