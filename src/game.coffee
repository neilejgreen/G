define ["level", "display"], (level, display) ->
    constants =
        interval : 1000 / 60
    
    state = {}
    world = null
    
    pause = -> state.running = false
    resume = -> state.running = true
    
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
    
    getStartingLevel = () ->
        /levelname\=([^&]*)/gi.exec(window.location.search)?[1] or "start"
    
    setNextUpdateTimeout = () ->
        hiResTime = window.performance.now()
        nextFrameOccursBefore = hiResTime + constants.interval
        nextFrameOccursAt = nextFrameOccursBefore - (nextFrameOccursBefore % constants.interval)
        timeTillNextFrame = nextFrameOccursAt - hiResTime
        setTimeout updateWorld, timeTillNextFrame
    
    updateDisplay = (hiResTime) ->
        world.render state, display
        window.requestAnimationFrame updateDisplay
    
    {
        pause
        resume
        init
    }
