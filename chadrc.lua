---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
    theme = "gruvbox",
    theme_toggle = { "gruvbox", "gruvbox_light" },
    lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
    hl_override = highlights.override,
    hl_add = highlights.add,
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
