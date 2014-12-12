
require.config
    paths :
        ###
        actors : "../actors/js"
        levels : "../levels/js"
        ###
        lodash : "../../lib/lodash"
        tinyColor: "//cdnjs.cloudflare.com/ajax/libs/tinycolor/1.1.0/tinycolor"
    shim :
        lodash :
            exports : "_"
            init : () ->
                _.noConflict()


require ["lodash", "loadCss"], (lodash, loadCss) ->
    loadCss "css/css.css"


require ["simpleEvents", "game"], (simpleEvents, game) ->
    simpleEvents.focus game.resume, game.pause
    simpleEvents.onLoad game.init
