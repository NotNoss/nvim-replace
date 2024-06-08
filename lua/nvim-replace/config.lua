local D = require("nvim-replace.util.debug")

local NvimReplace = {}

--- Your plugin configuration with its default values.
---
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
NvimReplace.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
}

---@private
local defaults = vim.deepcopy(NvimReplace.options)

--- Defaults NvimReplace options by merging user provided options with the default plugin values.
---
---@param options table Module config table. See |NvimReplace.options|.
---
---@private
function NvimReplace.defaults(options)
    local tde = function(t1, t2)
        return vim.deepcopy(vim.tbl_deep_extend("keep", t1 or {}, t2 or {}))
    end

    NvimReplace.options = tde(options, defaults)

    -- let your user know that they provided a wrong value, this is reported when your plugin is executed.
    assert(
        type(NvimReplace.options.debug) == "boolean",
        "`debug` must be a boolean (`true` or `false`)."
    )

    return NvimReplace.options
end

--- Define your nvim-replace setup.
---
---@param options table Module config table. See |NvimReplace.options|.
---
---@usage `require("nvim-replace").setup()` (add `{}` with your |NvimReplace.options| table)
function NvimReplace.setup(options)
    NvimReplace.options = NvimReplace.defaults(options or {})

    -- Useful for later checks that requires nvim 0.9 features at runtime.
    NvimReplace.options.hasNvim9 = vim.fn.has("nvim-0.9") == 1

    D.warnDeprecation(NvimReplace.options)

    return NvimReplace.options
end

return NvimReplace
