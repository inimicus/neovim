local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end

local default_options = { noremap = true, silent = true }

wk.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = " ", -- symbol prepended to a group
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    -- enable this to hide mappings for which you didn't specify a label
    ignore_missing = false,
    -- hide mapping boilerplate
    hidden = {
        "<CR>",
        "<Cmd>",
        "<cmd>",
        "<cr>",
        "<silent>",
        "^ ",
        "^:",
        "call",
        "lua",
        "require",
    },
    show_help = false, -- show help message on the command line when the popup is visible
    show_keys = false, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
})

-- register non leader based mappings
-- wk.register({ga = {"<Plug>(EasyAlign)", "Align", mode = "x"}})

-- Register all leader based mappings
wk.register({
    b = {
        name = "Buffers",
        b = {
            "<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
            "Find buffer",
        },
        d = {
            "<cmd>lua require('bufdelete').bufdelete(0, false)<CR>",
            "Delete Buffer",
        },
        D = {
            "<cmd>lua require('bufdelete').bufdelete(0, true)<CR>",
            "Delete Buffer (Force)",
        },
    },
    d = {
        name = "Debugger",
        B = {
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
            "Conditional Breakpoint",
        },
        C = {
            "<cmd>lua require('dap').clear_breakpoints()<CR>",
            "Clear Breakpoints",
        },
        R = { "<cmd>lua require('dap').run_to_cursor()<CR>", "Run to Cursor" },
        b = {
            "<cmd>lua require('dap').toggle_breakpoint()<CR>",
            "Toggle Breakpoint",
        },
        l = {
            "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
            "Log Breakpoint",
        },
        o = { "<cmd>lua require('dapui').open()<CR>", "Close DAP UI" },
        r = { "<cmd>lua require('dap').repl.toggle()<CR>", "Repl Toggle" },
        x = { "<cmd>lua require('dapui').close()<CR>", "Close DAP UI" },
        ["<CR>"] = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
        ["<Right>"] = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
        ["<Down>"] = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
        ["<Up>"] = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
    },
    f = {
        name = "Files",
        T = { "<cmd>NvimTreeFindFile<CR>", "Find in Tree" },
        b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
        f = {
            "<cmd>Telescope find_files find_command=rg,--hidden,--files,-S<cr>",
            "Find Files",
        },
        p = { "<cmd>NvimTreeToggle<cr>", "Toogle Tree" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        n = { "<cmd>DashboardNewFile<cr>", "New File" },
        s = { "<cmd>w<cr>", "Save Buffer" },
    },
    g = {
        name = "Git",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        B = {
            "<cmd>lua require 'gitsigns'.toggle_current_line_blame()<cr>",
            "Toogle Blame",
        },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit (current file)",
        },
        d = { "<cmd>DiffviewOpen<cr>", "Open Diffview" },
        D = { "<cmd>DiffviewClose<cr>", "Close Diffview" },
        f = { "<cmd>DiffviewFileHistory %<cr>", "File Diffview" },
        F = { "<cmd>DiffviewFileHistory<cr>", "Project Files Diffview" },
        g = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = {
            "<cmd>lua require 'gitsigns'.toggle_linehl()<cr>",
            "Toggle Line Diff",
        },
        n = {
            "<cmd>lua require 'gitsigns'.toggle_numhl()<cr>",
            "Toggle Num Diff",
        },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        w = {
            "<cmd>lua require 'gitsigns'.toggle_word_diff()<cr>",
            "Toggle Word Diff",
        },
        -- TODO: Revisit this
        -- t = {"<cmd>lua vim.g.LazygitToggle()<CR>", "Toggle Lazygit"}
    },
    h = {
        name = "Harpoon",
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
        u = {
            "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
            "Open Menu",
        },
        ["1"] = {
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
            "Open File 1",
        },
        ["2"] = {
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
            "Open File 2",
        },
        ["3"] = {
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
            "Open File 3",
        },
        ["4"] = {
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
            "Open File 4",
        },
    },
    l = {
        name = "LSP",
        A = {
            "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
            "Add Workspace Folder",
        },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
        I = {
            "<cmd>lua vim.lsp.buf.implementation()<cr>",
            "Show implementations",
        },
        K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
        L = {
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
            "List Workspace Folders",
        },
        R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
        W = {
            "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
            "Remove Workspace Folder",
        },
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
        e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
        k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        l = {
            "<cmd>lua vim.diagnostic.open_float()<CR>",
            "Line diagnostics",
        },
        n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>Telescope lsp_references<cr>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
    },
    m = {
        name = "Misc",
        m = { "<cmd>Telescope noice<cr>", "Messages" },
        t = { "<cmd>FloatermNew --autoclose=2<cr>", "New Floaterm" },
        s = { "<cmd>SymbolsOutline<cr>", "Toggle SymbolsOutline" },
        S = { "<cmd>SidebarNvimToggle<cr>", "Toggle Sidebar" },
        z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
    },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        C = { "<cmd>PackerClean<cr>", "Clean" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        p = { "<cmd>Telescope packer<cr>", "Plugin List" },
    },
    s = {
        name = "Search",
        C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope heading<cr>", "Find Header" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        s = { "<cmd>Telescope grep_string<cr>", "Text under cursor" },
        S = { "<cmd>Telescope symbols<cr>", "Search symbols" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        p = { "<cmd>Telescope projects<cr>", "Projects" },
        P = {
            "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
            "Colorscheme with Preview",
        },
        z = { "<cmd>Telescope spell_suggest<cr>", "Spelling Suggestions" },
    },
    t = {
        name = "Trouble",
        w = {
            "<cmd>Trouble workspace_diagnostics<cr>",
            "Workspace Diagnostics",
        },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostic" },
        l = { "<cmd>Trouble loclist<cr>", "Loclist" },
        q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
        t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
        T = { "<cmd>TodoTrouble<cr>", "Todos" },
        r = { "<cmd>Trouble lsp_references<cr>", "LSP References" },
    },
    w = {
        name = "Window",
        q = { "<cmd>:q<cr>", "Close" },
        r = { "<cmd>Telescope resume<cr>", "Telescope Resume" },
        s = { "<cmd>:split<cr>", "Horizontal Split" },
        t = { "<c-w>t", "Move to new tab" },
        ["="] = { "<c-w>=", "Equally size" },
        v = { "<cmd>:vsplit<cr>", "Vertical Split" },
        w = { "<c-w>x", "Swap" },
    },
    [";"] = {
        "<cmd>lua require('leap').leap({target_windows = {vim.fn.win_getid()}})<cr>",
        "Leap Bidirectional",
    },
}, { prefix = "<leader>", mode = "n", default_options })
