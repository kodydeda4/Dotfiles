-- Github
-- return {
--   'projekt0n/github-nvim-theme',
--   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('github-theme').setup({
--       -- ...
--     })
--
--     vim.cmd('colorscheme github_dark_default')
--     -- vim.cmd('colorscheme github_dark_high_contrast')
--   end,
-- }

-- Catpuccin
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      show_end_of_line_buffer = false,
      transparent_background = true,
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 1
      },
      no_italic = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
      custom_highlights = function(colors)
        local searchActive = { bg = colors.red, fg = "#181825" }
        local searchInactive = { bg = colors.peach, fg = "#000000" }

        return {
          CursorLineNr = { fg = colors.flamingo },
          Search = searchInactive,
          IncSearch = searchActive,
          EndOfBuffer = { fg = colors.flamingo },
          WinSeparator = { fg = colors.surface0, bg = colors.surface0 },
        }
      end,
    })

    vim.cmd([[colorscheme catppuccin]])
  end,
}
