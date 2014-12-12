Game
====

###Purpose
Create the world, setup loops and manage the display

    define ["level", "display"], (level, display) ->

---------

Initialize `constants` and the `state`

        constants =
            interval : 1000 / 60

        state = {}
        world = null

Allow the game to be paused and unpaused:

        pause = -> state.running = false
        resume = -> state.running = true

Init function initilizes timing and kicks the loops off

        init = ->
            hiResTime = window.performance.now()

            state.width = 940
            state.height = 480
            state.startTime = hiResTime
            state.lastFrame = hiResTime
            state.running = true

            loadNextLevel()

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

            if state.worldComplete
                state.worldComplete = false
                loadNextLevel()

            if state.failed
                state.failed = false
                loadNextLevel(true)

            setNextUpdateTimeout()

Load the next leve depending on the state of the world

        loadNextLevel = (failed) ->
            if failed
                state.levelName = "gameover"
            else
                state.levelName = (
                    switch state.levelName
                        when undefined, "gameover", "win" then getStartingLevel()
                        when "start" then "level1"
                        when "level5" then "win"
                        else "level" + (1 + + /\d+/.exec state.levelName)
                    )

            console.log "Starting #{state.levelName}"
            world = level.createLevel state

Check the querystring for a levelName

        getStartingLevel = () ->
            /levelname\=([^&]*)/gi.exec(window.location.search)?[1] or "start"

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
