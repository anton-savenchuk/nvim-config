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
            -- Improve Other LSP Functionalities
            {
                "nvimdev/lspsaga.nvim",
                init = function()
                    require("core.utils").load_mappings "Lspsaga"
                end,
                opts = require "custom.configs.lspsaga",
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

    -- Pretty Diagnostics and Lists
    {
        "folke/trouble.nvim",
        init = function()
            require("core.utils").load_mappings "Trouble"
        end,
        cmd = { "TroubleToggle", "Trouble" },
        opts = require "custom.configs.trouble",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- Highlight, List and Search Todo comments in your projects
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoLocList", "TodoQuickFix", "TodoTelescope" },
        opts = require "custom.configs.todo-comments",
    },

    -- Manage Projects
    {
        "ahmedkhalf/project.nvim",
        opts = require "custom.configs.project",
        event = "VeryLazy",
        config = function(_, opts)
            require("project_nvim").setup(opts)
        end,
    },

    -- Sessions
    {
        "olimorris/persisted.nvim",
        init = function()
            require("core.utils").load_mappings "Sessions"
        end,
        opts = {
            save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
            silent = false,                                                  -- silent nvim message when sourcing session file
            use_git_branch = true,                                           -- create session files based on the branch of the git enabled repository
            autosave = false,                                                -- automatically save session files when exiting Neovim
            should_autosave = nil,                                           -- function to determine if a session should be autosaved
            autoload = false,                                                -- automatically load the session for the cwd on Neovim startup
            on_autoload_no_session = nil,                                    -- function to run when `autoload = true` but there is no session to load
            follow_cwd = true,                                               -- change session file name to match current working directory if it changes
            allowed_dirs = nil,                                              -- table of dirs that the plugin will auto-save and auto-load from
            ignored_dirs = nil,                                              -- table of dirs that are ignored when auto-saving and auto-loading
            telescope = {                                                    -- options for the telescope extension
                reset_prompt_after_deletion = true,                          -- whether to reset prompt after session deleted
            },
        },
    },

    -- Fuzzy Finder
    {
        "nvim-telescope/telescope.nvim",
        init = function()
            require("core.utils").load_mappings "Telescope"
        end,
        opts = function()
            require "custom.configs.telescope"
        end,
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                enabled = function()
                    return vim.fn.executable "make" == 1
                end,
            },
        },
    },

    -- Keymaps Popup
    {
        "folke/which-key.nvim",
        opts = {
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "", -- symbol prepended to a group
            },
        },
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "whichkey")
            require("which-key").setup(opts)
            require("which-key").register {
                {
                    ["<leader>"] = {
                        d = { name = "󰃤 Debugger" },
                        s = { name = "󰔚 Sessions" },
                        f = { name = " Find" },
                        g = { name = "󰊢 Git" },
                        l = { name = " LSP" },
                        o = { name = " Options" },
                        p = { name = " Plugins" },
                        t = { name = " Terminal" },
                    },
                },
            }
        end,
    },
}

return plugins
