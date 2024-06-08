-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.NvimReplaceLoaded then
  return
end

_G.NvimReplaceLoaded = true

-- Useful if you want your plugin to be compatible with older (<0.7) neovim versions
if vim.fn.has("nvim-0.7") == 0 then
  vim.cmd("command! NvimReplace lua require('nvim-replace').toggle()")
else
  vim.api.nvim_create_user_command("NvimReplace", function()
    require("nvim-replace").toggle()
  end, {})
end
