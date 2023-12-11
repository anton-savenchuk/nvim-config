---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
    theme = "gruvbox",
    theme_toggle = { "gruvbox", "gruvbox_light" },
    lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
    hl_override = highlights.override,
    hl_add = highlights.add,
    telescope = { style = "borderless" }, -- borderless / bordered
    nvdash = {
        load_on_startup = true,
        buttons = {
            { "  Find File", "Spc f f", "Telescope find_files" },
            { "󰈚  Recent Files", "Spc f r", "Telescope oldfiles" },
            { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
            { "  Find Projects", "Spc f p", "Telescope projects" },
            { "󰔚  Find Sessions", "Spc f s", "Telescope persisted" },
            { "  Themes", "Spc f t", "Telescope themes" },
            { "  Mappings", "Spc n c", "NvCheatsheet" },
        },
    },
    cheatsheet = { theme = "grid" }, -- simple/grid
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
