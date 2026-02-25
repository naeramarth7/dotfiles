-- Set <space> as leader key.
--  NOTE: Must happen before plugins are loaded.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See ``:help vim.o`

-- Show line numbers.
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, might be useful e.g. for resizing splits.
-- vim.o.mouse = 'a'

vim.o.showmode = false

-- Sync clipboard with OS.
--  Sheduled to not affect startup-time.
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Keep indentation when breaking long lines.
vim.o.breakindent = true

-- Save undo history.
vim.o.undofile = true

-- Case-insenstive search unless \C or capital letters are used.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Always show sign column.
vim.o.signcolumn = "yes"

-- Time without change until swapfile is written.
vim.o.updatetime = 500

-- Timeout for mapped sequences.
vim.o.timeoutlen = 300

-- Directions to open new slits.
vim.o.splitright = true
vim.o.splitbelow = true

-- Configure display of whitespace characters.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live.
vim.o.inccommand = "split"

-- Highlight line the cursor is on.
vim.o.cursorline = true

-- Minimal number of lines before / after cursor to be displayed.
-- Very high number results in center always being centered.
vim.o.scrolloff = 10

-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text when yanking",
  group = vim.api.nvim_create_augroup("core-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
