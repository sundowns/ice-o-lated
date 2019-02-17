local PATH = (...):gsub("%.init$", "")

return {
    player = require(PATH .. ".player"),
    switch = require(PATH .. ".switch"),
    rock = require(PATH .. ".rock"),
    door = require(PATH .. ".door"),
    goal = require(PATH .. ".goal"),
    crate = require(PATH .. ".crate")
}
