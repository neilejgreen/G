levelList = [
    "start", "gameover", "win"
]

levelList.push "level#{l}" for l in [0..5]

externals = ["lodash"].concat("levels/#{a}" for a in levelList)

define externals, (lodash, levels...) ->
    levelHash = lodash.zipObject levelList, levels
    getLevel : (levelName) -> return levelHash[levelName]
