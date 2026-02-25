local Keymap = require("core.lib.keymap")

-- Diagnostic config.
--  see `:help vim.diagnostic.Opts`
vim.diagnostic.config({
  update_in_insert = true,
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },

  virtual_text = trye, -- Text shows at end of the line
  virtual_lines = false, -- Text shows as additional line below

  jump = { float = true },
})

Keymap.n("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")
