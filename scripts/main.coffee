reqs = ["onLoad", "world", "display", "input"]
require reqs, (onLoad, world, display, input) ->

    constants =
        interval : 1000 / 60

    highResTime = window.performance.now()

    state =
        running : false
        canvas : null
        startTime : highResTime
        lastFrame : highResTime
        timeElapsed : 0

    init = ->
        state.width = world.width
        state.height = world.height
        state.running = true
        state.keys = input
        display.init state
        display.showFPS = no
        window.requestAnimationFrame run

    run = (hiResTime)->
        state.startElapsed = hiResTime - state.startTime
        state.frameElapsed = hiResTime - state.lastFrame

        if state.running
            world.update state
            world.render state, display

        state.lastFrame = hiResTime

        window.requestAnimationFrame run

    onLoad init
