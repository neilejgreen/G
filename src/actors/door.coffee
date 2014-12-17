color = require('../color')

module.exports = ({x, y, width, height}) ->
    block =
        shape : "Rectangle"
        color : color.green
        x : x, y : y
        width : width, height : height

    type : "door"
    boundingBlock : -> {x, y, width, height}
    update : (state) ->
    getRenderTargets : () ->
        block
