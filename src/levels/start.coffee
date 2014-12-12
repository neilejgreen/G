define ["input"], (input) ->
    worldText = [
        {
            shape : "Text"
            message : "Press Any Direction Key To Start"
            x : 100, y : 200
        }
    ]
    update : (state) ->
        if _.intersection(input.getKeys(), "#{d} Arrow" for d in ["Up", "Down", "Left", "Right"]).length
            state.worldComplete = true
    render : (state, display) ->
        display.renderWorld state, worldText
