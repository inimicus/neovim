local status_ok, typescript = pcall(require, "typescript")
if not status_ok then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

typescript.setup({
    server = {
        capabilities = capabilities,
        on_attach = function(_, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
        end
    }
});
