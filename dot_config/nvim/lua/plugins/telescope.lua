-- [[ nvim-telescope ]]
-- Fuzzy finder.

local Keymap = require("core.lib.keymap")

return {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    "folke/which-key.nvim",
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require("telescope").setup({
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
    })

    require("which-key").add({
      { "<leader>s", group = "[S]earch", mode = { "n" } },
    })

    -- Enable extensions
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.buildin`
    local builtin = require("telescope.builtin")
    Keymap.n("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
    Keymap.n("<leader>sf", builtin.find_files, "[S]earch [F]iles")
    Keymap.n("<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
    Keymap.n("<leader>sb", builtin.builtin, "[S]earch Telescope [B]uiltins")
    Keymap.n("<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
    Keymap.n("<leader>sr", builtin.resume, "[S]earch [R]esume")
    Keymap.n("<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
    Keymap.n("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
    Keymap.n("<leader>s.", builtin.oldfiles, "[S]earch] recent Files")
    Keymap.n("<leader>sc", builtin.commands, "[S]earch [C]ommands")
    Keymap.n("<leader><leader>", builtin.buffers, "[ ] Find existing Buffers")

    Keymap.n("<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        -- winblend = 10,
        previewer = false,
      }))
    end, "[/] Fuzzy find in current buffer")

    Keymap.n("<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, "[S]earch [/] in Open Files")

    Keymap.n("<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, "[S]earch [N]eovim Files")

    -- Use Telescope in combination with LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
      callback = function(event)
        local buf = event.buf

        Keymap.n("grr", builtin.lsp_references, "[G]o to [R]eferences", buf)
        Keymap.n("gri", builtin.lsp_references, "[G]o to [Implementation", buf)
        Keymap.n("grd", builtin.lsp_definitions, "[G]o to [D]efinition", buf)
        Keymap.n("grt", builtin.lsp_type_definitions, "[G]o to [T]ype Definition", buf)

        -- Fuzzy find all symbols in current document/ workspace.
        Keymap.n("gD", builtin.lsp_document_symbols, "Open [D]ocument Symbols", buf)
        Keymap.n("gW", builtin.lsp_dynamic_workspace_symbols, "Open [W]orkspace Symbols", buf)
      end,
    })
  end,
}
