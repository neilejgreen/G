color = require('../color')
module.exports =
    ({x, y, width, height}) ->
        type : "wall"
        boundingBlock: -> {x, y, width, height}
        update : ->
        getRenderTargets : () -> {
            shape : "Rectangle"
            color : color.wood
            x, y, width, height
        }
