levelList = [
    "start", "gameover" #, "win"
    "level0", "level1", "level2", "level3"
]

externals = ["lodash"].concat("levels/#{a}" for a in levelList)

define externals, (lodash, levels...) ->
    levelHash = lodash.zipObject levelList, levels
    getLevel : (levelName) -> return levelHash[levelName]
