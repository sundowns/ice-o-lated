return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 7,
  height = 12,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 7,
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
      width = 7,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        37, 37, 38, 146, 36, 37, 37,
        149, 147, 147, 163, 164, 150, 18,
        146, 4, 6, 18, 146, 146, 18,
        146, 36, 38, 149, 148, 166, 18,
        165, 147, 147, 166, 146, 18, 18,
        184, 185, 18, 18, 162, 150, 18,
        200, 201, 18, 18, 146, 182, 183,
        147, 147, 147, 147, 161, 198, 199,
        83, 116, 18, 18, 146, 18, 18,
        97, 82, 84, 84, 168, 84, 84,
        179, 179, 179, 181, 194, 81, 81,
        81, 81, 98, 151, 101, 97, 97
      }
    },
    {
      type = "tilelayer",
      id = 6,
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 7,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 169, 0, 0,
        0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0,
        0, 0, 217, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 121, 121,
        0, 0, 0, 0, 170, 0, 0,
        0, 0, 0, 186, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
