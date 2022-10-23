local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
    return
end
local o = vim.opt
local default_colors = require("kanagawa.colors").setup()

o.laststatus = 3
o.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})

local overrides = {
    -- create a new hl-group using default palette colors and/or new ones
    DashboardFooter = { fg = default_colors.crystalBlue, italic = true },

    -- Make errors legible
    DiagnosticUnderlineError = { undercurl = true, sp = default_colors.autumnRed },
    Error = { fg = default_colors.autumnRed },
    ErrorMsg = { link = 'Error' },
    DiagnosticError = { link = 'Error' },

    -- Make the buffer line legible
    BufferLineIndicatorSelected = { link = 'Cursor' },

    -- Customize illuminated words
    IlluminatedWordText = {fg = default_colors.autumnYellow, bg = default_colors.winterYellow},
    IlluminatedWordRead = {fg = default_colors.autumnYellow, bg = default_colors.winterYellow},
    IlluminatedWordWrite = {fg = default_colors.autumnYellow, bg = default_colors.winterYellow},

    -- Customize Leap visibility
    LeapBackdrop = {fg = default_colors.sumiInk4},
    LeapMatch = {fg = default_colors.carpYellow},
    LeapLabelPrimary = {fg = default_colors.fujiWhite},
    LeapLabelSecondary = {fg = default_colors.oldWhite},
    --LeapLabelSelected

    -- Modes highlights
    ModesCopy = { bg = default_colors.roninYellow },
    ModesDelete = { bg = default_colors.autumnRed },
    ModesInsert = { bg = default_colors.waveAqua1 },
    ModesVisual = { bg = default_colors.crystalBlue },
    ModesCopyCursorLineNr = { fg = default_colors.roninYellow, bold = true },
    ModesDeleteCursorLineNr = { fg = default_colors.autumnRed, bold = true },
    ModesInsertCursorLineNr = { fg = default_colors.waveAqua1, bold = true },
    ModesVisualCursorLineNr = { fg = default_colors.crystalBlue, bold = true },
}

kanagawa.setup({
    overrides = overrides,
    dimInactive = true,
    globalStatus = true,
    -- theme = "dragon",
    -- colors = require('kanagawa.colors').setup({theme = 'dragon'}),
})

vim.cmd[[colorscheme kanagawa]]
