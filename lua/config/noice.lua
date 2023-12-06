local status_ok, noice = pcall(require, "noice")
if not status_ok then
    return
end

noice.setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true,              -- enables the Noice messages UI
        view = "notify",             -- default view for messages
        view_error = "notify",       -- view for errors
        view_warn = "notify",        -- view for warnings
        view_history = "messages",   -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    -- you can enable a preset for easier configuration
    presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
    routes = {
        -- Hide "written" messages
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "written",
            },
            opts = { skip = true },
        },
        -- Hide search virtual text
        {
            filter = {
                event = "msg_show",
                kind = "search_count",
            },
            opts = { skip = true },
        },
    },
})

vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
    if not require("noice.lsp").scroll(4) then
        return "<c-f>"
    end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
    if not require("noice.lsp").scroll(-4) then
        return "<c-b>"
    end
end, { silent = true, expr = true })

-- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes
