-- =============================================================================
-- mappings.lua
-- =============================================================================

local map = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

-- -----------------------------------------------------------------------------
-- Commands
-- -----------------------------------------------------------------------------

-- Map <leader> to <Space>
map("n", "<Space>", "<NOP>", default_options)
vim.g.mapleader = " "

-- Take advantage of unused arrow keys
map("n", "<Left>", ":vertical resize -5<CR>", default_options)
map("n", "<Right>", ":vertical resize +5<CR>", default_options)
map("n", "<Up>", ":resize -5<CR>", default_options)
map("n", "<Down>", ":resize +5<CR>", default_options)
map("n", "<S-Left>", ":vertical resize -15<CR>", default_options)
map("n", "<S-Right>", ":vertical resize +15<CR>", default_options)
map("n", "<S-Up>", ":resize -15<CR>", default_options)
map("n", "<S-Down>", ":resize +15<CR>", default_options)

-- Better split movement
map("n", "<C-H>", "<C-W><C-H>", default_options)
map("n", "<C-J>", "<C-W><C-J>", default_options)
map("n", "<C-K>", "<C-W><C-K>", default_options)
map("n", "<C-L>", "<C-W><C-L>", default_options)

-- Assist with sticky shift/fingers
vim.cmd([[command! WQ wq]])
vim.cmd([[command! Wq wq]])
vim.cmd([[command! W w]])
vim.cmd([[command! Q q]])
vim.cmd([[command! Qa qa]])
