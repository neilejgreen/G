define ["input"], (input) ->
    worldText = [
        {
            shape : "Text"
            message : "Press Any Key To Start"
            x : 100, y : 200
        }
    ]
    update : (state) ->
        if input.getKeys().length
            state.worldComplete = true
    render : (state, display) ->
        display.renderWorld state, worldText
