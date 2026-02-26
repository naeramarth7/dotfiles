return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = "DEBUG", -- or "TRACE"
      },
    },
    config = function()
      -- Function to determine which adapter to use based on current workspace
      local function select_adapter()
        local cwd = vim.loop.cwd() or ""
        local home = os.getenv("HOME") or ""
        local mw_bmw_path = home .. "/Projects/MW/BMW"
        if cwd:sub(1, #mw_bmw_path) == mw_bmw_path then
          return "copilot"
        else
          return "anthropic"
        end
      end

      local adapter = select_adapter()
      require("codecompanion").setup({
        chat = {
          adapter = adapter,
        },
        inline = {
          adapter = adapter,
        },
        cmd = {
          adapter = adapter,
        },
      })
    end,
  },
}
