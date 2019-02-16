local PATH = (...):gsub("%.init$", "")

return {
    position = require(PATH .. ".position"),
    direction = require(PATH .. ".direction"),
    movespeed = require(PATH .. ".movespeed"),
    keyInput = require(PATH .. ".keyInput"),
    sprite = require(PATH .. ".sprite"),
    playerControlled = require(PATH .. ".playerControlled"),
    grid = require(PATH .. ".grid")
}
