postponedFuncs = []

isLoaded = ->  document?.readyState is "complete"

if not isLoaded()
    document?.addEventListener "readystatechange", () ->
        return if not isLoaded()
        f() for f in postponedFuncs

onLoad  = (func) ->
    if isLoaded()
        func()
    else
        postponedFuncs.push func
    return

focus = (focus, blur) ->
    addEventListener? "focus", focus
    addEventListener? "blur", blur
    return

module.exports = {
    onLoad
    focus
}
