return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 10,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 2,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "SNOW_ICE_TILESET",
      firstgid = 1,
      filename = "../asset/SNOW_ICE_TILESET.tsx",
      tilewidth = 8,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "../asset/SNOW_ICE_TILESET.png",
      imagewidth = 64,
      imageheight = 72,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 8,
        height = 8
      },
      properties = {},
      terrains = {},
      tilecount = 72,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        4, 5, 5, 5, 5, 5, 5, 6, 70, 71,
        12, 33, 33, 33, 33, 33, 33, 14, 70, 71,
        12, 41, 41, 41, 41, 41, 41, 14, 70, 71,
        12, 49, 49, 49, 49, 49, 49, 14, 70, 71,
        12, 13, 57, 57, 57, 57, 57, 14, 70, 71,
        12, 13, 13, 13, 13, 13, 13, 14, 70, 71,
        12, 13, 13, 13, 13, 13, 13, 14, 70, 71,
        20, 21, 21, 21, 21, 21, 21, 22, 70, 71,
        70, 71, 70, 70, 70, 70, 70, 70, 70, 71,
        70, 70, 70, 70, 70, 70, 70, 70, 70, 71
      }
    }
  }
}
