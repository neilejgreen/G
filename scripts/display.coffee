
createElement = (html) ->
    div = document.createElement("DIV")
    div.innerHTML = html
    div.firstChild

makeContext = (state) ->
    {width, height} = state
    canvasEle = createElement "
        <canvas id='g-canvas' width='#{width}' height='#{height}'/>
    "
    document.body.appendChild canvasEle
    canvasEle.getContext '2d'

define ["color", "input"], (color) ->

    canvas = null
    width = null
    height = null

    canvasClear = () ->
        canvas.clearRect 0, 0, canvas.canvas.width, canvas.canvas.height

    renderTarget = (target) ->
        switch target.shape
            when "Rectangle" then canvasRect target
            when "Text" then canvasText target.message, target.x, target.y

    canvasRect = (object) ->
        try
            canvas.fillStyle = object.color
            canvas.fillRect object.x, object.y, object.width, object.height
        catch error
            console.error error

    canvasText = (message, x = width - 200 , y = 20 ) ->
        canvas.fillStyle = color.rgb 0,0,0
        canvas.font = "16px consolas"
        canvas.fillText message, x, y

    renderWorld = (state, targets) ->
        canvasClear()
        renderTarget target for target in targets
        if display.showFPS
            canvasText "#{~~( 1000 / state.frameElapsed)} fps"

    init = (state) ->
        canvas = makeContext(state)

    display = {
        init,
        renderWorld : renderWorld
        showFPS : no
    }
