Game
====

###Purpose
Create the world, setup loops and manage the display

    define ["world", "display"], (world, display) ->

---------

Initialize `constants` and the `state`

        constants =
            interval : 1000 / 60

        state = {}

Allow the game to be paused and unpaused:

        pause = -> state.running = false
        resume = -> state.running = true

Init function initilizes timing and kicks the loops off

        init = ->
            hiResTime = window.performance.now()

            state.width = world.width
            state.height = world.height
            state.startTime = hiResTime
            state.lastFrame = hiResTime
            state.running = true

            display.init state
            display.showFPS = no
            window.setTimeout updateWorld
            window.requestAnimationFrame updateDisplay

Main game-world loop, started during init. Will skip world update if the game isn't running

        updateWorld = () ->
            hiResTime = window.performance.now()
            state.startElapsed = hiResTime - state.startTime
            state.frameElapsed = hiResTime - state.lastFrame
            state.lastFrame = hiResTime
            if state.running
                world.update state
            setNextUpdateTimeout()

Setup a new timeoutCall.  The idea is to update at 60 fps, but to skip a whole frame if the last
update took more that 1/60 of a second.

        setNextUpdateTimeout = () ->
            hiResTime = window.performance.now()
            nextFrameOccursBefore = hiResTime + constants.interval
            nextFrameOccursAt = nextFrameOccursBefore - (nextFrameOccursBefore % constants.interval)
            timeTillNextFrame = nextFrameOccursAt - hiResTime
            setTimeout updateWorld, timeTillNextFrame

Main display loop independant of world update

        updateDisplay = (hiResTime) ->
            #doesn't need to pause, this will be handled by use of `requestAnimationFrame`
            world.render state, display
            window.requestAnimationFrame updateDisplay

Define the module for require:

        {
            pause
            resume
            init
        }
