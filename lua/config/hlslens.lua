local status_ok, hlslens = pcall(require, "hlslens")
if not status_ok then
    return
end

local kopts = { noremap = true, silent = true }

hlslens.setup({
    calm_down = true,
    nearest_only = true,
    nearest_float_when = "always",
    virt_priority = 10,
})

vim.api.nvim_set_keymap(
    "n",
    "n",
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts
)
vim.api.nvim_set_keymap(
    "n",
    "N",
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts
)
vim.api.nvim_set_keymap(
    "n",
    "*",
    [[*<Cmd>lua require('hlslens').start()<CR>]],
    kopts
)
vim.api.nvim_set_keymap(
    "n",
    "#",
    [[#<Cmd>lua require('hlslens').start()<CR>]],
    kopts
)
vim.api.nvim_set_keymap(
    "n",
    "g*",
    [[g*<Cmd>lua require('hlslens').start()<CR>]],
    kopts
)
vim.api.nvim_set_keymap(
    "n",
    "g#",
    [[g#<Cmd>lua require('hlslens').start()<CR>]],
    kopts
)

vim.api.nvim_set_keymap("n", "<Leader>l", ":noh<CR>", kopts)
