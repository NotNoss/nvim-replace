local D = require("nvim-replace.util.debug")

local State = { enabled = false }

---Sets the state to its original value.
---
---@private
function State:init()
  self.enabled = false
end

---Saves the state in the global _G.NvimReplace.state object.
---
---@private
function State:save()
  D.log("state.save", "saving state globally to _G.NvimReplace.state")

  _G.NvimReplace.state = self
end

---Whether the NvimReplace is enabled or not.
---
---@private
function State:setEnabled()
  self.enabled = true
end

---Whether the NvimReplace is enabled or not.
---
---@return boolean: the `enabled` state value.
---@private
function State:getEnabled()
  return self.enabled
end

return State
