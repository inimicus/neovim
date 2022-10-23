local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
    return
end

-- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevel = 99
vim.o.foldcolumn = "1"
vim.o.foldenable = true

ufo.setup()

-- No flashing
vim.api.nvim_set_hl(0, "UfoFoldedBg", {})

-- Using ufo provider need remap `zR` and `zM`
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

vim.opt.fillchars:append({
    eob = " ",
    fold = " ",
    foldopen = "",
    foldsep = "│",
    foldclose = "",
})
