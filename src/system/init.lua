local PATH = (...):gsub("%.init$", "")

return {
    grid = require(PATH .. ".grid"),
    keyInput = require(PATH .. ".keyInput"),
    movement = require(PATH .. ".movement"),
    renderSprite = require(PATH .. ".renderSprite"),
    direction = require(PATH .. ".direction")
}
