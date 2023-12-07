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
    }
}

return M
