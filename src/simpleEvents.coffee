define () ->

    postponedFuncs = []

    loadComplete = document.readystate isnt "loading"

    if not loadComplete
        document.addEventListener "readystatechange", () ->
            loadComplete = true
            f() for f in postponedFuncs

    onLoad  = (func) ->
        if loadComplete
            func()
        else
            postponedFuncs.push func
        return

    focus = (focus, blur) ->
        addEventListener "focus", focus
        addEventListener "blur", blur

    return {
        onLoad
        focus
    }
