local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local custom_actions = {}

telescope.setup({
    extensions = {
        packer = {
            theme = "ivy",
            layout_config = {
                height = 0.5,
            },
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        fzf_writer = {
            minimum_grep_characters = 2,
            minimum_files_characters = 2,

            -- Disabled by default.
            -- Will probably slow down some aspects of the sorter, but can make color highlights.
            -- I will work on this more later.
            use_highlighter = true,
        },
    },
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "%.jpg",
            "%.png",
            "%.gif",
            "vendor",
        },
        vimgrep_arguments = {
            "rg",
            --"--follow",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        mappings = {
            i = {
                -- Close on first esc instead of gonig to normal mode
                -- ["<esc>"] = actions.close,
                ["<A-q>"] = actions.send_selected_to_qflist,
                ["<s-tab>"] = actions.toggle_selection
                    + actions.move_selection_next,
                ["<tab>"] = actions.toggle_selection
                    + actions.move_selection_previous,
                ["<cr>"] = custom_actions.multi_selection_open,
                ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
                ["<c-s>"] = custom_actions.multi_selection_open_split,
                ["<c-t>"] = custom_actions.multi_selection_open_tab,
                -- ["<C-q>"] = actions.send_to_qflist,
                ["<c-q>"] = trouble.smart_open_with_trouble,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<s-tab>"] = actions.toggle_selection
                    + actions.move_selection_next,
                ["<tab>"] = actions.toggle_selection
                    + actions.move_selection_previous,
                ["<A-q>"] = actions.send_selected_to_qflist,
                ["<cr>"] = custom_actions.multi_selection_open,
                ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
                ["<c-s>"] = custom_actions.multi_selection_open_split,
                ["<c-t>"] = custom_actions.multi_selection_open_tab,
                -- ["<C-q>"] = actions.send_to_qflist,
                ["<c-q>"] = trouble.smart_open_with_trouble,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        prompt_prefix = " ❯ ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "flex",
        layout_config = {
            width = 0.75,
            prompt_position = "bottom",
            preview_cutoff = 120,
            horizontal = { mirror = false },
            vertical = { mirror = true },
        },
        file_sorter = require("telescope.sorters").get_fzf_sorter,
        generic_sorter = require("telescope.sorters").get_fzf_sorter,
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
    pickers = {
        buffers = {
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            layout_config = {
                width = 0.75,
                prompt_position = "top",
            },
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer,
                },
                n = {
                    ["<C-d>"] = actions.delete_buffer,
                },
            },
        },
    },
})

telescope.load_extension("dap")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("noice")
telescope.load_extension("packer")
telescope.load_extension("projects")

vim.api.nvim_set_keymap(
    "n",
    "<Tab>",
    "<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
    { noremap = true, silent = true }
)
