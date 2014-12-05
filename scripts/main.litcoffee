Main Entry Point
================

This is the main entry point for the code called by require.js from index.html

First step is to configure require

    require.config
        paths :
            actors : "../actors/js"
            levels : "../levels/js"
            lodash : "../../lib/lodash"
            tinyColor: "//cdnjs.cloudflare.com/ajax/libs/tinycolor/1.1.0/tinycolor"
        shim :
            lodash :
                exports : "_"
                init : () ->
                    _.noConflict()

Initial require to load css.  This allows us to have a nice clean html file with just the require element.

    require ["lodash", "loadCss"], (lodash, loadCss) ->
        loadCss "css/css.css"

Here is the main setup.

    require ["simpleEvents", "game"], (simpleEvents, game) ->
        simpleEvents.focus game.resume, game.pause
        simpleEvents.onLoad game.init
