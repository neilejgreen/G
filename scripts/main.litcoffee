Main Entry Point
================

This is the main entry point for the code called by require.js from index.html

First step is to configure require

    require.config
        paths :
            actors : "../actors/js"
            lodash : "../../lib/lodash"
            tinyColor: "//cdnjs.cloudflare.com/ajax/libs/tinycolor/1.1.0/tinycolor"
        shim :
            lodash :
                exports : "_"
                init : () ->
                    _.noConflict()

Initial require to load css.  This allows us to have a nice clean html file with just the require element.

    require ["lodash", "loadCss"], (lodash, loadCss) ->
        loadCss "css/css.css"

Here is the main setup.

    require ["onLoad", "world", "display", "input"], (onLoad, world, display, input) ->
        constants =
            interval : 1000 / 60

        highResTime = window.performance.now()

        state =
            running : false
            canvas : null
            startTime : highResTime
            lastFrame : highResTime
            timeElapsed : 0

Initialize the state. Attach listeners.  Start loop.

        init = ->
            state.width = world.width
            state.height = world.height
            state.running = true
            state.keys = input

            #todo: handle with input module
            listenForPause()

            display.init state
            display.showFPS = no
            window.requestAnimationFrame run

Attach to listeners so that the game won't run when the tab doesn't have focus.

        listenForPause = () ->
            addEventListener "blur", (e) ->
                state.running = false
            addEventListener "focus", (e) ->
                state.running = true

Main game loop, started during init:

        run = (hiResTime) ->

            state.startElapsed = hiResTime - state.startTime
            state.frameElapsed = hiResTime - state.lastFrame

            if state.running
                world.update state
                world.render state, display

            state.lastFrame = hiResTime

            window.requestAnimationFrame run

Set the init function to run onLoad

        onLoad init
