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

    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        init = function()
            require("core.utils").load_mappings "NvimTree"
        end,
        cmd = {
            "NvimTreeOpen",
            "NvimTreeToggle",
            "NvimTreeFocus",
            "NvimTreeFindFile",
            "NvimTreeFindFileToggle",
        },
        opts = require "custom.configs.nvim-tree",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- Syntax Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = {
            "TSInstall",
            "TSUninstall",
            "TSInstallInfo",
            "TSUpdate",
            "TSBufEnable",
            "TSBufDisable",
            "TSEnable",
            "TSDisable",
            "TSModuleInfo",
            "TSToggle",
            "TSBufToggle",
        },
        opts = require "custom.configs.treesitter",
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "syntax")
            require("nvim-treesitter.configs").setup(opts)
        end,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },

}

return plugins
