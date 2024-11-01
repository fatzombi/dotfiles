-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
function TogglePlugin()
  -- Get all the loaded plugins
  local plugins = require("lazy").plugins

  local plugin = plugins["copilot"]
  if plugin == nil then
    return
  end

  if plugin.enabled then
    plugin:disable()
    -- require("notify")("Disabled plugin: " .. plugin_name, "info")
  else
    plugin:enable()
    -- require("notify")("Enabled plugin: " .. plugin_name, "info")
  end
end

vim.api.nvim_set_keymap("n", "<leader>tcp", ":lua TogglePlugin()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>tcp", ":lua TogglePlugin('copilot')<CR>", { noremap = true, silent = true })
