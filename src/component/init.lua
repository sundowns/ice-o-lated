local PATH = (...):gsub("%.init$", "")

return {
    position = require(PATH .. ".position"),
    direction = require(PATH .. ".direction"),
    keyInput = require(PATH .. ".keyInput"),
    sprite = require(PATH .. ".sprite"),
    gridlocked = require(PATH .. ".gridlocked"),
    playerControlled = require(PATH .. ".playerControlled"),
    pushable = require(PATH .. ".pushable"),
    standable = require(PATH .. ".standable"),
    openable = require(PATH .. ".openable"),
    pressable = require(PATH .. ".pressable"),
    goal = require(PATH .. ".goal"),
    spawn = require(PATH .. ".spawn")
}
