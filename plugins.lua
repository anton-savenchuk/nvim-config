---@type NvPluginSpec[]
local plugins = {
    -- Native LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "custom.configs.lspconfig"
        end,
        dependencies = {
            -- Formatting
            {
                "jose-elias-alvarez/null-ls.nvim",
                ft = { "python" },
                opts = function()
                    return require "custom.configs.null-ls"
                end,
            },
            -- Linting
            {
                "mfussenegger/nvim-lint",
                enabled = false,
                config = function()
                    require "custom.configs.nvim-lint"
                end,
            },
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
