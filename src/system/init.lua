local PATH = (...):gsub('%.init$', '')

return {
    grid = require(PATH..'.grid')
}