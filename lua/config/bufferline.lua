local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
    options = {
        mode = "tabs",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = false,
        separator_style = "thin",
        sort_by = "tabs",
        show_tab_indicator = true,
    },
}
