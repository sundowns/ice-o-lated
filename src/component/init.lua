local PATH = (...):gsub("%.init$", "")

return {
    position = require(PATH .. ".position"),
    direction = require(PATH .. ".direction"),
    speed = require(PATH .. ".speed"),
    keyInput = require(PATH .. ".keyInput"),
    sprite = require(PATH .. ".sprite"),
    playerControlled = require(PATH .. ".playerControlled")
}
