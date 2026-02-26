-- Use `lazy.vim` as plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.treesitter" },
  { import = "plugins.telescope" },
  { import = "plugins.which-key" },
  { import = "plugins.guess-indent" },
  { import = "plugins.gitsigns" },
  { import = "plugins.todo-comments" },
  { import = "plugins.lsp-config" },
  { import = "plugins.conform" },
  { import = "plugins.blink" },
  { import = "plugins.mini" },
  { import = "plugins.autopairs" },
  { import = "plugins.neo-tree" },
  { import = "plugins.dap" },

  -- Language-specific configurations
  { import = "plugins.lang.lua" },
  { import = "plugins.lang.typescript" },

  { import = "plugins.colors-ayu" },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
