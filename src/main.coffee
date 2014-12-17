require("./loadCss")("./css/css.css")
simpleEvents = require("./simpleEvents")


game = require('./game')

simpleEvents.focus game.resume, game.pause
simpleEvents.onLoad game.init
