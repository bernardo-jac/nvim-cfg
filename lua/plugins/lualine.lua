return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', },
    config = function()
      require("lualine").setup {
        options = { 
          theme = require("lualine.themes.ayu_mirage"),
          icons_enabled = true
        },
        sections = {
          lualine_a = {
            {
              'filename',
              path = 1
            },
          },
        },
      }
    end
  },
}
