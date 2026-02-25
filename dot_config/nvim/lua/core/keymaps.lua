local Bind = require("core.lib.keymap")

-- [[ Normal Mode ]]

-- Clear search highlights on <Esc>
Bind.n("<Esc>", "<cmd>nohlsearch<CR>")

-- Disable arrow keys in normal mode
Bind.n("<left>", '<cmd>echo "Use h to move!"<CR>')
Bind.n("<right>", '<cmd>echo "Use l to move!"<CR>')
Bind.n("<up>", '<cmd>echo "Use k to move!"<CR>')
Bind.n("<down>", '<cmd>echo "Use j to move!"<CR>')

-- Navigate splits with C+hjkl
Bind.n("<C-h>", "<C-w><C-h>", "Move focus to left split")
Bind.n("<C-l>", "<C-w><C-l>", "Move focus to right split")
Bind.n("<C-j>", "<C-w><C-j>", "Move focus to lower split")
Bind.n("<C-k>", "<C-w><C-k>", "Move focus to upper split")

Bind.n("<leader>ex", vim.cmd.Ex, "Show to [Ex]plorer")

-- [[ Terminal Mode ]]

-- Easy escape from terminal mode
Bind.t("<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
