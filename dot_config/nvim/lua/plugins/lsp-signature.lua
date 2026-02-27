return {
  "ray-x/lsp_signature.nvim",
  after = "nvim-lspconfig",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded",
    },
  },
}
