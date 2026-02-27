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
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets" },
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "lua" },
    signature = {
      enabled = false,
      trigger = {
        show_on_trigger_character = true,
        show_on_insert = true,
        show_on_insert_on_trigger_character = true,
      },
      window = {
        show_documentation = true,
        treesitter_highlighting = true,
      },
    },
  },
}
