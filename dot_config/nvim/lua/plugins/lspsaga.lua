return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  after = "nvim-lspconfig",
  config = function()
    require("lspsaga").setup({
      outline = {
        win_position = "right",
        win_width = 40,
        close_after_jump = true,
      },
      finder = {
        keys = {
          toggle_or_open = { "e", "o" },
        },
      },
      lightbulb = {
        sign = false,
      },
    })

    vim.keymap.set({ "n", "v" }, "<Bar>", ":Lspsaga outline<CR>", { desc = "Show LspSaga Outline" })
    vim.keymap.set("n", "<Leader>ci", ":Lspsaga incoming_calls<CR>", { desc = "[C]alls [I]ncoming" })
    vim.keymap.set("n", "<Leader>co", ":Lspsaga outgoing_calls<CR>", { desc = "[C]alls [O]utgoing" })
    vim.keymap.set("n", "<Leader>ca", ":Lspsaga code_action<CR>", { desc = "[C]ode [A]ctions" })

    vim.keymap.set("n", "<Leader>sd", ":Lspsaga peek_definition<CR>", { desc = "[S]how [D]efinition" })
    vim.keymap.set("n", "gtd", ":Lspsaga goto_definition<CR>", { desc = "[G]o [t]o [D]efinition" })
    vim.keymap.set("n", "gtt", ":Lspsaga goto_type_definition<CR>", { desc = "[G]o [t]o [T]ype Definition" })

    vim.keymap.set("n", "fr", ":Lspsaga finder<CR>", { desc = "[F]ind [R]eferences" })

    vim.keymap.set("n", "<C-t>", ":Lspsaga term_toggle<CR>", { desc = "Toggle [T]erminal" })

    vim.keymap.set("n", "<Leader>rn", ":Lspsaga rename<CR>", { desc = "[R]e[n]ame" })
  end,
}
