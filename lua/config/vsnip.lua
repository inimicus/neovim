local g = vim.g
local map = vim.api.nvim_set_keymap
local expr_options = {noremap = true, expr = true, silent = true}

g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets/'

-- " Expand or jump
map("i", "<C-j>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : ''", expr_options)
map("s", "<C-j>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : ''", expr_options)
map("i", "<C-k>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : ''", expr_options)
map("s", "<C-k>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : ''", expr_options)
