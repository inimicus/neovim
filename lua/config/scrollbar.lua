local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
    return
end

local hlslens_ok = pcall(require, "hlslens")
local search_ok, search = pcall(require, "scrollbar.handlers.search")
if search_ok then
    search.setup()
end

scrollbar.setup({
    show_in_active_only = true,
    hide_if_all_visible = true,
    excluded_filetypes = {
        "Dashboard",
        "NvimTree",
        "TelescopePrompt",
        "dashboard",
        "noice",
        "prompt",
    },
    handlers = {
        cursor = false,
        diagnostic = true,
        search = hlslens_ok,
    },
})

-- show_in_active_only acts funny, experiment below
-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd

-- autocmd(require("scrollbar.config").get().autocmd.clear, {
--     group = augroup("scrollbar_clear", { clear = true }),
--     callback = function()
--         require('scrollbar').clear()
--     end,
-- })
