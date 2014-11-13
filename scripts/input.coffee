define ["onload", "keys"], (onload, KEYS) ->

    keysThatAreDown = []

    addKey = (key) ->
        return if key in keysThatAreDown
        keysThatAreDown.push key

    removeKey = (key) ->
        return if key not in keysThatAreDown
        i = keysThatAreDown.indexOf key
        keysThatAreDown.splice(i,1)
        #Just in case we have added multiples
        removeKey(key)


    onload () ->
        addEventListener "keydown", (e) ->
            addKey(e.which)

        addEventListener "keyup", (e) ->
            removeKey(e.which)

    isDown : (key) ->
        if not (key of KEYS)
            console.warn "Unknown Key: #{key}"
        KEYS[key] in keysThatAreDown

    getKeys : () ->
        KEYS[key] for key in keysThatAreDown

    getCodes : () ->
        keysThatAreDown[..]
