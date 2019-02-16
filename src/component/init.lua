local PATH = (...):gsub('%.init$', '')

return {
    position = require(PATH..'.position')
}