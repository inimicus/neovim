local status_ok, _ = pcall(require, "diffview")
if not status_ok then
    return
end

vim.opt.fillchars:append({
    diff = "╱",
})
