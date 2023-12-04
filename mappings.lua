---@type MappingsTable

local M = {
    Mason = {
        plugin = true,
        n = {
            ["<leader>lm"] = { "<cmd>Mason<cr>", "Mason Installer", opts = { silent = true } },
        },
    },

    LSP = {
        plugin = true,
        n = {
            ["<leader>lf"] = { "<cmd>Format<cr>", "Format", opts = { silent = true } },
            ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info", opts = { silent = true } },
            ["<leader>lR"] = { "<cmd>LspRestart<cr>", "Restart", opts = { silent = true } },
        },
        v = {
            ["<leader>lf"] = { "<cmd>Format<cr>", "Format", opts = { silent = true } },
        },
    },

    NvimTree = {
        plugin = true,
        n = {
            ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer", opts = { silent = true } },
        },
    },
}

return M
