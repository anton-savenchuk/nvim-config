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

    -- Debugging
    {
        "rcarriga/nvim-dap-ui",
        init = function()
            require("core.utils").load_mappings "Dap"
        end,
        dependencies = {
            {
                "mfussenegger/nvim-dap",
                config = function()
                    -- NOTE: Check out this for guide
                    -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
                    local dap = require "dap"
                    vim.fn.sign_define("DapBreakpoint",
                        { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

                    local dapui = require "dapui"
                    dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open()
                    end

                    -- dap.listeners.before.event_terminated["dapui_config"] = function()
                    --   dapui.close()
                    -- end

                    -- dap.listeners.before.event_exited["dapui_config"] = function()
                    --   dapui.close()
                    -- end

                    -- NOTE: Make sure to install the needed files/exectubles through mason
                    require "custom.configs.dap.settings.debugpy"
                end,
            },
        },
        opts = require "custom.configs.dap.ui",
    },

    -- Git Signs
    {
        "lewis6991/gitsigns.nvim",
        init = function()
            require("core.utils").load_mappings "Git"
            -- load gitsigns only when a git file is opened
            vim.api.nvim_create_autocmd({ "BufRead" }, {
                group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
                callback = function()
                    vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
                    if vim.v.shell_error == 0 then
                        vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                        vim.schedule(function()
                            require("lazy").load { plugins = { "gitsigns.nvim" } }
                        end)
                    end
                end,
            })
        end,
    },

    -- Show diffs
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
    },

    -- Terminal Integration
    {
        "akinsho/toggleterm.nvim",
        init = function()
            require("core.utils").load_mappings "Toggleterm"
        end,
        cmd = {
            "ToggleTerm",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualLines",
            "ToggleTermSendVisualSelection",
        },
        opts = require "custom.configs.toggleterm",
    },
}

return plugins
