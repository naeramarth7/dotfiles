-- [[ Nix Language Configuration ]]
--   LSP, formatting, and other Nix-specific settings

return {
  require("plugins.lang.nix.lsp-config"),
  require("plugins.lang.nix.conform"),
}
