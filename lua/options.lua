-- =============================================================================
-- options.lua
-- =============================================================================

local o = vim.opt
local wo = vim.wo
local g = vim.g
vim.cmd("filetype indent plugin on")

-- -----------------------------------------------------------------------------
-- Providers
-- -----------------------------------------------------------------------------
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

-- -----------------------------------------------------------------------------
-- Command Menu
-- -----------------------------------------------------------------------------
o.showcmd = false                   -- Hide key input
o.cmdheight = 1                     -- Command only needs one line
o.history = 250                     -- Reduce history length for commands
o.wildmenu = false

-- -----------------------------------------------------------------------------
-- Color Configuration
-- -----------------------------------------------------------------------------
o.termguicolors = true              -- Support GUI colors
-- Color undercurl help?
-- vim.cmd('let &t_Cs = "\\e[4:3m"')
-- vim.cmd('let &t_Ce = "\\e[4:0m"')

-- -----------------------------------------------------------------------------
-- Line Numbers
-- -----------------------------------------------------------------------------
o.number = true                     -- Show line numbers
o.relativenumber = true             -- Use relative line numbers
o.numberwidth = 5                   -- Line numbers up to 5 characters

-- -----------------------------------------------------------------------------
-- Visual
-- -----------------------------------------------------------------------------
o.wrap = false                      -- No line wrapping
wo.colorcolumn = "80"               -- Column guide at 80 characters
o.showmode = false                  -- Don't show default mode indicator
o.ruler = false                     -- Always hide cursor position
o.laststatus = 3                    -- Global status line

-- -----------------------------------------------------------------------------
-- Editing
-- -----------------------------------------------------------------------------

-- Complete options via nvim-cmp docs, does not include 'noinsert'
o.completeopt = {"menu", "menuone", "noselect"}

o.smarttab = true                   -- Consistent start of line tab handling
o.smartindent = true                -- Smart indenting
o.tabstop = 4                       -- Column size of tabs
o.expandtab = true                  -- Tabs as spaces
o.softtabstop = 4                   -- Colums of tabs in insert mode
o.shiftwidth = 4                    -- Columns to indent by
o.shiftround = true                 -- Always align indents to shift width
o.timeoutlen = 400                  -- Short timeouts
o.ttimeoutlen = 0                   -- Quickly change modes
o.fileencoding = "utf-8"            -- Default encoding
o.lazyredraw = true                 -- Don't redraw while executing macros
o.autoindent = true                 -- Auto indent
o.errorbells = false                -- Turn off error bells
o.visualbell = false                -- Enable visual bell...
o.updatetime = 250                  -- Shorten delay between updates
o.foldenable = false                -- Disable folding, manually enable
o.foldmethod = "expr"               -- Use syntax mode for folding
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99               -- Manually close folds
o.shortmess = o.shortmess + "c"     -- Don't pass messages to ins-completion-menu

-- -----------------------------------------------------------------------------
-- Searching
-- -----------------------------------------------------------------------------
o.ignorecase = true                 -- Ignore case when searching
o.smartcase = true                  -- Ignore above setting if pattern contains uppercase
o.hlsearch = true                   -- Highlight search results
o.incsearch = true                  -- Dynamically as typed
o.inccommand = "split"              -- Show live replacements

-- Use rg instead of grep
o.grepprg = "rg --hidden --vimgrep --smart-case --"

-- -----------------------------------------------------------------------------
-- File Handling
-- -----------------------------------------------------------------------------
o.backup = false                    -- Don't create backups
o.writebackup = false               -- Prevent automatic write backup
o.swapfile = false                  -- Don't keep a swap file
