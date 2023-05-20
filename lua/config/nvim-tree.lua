local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    print("nvim_tree.config is not ok")
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
    vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
    vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
    vim.keymap.set('n', '<S-CR>', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
    vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
    vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
    vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
    vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
    vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
    vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
    vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
    vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
    vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
    vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
    vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
    vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
    vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
    vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
    vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
end


nvim_tree.setup({
    on_attach = on_attach,
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    -- disables netrw completely
    disable_netrw = true,
    -- hijack netrw window on startup
    hijack_netrw = true,
    -- open the tree when running this setup function
    -- open_on_setup = false,
    -- will not open on setup if the filetype is in this list
    -- ignore_ft_on_setup = {},
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
    git = { ignore = false },
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {
        -- enables the feature
        enable = false,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_cwd = false,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = { ".git", "node_modules", ".cache", "vendor" },
    },
    -- configuration options for the system open command (`s` in the tree by default)
    system_open = {
        -- the command to run this, leaving nil should work in most cases
        cmd = nil,
        -- the command arguments as a list
        args = {},
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
                bookmark = "",
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
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "",
                    deleted = "󰚃", --   﫧
                    untracked = "",
                    ignored = "",
                },
            },
        },
        indent_markers = {
            -- Off by default, this option shows indent markers when folders are open
            inline_arrows = false,
            enable = true,
        },
    },
    trash = { cmd = "trash-put" },
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
    },
})
