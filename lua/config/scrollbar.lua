local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
    return
end

local hlslens_ok = pcall(require, "hlslens")

scrollbar.setup({
    show_in_active_only = true,
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "NvimTree",
        "Dashboard",
    },
    handlers = {
        diagnostic = true,
        search = hlslens_ok,
    },
})
