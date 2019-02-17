local PATH = (...):gsub("%.init$", "")

return {
    grid = require(PATH .. ".grid"),
    keyInput = require(PATH .. ".keyInput"),
    spriteRenderer = require(PATH .. ".spriteRenderer"),
    direction = require(PATH .. ".direction"),
    stageManager = require(PATH .. ".stageManager")
}
