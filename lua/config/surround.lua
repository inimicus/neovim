local status_ok, surround = pcall(require, "surround")
if not status_ok then
    return
end

vim.g.surround_mappings_style = "surround"
surround.setup({})
