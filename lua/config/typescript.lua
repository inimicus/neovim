local status_ok, typescript = pcall(require, "typescript")
if not status_ok then
    return
end


typescript.setup({
    server = {
        capabilities = capabilities,
        on_attach = function(_, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
        end
    }
});
