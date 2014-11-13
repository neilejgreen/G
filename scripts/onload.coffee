define () ->
    postponedFuncs = []
    loadComplete = document.readystate isnt "loading"

    if not loadComplete
        document.addEventListener "readystatechange", () ->
            loadComplete = true
            f() for f in postponedFuncs

    (func) ->
        if loadComplete
            func()
        else
            postponedFuncs.push func
        return
