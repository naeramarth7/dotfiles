return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        lua_ls = {
          on_init = function(client)
            -- Check if project has its own Lua configuration
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              -- Skip auto-configuration if:
              -- 1. This is the nvim config directory itself
              -- 2. Project has .luarc.json/.luarc.jsonc
              if
                path ~= vim.fn.stdpath("config")
                and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
              then
                return
              end
            end

            -- Auto-configure for Neovim Lua development
            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
              runtime = {
                version = "LuaJIT",
                path = { "lua/?.lua", "lua/?/init.lua" },
              },
              workspace = {
                checkThirdParty = false,
                -- NOTE: Loading full runtime library is slower and can cause issues
                --   when working on your own nvim configuration.
                --   See: https://github.com/neovim/nvim-lspconfig/issues/3189
                library = vim.api.nvim_get_runtime_file("", true),
              },
            })
          end,

          settings = {
            Lua = {},
          },
        },
      },
    },
  },
}
