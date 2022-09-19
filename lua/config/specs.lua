-- TODO: Needs fixing - colorscheme?
local specs = require('specs')

specs.setup {
    show_jumps  = true,
    min_jump = 3,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 10, -- time increments used for fade/resize effects 
        blend = 80, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 15,
        winhl = "Cursor",
        fader = specs.exp_fader,
        resizer = specs.shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        --nofile = true,
    },
}
