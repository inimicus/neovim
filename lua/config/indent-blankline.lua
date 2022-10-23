local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
    return
end

indent.setup({
    indentLine_enabled = 1,
    filetype_exclude = {
        "NvimTree",
        "TelescopePrompt",
        "dashboard",
        "dotooagenda",
        "flutterToolsOutline",
        "fugitive",
        "git",
        "gitcommit",
        "help",
        "log",
        "markdown",
        "packer",
        "peekaboo",
        "startify",
        "todoist",
        "txt",
        "undotree",
        "vim",
        "vimwiki",
        "vista",
        -- for all buffers without a file type
        "",
    },
    char = "│",
    -- char_list = {"|", "¦", "┆", "┊"},
    buftype_exclude = { "terminal", "nofile", "dashboard" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = false,
    space_char = " ",
    space_char_blankline = " ",
    -- char_highlight_list = {
    --     "IndentBlanklineIndent",
    -- },
    -- context_patterns = {
    --     "^if",
    --     "^table",
    --     "block",
    --     "class",
    --     "for",
    --     "function",
    --     "if_statement",
    --     "list_literal",
    --     "method",
    --     "selector",
    --     "while"
    -- }
})
