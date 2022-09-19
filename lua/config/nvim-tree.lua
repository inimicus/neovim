local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    print("nvim_tree.config is not ok")
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    actions = {
        open_file = {
            window_picker = {
                enable = false
            }
        }
    },
    -- disables netrw completely
    disable_netrw = true,
    -- hijack netrw window on startup
    hijack_netrw = true,
    -- open the tree when running this setup function
    open_on_setup = false,
    -- will not open on setup if the filetype is in this list
    ignore_ft_on_setup = {},
    -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    open_on_tab = false,
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = true,
    -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    update_cwd = true,
    -- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
    respect_buf_cwd = false,
    -- show lsp diagnostics in the signcolumn
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        debounce_delay = 50,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
    },
    filters = {
        dotfiles = true,
        custom = {},
        exclude = {},
    },
    git = {ignore = false},
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {
        -- enables the feature
        enable = false,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_cwd = false,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = {".git", "node_modules", ".cache", "vendor"}
    },
    -- configuration options for the system open command (`s` in the tree by default)
    system_open = {
        -- the command to run this, leaving nil should work in most cases
        cmd = nil,
        -- the command arguments as a list
        args = {}
    },

    renderer = {
        root_folder_modifier = ":~",
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        -- Opened files highlight options:
        -- 0 -> "none"
        -- 1 -> "icon"
        -- 2 -> "name"
        -- 3 -> "all"
        highlight_opened_files = "icon",
        icons = {
            webdev_colors = true,
            git_placement = "signcolumn",
            padding = " ",
            symlink_arrow = "  ", -- defaults to ' ➛ '
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
            },
            glyphs = {
                -- default = "",
                default = "",
                symlink = "",
                bookmark = "",
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    arrow_closed = "",
                    arrow_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "ﱤ",
                    staged = "",
                    unmerged = "",
                    renamed = "ﰲ",
                    deleted = " ", --   﫧
                    untracked = "",
                    ignored = "",
                },
          },
        },
        indent_markers = {
            -- Off by default, this option shows indent markers when folders are open
            inline_arrows = false,
            enable = true,
        },
    },

    trash = {cmd = "trash-put"},

    view = {
        signcolumn = "auto",
        -- show line numbers in tree disabled
        number = false,
        relativenumber = false,
        -- width of the window, can be either a number (columns) or a string in `%`
        width = 30,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = "left",
        -- if true the tree will resize itself after opening a file
        adaptive_size = false,
        mappings = {
            -- custom only false will merge the list with the default mappings
            -- if true, it will only use your list to set the mappings
            custom_only = true,
            -- list of mappings to set on the tree manually
            list = {
                {key = {"<CR>", "o"}, cb = tree_cb("edit")},
                {key = {"<C-]>"}, cb = tree_cb("cd")},
                {key = "s", cb = tree_cb("vsplit")},
                {key = "<C-v>", cb = tree_cb("vsplit")},
                {key = "<C-x>", cb = tree_cb("split")},
                {key = "<C-t>", cb = tree_cb("tabnew")},
                {key = "<", cb = tree_cb("prev_sibling")},
                {key = ">", cb = tree_cb("next_sibling")},
                {key = "P", cb = tree_cb("parent_node")},
                {key = "<S-CR>", cb = tree_cb("close_node")},
                {key = "<Tab>", cb = tree_cb("preview")},
                {key = "K", cb = tree_cb("first_sibling")},
                {key = "J", cb = tree_cb("last_sibling")},
                {key = "I", cb = tree_cb("toggle_ignored")},
                {key = "H", cb = tree_cb("toggle_dotfiles")},
                {key = "R", cb = tree_cb("refresh")},
                {key = "a", cb = tree_cb("create")},
                {key = "d", cb = tree_cb("remove")},
                {key = "r", cb = tree_cb("rename")},
                {key = "<C-r>", cb = tree_cb("full_rename")},
                {key = "x", cb = tree_cb("cut")},
                {key = "c", cb = tree_cb("copy")},
                {key = "p", cb = tree_cb("paste")},
                {key = "y", cb = tree_cb("copy_name")},
                {key = "Y", cb = tree_cb("copy_path")},
                {key = "gy", cb = tree_cb("copy_absolute_path")},
                {key = "[c", cb = tree_cb("prev_git_item")},
                {key = "]c", cb = tree_cb("next_git_item")},
                {key = "-", cb = tree_cb("dir_up")},
                {key = "q", cb = tree_cb("close")},
                {key = "g?", cb = tree_cb("toggle_help")}
            }
        }
    },
}
