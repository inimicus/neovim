local status_ok, modes = pcall(require, "modes")
if not status_ok then
    return
end

modes.setup({
    -- cursorline highlight opacity
    line_opacity = 0.1,

    -- Enable cursorline initially, and disable cursorline for inactive windows
    -- or ignored filetypes
    set_cursorline = true,

    -- highlight cursor
    set_cursor = true,

    -- Enable line number highlights to match cursorline
    set_number = true,

    -- Disable modes highlights in specified filetypes
    ignore_filetypes = {
        "NvimTree",
        "TelescopePrompt",
        "vim",
    },
})
