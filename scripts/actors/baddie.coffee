define ["color"], (color) ->
    ({x, y, width, height}) ->
        startX = x
        mainBlock =
            shape : "Rectangle"
            color : color.red
            x : 0, y : y
            width : width, height : height

        return {
            type : "baddie"
            update : (state) ->
                loopLength = (state.width - mainBlock.width) * 2
                pointPMS = loopLength / 10 ** 4
                msPosition = (state.startElapsed + startX / pointPMS)
                pointsPosition = (pointPMS * msPosition) % loopLength

                if pointsPosition < (loopLength / 2)
                    mainBlock.x = pointsPosition
                else
                    mainBlock.x = loopLength - pointsPosition
            boundingBlock : () -> mainBlock
            getRenderTargets : () ->
                mainBlock
        }
