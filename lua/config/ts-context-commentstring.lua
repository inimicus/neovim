local status_ok, ts_commentstring = pcall(require, "ts_context_commentstring")
if not status_ok then
    return
end

vim.g.skip_ts_context_commentstring_module = true

ts_commentstring.setup({})
