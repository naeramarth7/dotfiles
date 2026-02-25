local Keymap = {}

function Keymap.n(key, cmd, desc, buffer)
  vim.keymap.set("n", key, cmd, { desc = desc, buffer = buffer })
end

function Keymap.t(key, cmd, desc, buffer)
  vim.keymap.set("t", key, cmd, { desc = desc, buffer = buffer })
end

return Keymap
