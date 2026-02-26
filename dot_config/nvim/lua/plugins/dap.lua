return {
  -- https://codeberg.org/mfussenegger/nvim-dap
  "mfussenegger/nvim-dap",

  opts = {
    -- Language-specific DAP adapters and configurations
    -- Extended by plugins/lang/*/dap-config.lua
    adapters = {},
    configurations = {},
  },

  dependencies = {
    -- Creates a beautiful debugger UI
    -- https://github.com/rcarriga/nvim-dap-ui
    "rcarriga/nvim-dap-ui",

    -- Required dependency for nvim-dap-ui
    -- https://github.com/nvim-neotest/nvim-nio
    "nvim-neotest/nvim-nio",

    -- Syntax highlight for repl buffer
    {
      "LiadOz/nvim-dap-repl-highlights",
      config = function()
        require("nvim-dap-repl-highlights").setup()
      end,
    },

    -- Inline display of variable values
    {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup({
          -- commented = true,
          -- all_references = true,
          -- virt_text_pos = 'eol',
        })
      end,
    },

    -- Add your own debuggers here
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<F1>",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<F2>",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<F3>",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>B",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Debug: Set Breakpoint",
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      "<F7>",
      function()
        require("dapui").toggle()
      end,
      desc = "Debug: See last session result.",
    },
  },
  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Register language-specific DAP adapters from opts
    for name, adapter in pairs(opts.adapters or {}) do
      dap.adapters[name] = adapter
    end

    -- Load language-specific DAP configurations from opts
    for lang, configs in pairs(opts.configurations or {}) do
      dap.configurations[lang] = configs
    end
  end,
}
