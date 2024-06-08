local M = require("nvim-replace.main")
local C = require("nvim-replace.config")

local NvimReplace = {}

--- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function NvimReplace.toggle()
  if _G.NvimReplace.config == nil then
    _G.NvimReplace.config = C.options
  end

  M.toggle("publicAPI_toggle")
end

--- Initializes the plugin, sets event listeners and internal state.
function NvimReplace.enable()
  if _G.NvimReplace.config == nil then
    _G.NvimReplace.config = C.options
  end

  M.enable("publicAPI_enable")
end

--- Disables the plugin, clear highlight groups and autocmds, closes side buffers and resets the internal state.
function NvimReplace.disable()
  M.disable("publicAPI_disable")
end

-- setup NvimReplace options and merge them with user provided ones.
function NvimReplace.setup(opts)
  _G.NvimReplace.config = C.setup(opts)
end

_G.NvimReplace = NvimReplace

print("Hello World")

return _G.NvimReplace
