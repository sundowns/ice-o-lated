local PATH = (...):gsub("%.init$", "")

return {
    player = require(PATH .. ".player"),
    grid = require(PATH .. ".grid")
}
