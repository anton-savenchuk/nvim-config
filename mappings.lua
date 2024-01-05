---@type MappingsTable
local cwd = vim.fn.stdpath "config" .. "/"
local config_dir = { cwd }

local M = {
    Mason = {
        plugin = true,
        n = {
            ["<leader>lj"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic", opts = { silent = true }, },
            ["<leader>lk"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic", opts = { silent = true }, },
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

    Lspsaga = {
        plugin = true,
        n = {
            ["<leader>la"] = { "<cmd>Lspsaga code_action<cr>", "Code Action", opts = { silent = true } },
            ["<leader>lo"] = { "<cmd>Lspsaga outline<cr>", "Code Outline", opts = { silent = true } },
            ["<leader>lI"] = { "<cmd>Lspsaga incoming_calls<cr>", "Incoming Calls", opts = { silent = true } },
            ["<leader>lO"] = { "<cmd>Lspsaga outgoing_calls<cr>", "Outgoing Calls", opts = { silent = true } },
            ["<leader>lr"] = { "<cmd>Lspsaga rename<cr>", "Rename", opts = { silent = true } },
        },
        v = {
            ["<leader>la"] = { "<cmd>Lspsaga code_action<cr>", "Code Action", opts = { silent = true } },
        },
    },

    NvimTree = {
        plugin = true,
        n = {
            ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer", opts = { silent = true } },
        },
    },

    Dap = {
        plugin = true,
        n = {
            ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue", opts = { silent = true } },
            ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over", opts = { silent = true } },
            ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into", opts = { silent = true } },
            ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out", opts = { silent = true } },
            ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint", opts = { silent = true } },
            ["<leader>dB"] = {
                "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
                "Breakpoint Condition",
                opts = { silent = true },
            },
            ["<leader>dd"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Dap UI", opts = { silent = true } },
            ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last", opts = { silent = true } },
        },
    },

    Git = {
        plugin = true,
        n = {
            ["<leader>gg"] = {
                function()
                    ClickGit()
                end,
                "Lazygit",
                opts = { silent = true },
            },
            ["<leader>gj"] = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk", opts = { silent = true } },
            ["<leader>gk"] = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk", opts = { silent = true } },
            ["<leader>gl"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame", opts = { silent = true } },
            ["<leader>gp"] = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk", opts = { silent = true } },
            ["<leader>gr"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk", opts = { silent = true } },
            ["<leader>gR"] = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer", opts = { silent = true } },
            ["<leader>gs"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk", opts = { silent = true } },
            ["<leader>gu"] = {
                "<cmd>lua reguire 'gitsigns'.undo_stage_hunk()<cr>",
                "Undo Stgge Hunk",
                opts = { silent = true },
            },
            ["<leader>gd"] = {
                function()
                    if next(require("diffview.lib").views) == nil then
                        vim.cmd "DiffviewOpen"
                    else
                        vim.cmd "DiffviewClose"
                    end
                end,
                "Toggle Diffview",
                opts = { silent = true },
            },
        },
    },

    Toggleterm = {
        plugin = true,
        n = {
            ["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", "Float Terminal", opts = { silent = true } },
            ["<leader>th"] = {
                "<cmd>ToggleTerm direction=horizontal<cr>",
                "Horizontal Terminal",
                opts = { silent = true },
            },
            ["<leader>tv"] = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical Terminal", opts = { silent = true } },
        },
    },

    Trouble = {
        plugin = true,
        n = {
            ["<leader>lb"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Buffer Diagnostics", opts = { silent = true } },
            ["<leader>lw"] = {
                "<cmd>TroubleToggle workspace_diagnostics<cr>",
                "Workspace Diagnostics",
                opts = { silent = true },
            },
            ["<leader>fT"] = { "<cmd>TodoTrouble<cr>", "Todo", opts = { silent = true } },
        },
    },

    Sessions = {
        plugin = true,
        n = {
            ["<leader>ss"] = { "<cmd>SessionStart<cr>", "Start", opts = { silent = true } },
            ["<leader>so"] = { "<cmd>SessionStop<cr>", "Stop", opts = { silent = true } },
            ["<leader>st"] = { "<cmd>SessionToggle<cr>", "Toggle", opts = { silent = true } },
            ["<leader>sl"] = { "<cmd>SessionLoad<cr>", "Load", opts = { silent = true } },
            ["<leader>sd"] = { "<cmd>SessionDelete<cr>", "Delete", opts = { silent = true } },
        },
    },

    Telescope = {
        plugin = true,
        n = {
            ["<leader>fa"] = { "<cmd>Telescope autocommands<cr>", "Autocommmands", opts = { silent = true } },
            ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Files", opts = { silent = true } },
            ["<leader>fs"] = { "<cmd>Telescope persisted<cr>", "Sessions", opts = { silent = true } },
            ["<leader>fm"] = { "<cmd>Telescope marks<cr>", "Marks", opts = { silent = true } },
            ["<leader>fM"] = { "<cmd>Telescope man_pages<cr>", "Man Pages", opts = { silent = true } },
            ["<leader>fw"] = { "<cmd>Telescope live_grep<cr>", "Word", opts = { silent = true } },
            ["<leader>ft"] = { "<cmd>Telescope themes<cr>", "Themes", opts = { silent = true } },
            ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Buffers", opts = { silent = true } },
            ["<leader>fn"] = {
                "<cmd>lua require('telescope').extensions.notify.notify()<cr>",
                "Notify History",
                opts = { silent = true },
            },
            ["<leader>fp"] = { "<cmd>Telescope projects<cr>", "Projects", opts = { silent = true } },
            ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help", opts = { silent = true } },
            ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps", opts = { silent = true } },
            ["<leader>fC"] = { "<cmd>Telescope commands<cr>", "Commands", opts = { silent = true } },
            ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent Files", opts = { silent = true } },
            ["<leader>fH"] = { "<cmd>Telescope highlights<cr>", "Highlights", opts = { silent = true } },
            ["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Buffer Symbols", opts = { silent = true } },
            ["<leader>lS"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols", opts = { silent = true } },
            ["<leader>go"] = { "<cmd>Telescope git_status<cr>", "Open changed file", opts = { silent = true } },
            ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch", opts = { silent = true } },
            ["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit", opts = { silent = true } },
        },
    },

    Neovim = {
        n = {
            ["<leader>nf"] = {
                function()
                    require("telescope.builtin").find_files {
                        prompt_title = "Config Files",
                        search_dirs = config_dir,
                        cwd = cwd,
                    }
                end,
                "Find Config Files",
                opts = { silent = true },
            },
            ["<leader>ng"] = {
                function()
                    require("telescope.builtin").live_grep {
                        prompt_title = "Config Files",
                        search_dirs = config_dir,
                        cwd = cwd,
                    }
                end,
                "Grep Config Files",
                opts = { silent = true },
            },
            ["<leader>nc"] = { "<cmd>NvCheatsheet<cr>", "Cheatsheet", opts = { silent = true }, },
            ["<leader>ni"] = {
                function()
                    if vim.fn.has "nvim-0.9.0" == 1 then
                        vim.cmd "Inspect"
                    else
                        vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN,
                            { title = "Inspect" })
                    end
                end,
                "Inspect",
                opts = { silent = true },
            }, -- only available on neovim >= 0.9
            ["<leader>nm"] = { "<cmd>messages<cr>", "Messages", opts = { silent = true } },
            ["<leader>nh"] = { "<cmd>checkhealth<cr>", "Health", opts = { silent = true } },
            ["<leader>nv"] = {
                function()
                    local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                    return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
                end,
                "Version",
                opts = { silent = true },
            },
        },
    },

    MarkdownPreview = {
        plugin = true,
        n = {
            ["<leader>m"] = {
                function()
                    if vim.bo.filetype == "markdown" then
                        vim.cmd "MarkdownPreviewToggle"
                    else
                        vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Preview" })
                    end
                end,
                "Markdown Preview",
                opts = { silent = true },
            },
        },
    }
}

return M
