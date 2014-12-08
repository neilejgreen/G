define ["lodash", "simpleEvents", "keys"], (_, simpleEvents, KEYS) ->

    config =
        log : off

    log = (args...) ->
        if config.log
            console.log args...

    keysThatAreDown = []

    addKey = (key) ->
        log "addKey '#{key}'"
        return if key in keysThatAreDown
        keysThatAreDown.push key

    removeKey = (key) ->
        log "removeKey '#{key}'"
        return if key not in keysThatAreDown
        i = keysThatAreDown.indexOf key
        keysThatAreDown.splice(i,1)
        #Just in case we have added multiples
        removeKey(key)


    simpleEvents.onLoad () ->
        addEventListener "keydown", (e) ->
            addKey(e.which)

        addEventListener "keyup", (e) ->
            removeKey(e.which)

    isDown : (key) ->
        log "isDown '#{key}'"
        if not (key of KEYS)
            console.warn "Unknown Key: #{key}"
        KEYS[key] in keysThatAreDown

    getKeys : () ->
        #This needs to be compacted because we only want to know about the specific keys we care about
        #(Logitech mice et al can leave some odd charcodes in the down state)
        _.compact(KEYS[key] for key in keysThatAreDown)

    getCodes : () ->
        keysThatAreDown[..]
