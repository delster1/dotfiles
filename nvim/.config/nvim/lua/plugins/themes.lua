return {
{
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup({
      -- Your config here
    })
  end,
},
{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
,{ "EdenEast/nightfox.nvim" }, -- lazy
{
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'darker'
    }
    -- Enable theme
    require('onedark').load()
  end
},
 {
	"rose-pine/neovim",
  variant = "moon",
	name = "rose-pine",
},
{
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
},
{
  'everviolet/nvim', name = 'evergarden',
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  opts = {
    theme = {
      variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
      accent = 'green',
    },
    editor = {
      transparent_background = false,
      sign = { color = 'none' },
      float = {
        color = 'mantle',
        solid_border = false,
      },
      completion = {
        color = 'surface0',
      },
    },
  }
},
{
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load()
    end
  },
  { "Mofiqul/dracula.nvim" },
}
