local PATH = (...):gsub("%.init$", "")

return {
    player = require(PATH .. ".player"),
    rock = require(PATH .. ".rock"),
    boulder = require(PATH .. ".boulder")
}
