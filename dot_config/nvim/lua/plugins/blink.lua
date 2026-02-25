-- [[ blink.cmp ]]

return {
  "saghen/blink.cmp",
  event = "VeryLazy",
  dependencies = {
    { -- Snipped Engine
      "L3MON4D3/LuaSNip",
    },
  },
  opts = {
    keymap = {
      -- INFO: "super-tab" and "enter" are other possiblilities
      --   but we want to go with the original vim bindings.
      --   see `:help ins-completion'
      preset = "default",
    },
    appearance = {
      -- "mono" for the "Nerd Font Mono" variants, "normal" for the regular "Nerd Font"
      nerd_font_variant = "mono",
    },
    completion = {
      -- By default, press <Space-c> for documentation.
      -- Or enable the following to auto-show it.
      documentation = {
        auto_show = false,
        auto_show_dealy_ms = 500,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets" },
    },
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "lua" },
    signature = { enabled = true },
  },
}
