local M = {}
local utils = require "core.utils"

local cmp_nvim_lsp = require "cmp_nvim_lsp"

M.capabilities = cmp_nvim_lsp.default_capabilities()

-- Highlight symbol under cursor
-- local function lsp_highlight(client, bufnr)
--     if client.supports_method "textDocument/documentHighlight" then
--         vim.api.nvim_create_augroup("lsp_document_highlight", {
--             clear = false,
--         })
--         vim.api.nvim_clear_autocmds {
--             buffer = bufnr,
--             group = "lsp_document_highlight",
--         }
--         vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--             group = "lsp_document_highlight",
--             buffer = bufnr,
--             callback = vim.lsp.buf.document_highlight,
--         })
--         vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--             group = "lsp_document_highlight",
--             buffer = bufnr,
--             callback = vim.lsp.buf.clear_references,
--         })
--     end
-- end

M.on_attach = function(client, bufnr)
    -- lsp_highlight(client, bufnr)

    if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

return M
