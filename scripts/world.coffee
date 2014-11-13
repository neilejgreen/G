define ["actors"], (actors) ->
    update : (state) ->
        actor.update state for actor in actors
    render : (state, display) ->
        targets =
            for actor in actors
                target for target in actor.getRenderTargets()
        targets = [].concat targets...

        display.renderWorld state, targets
