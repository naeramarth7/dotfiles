-- [[ nvim-treesitter ]]
--  Highlight, edit and navigate code

return {
  "nvim-treesitter/nvim-treesitter",
  lazu = false,
  build = ":TSUpdate",
  config = function()
    local filetypes = {
      "bash",
      "c",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "typescript",
      "vim",
      "vimdoc",
    }
    require("nvim-treesitter").install(filetypes)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        -- vim.treesitter.start()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
