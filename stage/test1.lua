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
      columns = 16,
      image = "../asset/SNOW_ICE_TILESET.png",
      imagewidth = 128,
      imageheight = 144,
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
      tilecount = 288,
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
        4, 5, 5, 5, 5, 5, 5, 6, 134, 135,
        20, 65, 65, 65, 65, 65, 65, 22, 134, 135,
        20, 81, 81, 81, 81, 81, 81, 22, 134, 135,
        20, 97, 97, 97, 97, 97, 97, 22, 134, 135,
        20, 21, 113, 113, 113, 113, 113, 22, 134, 135,
        20, 21, 21, 21, 21, 21, 21, 22, 134, 135,
        20, 21, 21, 21, 21, 21, 21, 22, 134, 135,
        36, 37, 37, 37, 37, 37, 37, 38, 134, 135,
        134, 135, 134, 134, 134, 134, 134, 134, 134, 135,
        134, 134, 134, 134, 134, 134, 134, 134, 134, 135
      }
    }
  }
}
