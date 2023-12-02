---@type NvPluginSpec[]
local plugins = {
    -- Native LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "custom.configs.lspconfig"
        end,
        dependencies = {
            -- Package Installer
            {
                "williamboman/mason.nvim",
                init = function()
                    require("core.utils").load_mappings "Mason"
                    require("core.utils").load_mappings "LSP"
                end,
                cmd = {
                    "Mason",
                    "MasonInstall",
                    "MasonInstallAll",
                    "MasonUpdate",
                    "MasonUninstall",
                    "MasonUninstallAll",
                    "MasonLog",
                },
                opts = require "custom.configs.mason",
                dependencies = "williamboman/mason-lspconfig.nvim",
            },
        },
    },
}

return plugins
