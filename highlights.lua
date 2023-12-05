-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
    Comment = {
        italic = true,
    },
    LspReferenceRead = { link = "Underlined" },
    LspReferenceText = { link = "Underlined" },
    LspReferenceWrite = { link = "Underlined" },
}

---@type HLTable
M.add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
    DiffviewDiffAdd = { fg = "black", bg = "green" },
    DiffviewDiffChange = { fg = "black", bg = "light_grey" },
    DiffviewDiffModified = { fg = "black", bg = "orange" },
    DiffviewDiffDelete = { fg = "black", bg = "red" },
    DiffviewDiffAddAsDelete = { fg = "black", bg = "red" },
}

return M
