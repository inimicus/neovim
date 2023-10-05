local status_ok, indent = pcall(require, "ibl")
if not status_ok then
    return
end

indent.setup({
    enabled = true,
    scope = {
        enabled = true,
        char = "┃",
        show_start = false,
        show_end = false,
        highlight = { "Function", "Label" },
    },
    exclude = {
        filetypes = {
            "",
            "NvimTree",
            "TelescopePrompt",
            "TelescopeResults",
            "checkhealth",
            "dashboard",
            "dotooagenda",
            "flutterToolsOutline",
            "fugitive",
            "git",
            "gitcommit",
            "help",
            "log",
            "lspinfo",
            "man",
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
        },
        buftypes = {
            "terminal",
            "nofile",
            "dashboard",
            "quickfix",
            "prompt",
        },
    },
    indent = {
        -- char = {"|", "¦", "┆", "┊"},
        char = "│",
        tab_char = "├",
    },
})
