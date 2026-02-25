return {
  -- List available color schemes with `:Telescope colorscheme`.
  "Shatur/neovim-ayu",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    local colors = require("ayu.colors")
    colors.generate(false)

    require("ayu").setup({
      mirage = false,
      terminal = true,
      overrides = {
        Comment = { italic = false },

        Normal = { bg = "None" },
        NormalFloat = { bg = "none" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        VertSplit = { bg = "None" },

        StatusLine = { bg = "None" },
        StatusLineNc = { bg = "None" },

        MiniStatusLineDevinfo = { bg = "None" },
        MiniStatuslineFilename = { bg = "None" },
        MiniStatuslineFileinfo = { bg = "None" },
        MiniStatuslineInactive = { bg = "None" },

        LineNr = { fg = colors.guide_active },
      },
    })

    vim.cmd.colorscheme("ayu")

    -- require("lualine").setup({
    --   options = {
    --     theme = "ayu",
    --   },
    -- })
  end,
}
