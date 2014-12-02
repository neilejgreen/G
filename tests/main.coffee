require.config
    paths :
        "scripts" : "/scripts/js"
        "mocha" : "//cdnjs.cloudflare.com/ajax/libs/mocha/2.0.1/mocha"
        "chai" : "//cdnjs.cloudflare.com/ajax/libs/chai/1.10.0/chai"
        "tinyColor": "//cdnjs.cloudflare.com/ajax/libs/tinycolor/1.1.0/tinycolor.js"
    shim :
        "mocha" :
            exports : "mocha"

tests = [
    "collision"
]

require ["scripts/loadCss"], (loadCss) ->
    loadCss "//cdnjs.cloudflare.com/ajax/libs/mocha/2.0.1/mocha.css"

require ["mocha"], (mocha) ->
    mocha.setup("bdd")
    require tests, () ->
        mocha.run()
