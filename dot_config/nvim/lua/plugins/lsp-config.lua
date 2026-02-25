-- [[ lspconfig ]]
--   Language support via LSP (Language Server Protocol).
--   - Go to definitions
--   - Find references
--   - Autocompletion
--   - Symbol Search
--   - etc.

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- INFO: programs.nix-ld.enable needs to be set to allow the binaries
    --   installed by mason to work on NixOS.
    { "mason-org/mason.nvim", opts = {} },
    { "mason-org/mason-lspconfig.nvim", opts = {} },
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Extensible UI for Neovim notifications and LSP progress messages.
    { "j-hui/fidget.nvim", opts = {} },

    -- Performant, batteries-included completion plugin for Neovim
    "saghen/blink.cmp",
  },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lspconfig-lsp-attach", { clear = true }),
      callback = function(event)
        -- Define a `map` method for easier keymaps.
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Rename variable, usually works across files
        map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action
        -- Cursor needs to be on top of an error or suggestion
        map("gra", vim.lsp.buf.code_action, "[G]o to Code [A]ction", { "n", "x" })

        -- WARN: This is Go to Declaration, not Definition
        map("grD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")

        -- Highlight references of current word under cursor if resting on it
        --   Clear after moving on.
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("tetxDocument/documentHighlight", event.buf) then
          local highlight_augroup_name = "lspconfig-lsp-highlight"
          local highlight_augroup = vim.api.nvim_create_augroup(highlight_augroup_name, { clear = false })

          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          -- Cleanup.
          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("lspconfig-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = highlight_augroup_name, buffer = event2.buf })
            end,
          })
        end

        -- Toggle to display inlay hints
        if client and client:supports_method("textDocument/inlayHint", event.buf) then
          map("<leader>t", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ buffer = event.buf }))
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    -- Additional LSP capabilities via blink.cmp
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- List of language servers to be enabled
    local servers = {
      ts_ls = {},
    }

    -- Install above listed language servers and some additional tools
    --   g? for help in the menu
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "lua_ls",
      "stylua",
    })

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    for name, server in pairs(servers) do
      server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      vim.lsp.config(name, server)
      vim.lsp.enable(name)
    end

    -- Special Lua config as recommended by neovim help docs
    vim.lsp.config("lua_ls", {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath("config")
            and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
            path = { "lua/?.lua", "lua/?/init.lua" },
          },
          workspace = {
            checkThirdParty = false,
            -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
            --  See https://github.com/neovim/nvim-lspconfig/issues/3189
            library = vim.api.nvim_get_runtime_file("", true),
          },
        })
      end,

      settings = {
        Lua = {},
      },
    })

    vim.lsp.enable("lua_ls")
  end,
}
