input = require('../input')

worldText = [
    {
        shape : "Text"
        message : "Success!"
        x : 100, y : 200
    }
    {
        shape : "Text"
        message : "You found the treasure!"
        x : 100, y : 220
    }
    {
        shape : "Text"
        message : "Press R to restart"
        x : 100, y : 240
    }
]

module.exports =
    update : (state) ->
        if input.isDown("R")
            state.worldComplete = true
    render : (state, display) ->
        display.renderWorld state, worldText
