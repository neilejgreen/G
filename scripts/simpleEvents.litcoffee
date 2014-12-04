Simple Events
==================

Wrappers for onload and window focus events.

    define () ->

Keep a list of postponed function calls until the document loads

        postponedFuncs = []

There is a chance (because requirejs is loading things async) that at this time the document is already loaded

        loadComplete = document.readystate isnt "loading"

If it hasn't yet loaded then add an event listener waiting for the change.  (Not much advantage in removing this as
it will only trigger at most twice).  When it does trigger, execute all the function calls that were delayed.

        if not loadComplete
            document.addEventListener "readystatechange", () ->
                loadComplete = true
                f() for f in postponedFuncs

The exported onload function:

        onload  = (func) ->
            if loadComplete
                func()
            else
                postponedFuncs.push func
            return

This provides a simple wrapper for focus and blur:

        focus = (focus, blur) ->
            addEventListener "focus", focus
            addEventListener "blur", blur

----

        return {
            onLoad
            focus
        }
