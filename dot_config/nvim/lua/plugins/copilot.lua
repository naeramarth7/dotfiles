return {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    -- Determine auth provider URL based on current workspace
    local function get_auth_provider_url()
      local cwd = vim.fn.getcwd()
      local home = vim.fn.expand("~")
      local bmw_path = home .. "/Projects/MW/BMW"

      -- Check if current working directory is within BMW projects
      if string.find(cwd, bmw_path, 1, true) then
        return "https://bmw.ghe.com"
      end

      -- Default to GitHub.com
      return "https://github.com"
    end

    require("copilot").setup({
      auth_provider_url = get_auth_provider_url(),
    })
    require("copilot").setup({})
  end,
}
