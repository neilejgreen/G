input = require '../input'
lodash = require 'lodash'

worldText = [
    {
        shape : "Text"
        message : "Press Any Direction Key To Start\nNow with coffee!"
        x : 100, y : 200
    }
]

module.exports =
    update : (state) ->
        if lodash.intersection(input.getKeys(), "#{d} Arrow" for d in ["Up", "Down", "Left", "Right"]).length
            state.worldComplete = true
    render : (state, display) ->
        display.renderWorld state, worldText
