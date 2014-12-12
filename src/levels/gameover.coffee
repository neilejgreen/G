define ["input"], (input) ->
    worldText = [
        {
            shape : "Text"
            message : "Game over!"
            x : 100, y : 200
        }
        {
            shape : "Text"
            message : "Press R to restart"
            x : 100, y : 220
        }
    ]
    update : (state) ->
        if input.isDown("R")
            state.worldComplete = true
    render : (state, display) ->
        display.renderWorld state, worldText
