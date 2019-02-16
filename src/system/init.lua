local PATH = (...):gsub("%.init$", "")

return {
    grid = require(PATH .. ".grid"),
    keyInput = require(PATH .. ".keyInput"),
    renderSprite = require(PATH .. ".renderSprite"),
    direction = require(PATH .. ".direction"),
    stageManager = require(PATH .. ".stageManager")
}
