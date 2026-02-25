-- [[ neo-tree ]]
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lu/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional
  },
  lazy = false,
  keys = {
    { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
  },
  opts = {
    filesystem = {
      follow_current_file = { enabled = true },
      filtered_items = {
        visible = true,
      },
      hijack_netrw_behavior = "open_current",
      window = {
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
    buffers = {
      follow_current_file = { enabled = true },
    },
  },
}
