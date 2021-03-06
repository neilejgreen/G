color = require '../color'

module.exports = 
    ({x, y, width, height}) ->
        block =
            shape : "Rectangle"
            color : color.gold
            x : x, y : y
            width : width, height : height

        type : "treasure"
        boundingBlock : -> {x, y, width, height}
        update : (state) ->

            baseHeight = height / 2
            extraHeight = height / 2
            cycleLength = 800

            positionInCycle = state.startElapsed % cycleLength / cycleLength
            #Cos of (position * Tau) adjusted to be [0..1] rather than [-1..1]
            tween = ((Math.cos positionInCycle * Math.PI * 2) + 1 ) / 2

            block.height = block.width = baseHeight + tween * extraHeight

        getRenderTargets : () ->
            block
