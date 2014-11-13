define () ->
    rgb = (args...) -> "rgb(#{args.join(", ")})"
    rgba = (args...) -> "rgba(#{args.join(", ")})"

    #Colors
    return {
        rgb
        rgba
        red : rgb 200, 0, 0
        green : rgb 0, 200, 0
        blueTint : rgba(0,0,200,0.5)
        black : rgb 0, 0, 0
    }
