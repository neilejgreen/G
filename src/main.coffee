
require.config
    paths :
        lodash : "//cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash"
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
