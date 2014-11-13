reqs = ["onLoad", "world", "display", "input"]
require reqs, (onLoad, world, display, input) ->

    constants =
        interval : 1000 / 60

    state =
        running : false
        canvas : null
        startTime : +new Date()
        lastFrame : +new Date()
        timeElapsed : 0

    init = ->
        state.width = 960
        state.height = 540
        state.running = true
        display.init state
        display.showFPS = no
        state.keys = input
        run()

    run = ->
        state.startElapsed = +new Date() - state.startTime
        state.frameElapsed = +new Date() - state.lastFrame

        if state.running
            world.update state
            world.render state, display

        setTimeout run, constants.interval

        state.lastFrame = +new Date()

    onLoad init
