local PATH = (...):gsub("%.init$", "")

return {
    player = require(PATH .. ".player"),
    switch = require(PATH .. ".switch"),
    rock = require(PATH .. ".rock"),
    boulder = require(PATH .. ".boulder")
}
