local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end

local default_options = { noremap = true, silent = true }

wk.setup({
    plugins = {
        marks = true,         -- shows a list of your marks on ' and `
        registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    -- key_labels = {
    --     -- override the label used to display some keys. It doesn't effect WK in any other way.
    --     -- For example:
    --     -- ["<space>"] = "SPC",
    --     -- ["<cr>"] = "RET",
    --     -- ["<tab>"] = "TAB",
    -- },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = " ",   -- symbol prepended to a group
    },
    win = {
        border = "none",          -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
        align = "center",               -- align columns left, center or right
    },
    -- enable this to hide mappings for which you didn't specify a label
    -- ignore_missing = false,
    -- hide mapping boilerplate
    -- hidden = {
    --     "<CR>",
    --     "<Cmd>",
    --     "<cmd>",
    --     "<cr>",
    --     "<silent>",
    --     "^ ",
    --     "^:",
    --     "call",
    --     "lua",
    --     "require",
    -- },
    show_help = false, -- show help message on the command line when the popup is visible
    show_keys = false, -- show the currently pressed key and its label as a message in the command line
    triggers = {
        { "<auto>", mode = "nixsotc" },
        { "a",      mode = { "n", "v" } },
    }
    -- triggers = {"<leader>"} -- or specify a list manually
    -- triggers_blacklist = {
    --     -- list of mode / prefixes that should never be hooked by WhichKey
    --     -- this is mostly relevant for key maps that start with a native binding
    --     -- most people should not need to change this
    --     i = { "j", "k" },
    --     v = { "j", "k" },
    -- },
})


-- Register all leader based mappings
wk.add({
        {
            "<leader>;",
            "<cmd>lua require('leap').leap({target_windows = {vim.fn.win_getid()}})<cr>",
            desc = "Leap Bidirectional"
        },

        { "<leader>b", group = "Buffers" },
        {
            "<leader>bD",
            "<cmd>lua require('bufdelete').bufdelete(0, true)<CR>",
            desc = "Delete Buffer (Force)"
        },
        {
            "<leader>bb",
            "<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
            desc = "Find buffer"
        },
        {
            "<leader>bd",
            "<cmd>lua require('bufdelete').bufdelete(0, false)<CR>",
            desc = "Delete Buffer"
        },

        -- Debugger
        -- --------
        { "<leader>d", group = "Debugger" },
        {
            "<leader>d<CR>",
            "<cmd>lua require('dap').continue()<CR>",
            desc = "Continue"
        },
        {
            "<leader>d<Down>",
            "<cmd>lua require('dap').step_into()<CR>",
            desc = "Step Into"
        },
        {
            "<leader>d<Right>",
            "<cmd>lua require('dap').step_over()<CR>",
            desc = "Step Over"
        },
        {
            "<leader>d<Up>",
            "<cmd>lua require('dap').step_out()<CR>",
            desc = "Step Out"
        },
        {
            "<leader>dB",
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
            desc = "Conditional Breakpoint"
        },
        {
            "<leader>dC",
            "<cmd>lua require('dap').clear_breakpoints()<CR>",
            desc = "Clear Breakpoints"
        },
        {
            "<leader>dR",
            "<cmd>lua require('dap').run_to_cursor()<CR>",
            desc = "Run to Cursor"
        },
        {
            "<leader>db",
            "<cmd>lua require('dap').toggle_breakpoint()<CR>",
            desc = "Toggle Breakpoint"
        },
        {
            "<leader>dl",
            "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
            desc = "Log Breakpoint"
        },
        {
            "<leader>do",
            "<cmd>lua require('dapui').open()<CR>",
            desc = "Close DAP UI"
        },
        {
            "<leader>dr",
            "<cmd>lua require('dap').repl.toggle()<CR>",
            desc = "Repl Toggle"
        },
        {
            "<leader>dx",
            "<cmd>lua require('dapui').close()<CR>",
            desc = "Close DAP UI"
        },

        -- Files
        -- -----
        { "<leader>f", group = "Files" },
        {
            "<leader>fT",
            "<cmd>NvimTreeFindFile<CR>",
            desc = "Find in Tree"
        },
        {
            "<leader>fb",
            "<cmd>Telescope file_browser<cr>",
            desc = "File Browser"
        },
        {
            "<leader>ff",
            "<cmd>Telescope find_files find_command=rg,--hidden,--files,-S<cr>",
            desc = "Find Files"
        },
        {
            "<leader>fn",
            "<cmd>DashboardNewFile<cr>",
            desc = "New File"
        },
        {
            "<leader>fp",
            "<cmd>NvimTreeToggle<cr>",
            desc = "Toogle Tree"
        },
        {
            "<leader>fr",
            "<cmd>Telescope oldfiles<cr>",
            desc = "Open Recent File"
        },
        {
            "<leader>fs",
            "<cmd>w<cr>",
            desc = "Save Buffer"
        },

        -- Git
        -- ---
        { "<leader>g", group = "Git" },
        {
            "<leader>gB",
            "<cmd>lua require 'gitsigns'.toggle_current_line_blame()<cr>",
            desc = "Toogle Blame"
        },
        {
            "<leader>gC",
            "<cmd>Telescope git_bcommits<cr>",
            desc = "Checkout commit (current file)"
        },
        {
            "<leader>gD",
            "<cmd>DiffviewClose<cr>",
            desc = "Close Diffview"
        },
        {
            "<leader>gF",
            "<cmd>DiffviewFileHistory<cr>",
            desc = "Project Files Diffview"
        },
        {
            "<leader>gR",
            "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
            desc = "Reset Buffer"
        },
        {
            "<leader>gb",
            "<cmd>Telescope git_branches<cr>",
            desc = "Checkout branch"
        },
        {
            "<leader>gc",
            "<cmd>Telescope git_commits<cr>",
            desc = "Checkout commit"
        },
        {
            "<leader>gd",
            "<cmd>DiffviewOpen<cr>",
            desc = "Open Diffview"
        },
        {
            "<leader>gf",
            "<cmd>DiffviewFileHistory %<cr>",
            desc = "File Diffview"
        },
        {
            "<leader>gg",
            "<cmd>Telescope git_status<cr>",
            desc = "Open changed file"
        },
        {
            "<leader>gj",
            "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
            desc = "Next Hunk"
        },
        {
            "<leader>gk",
            "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
            desc = "Prev Hunk"
        },
        {
            "<leader>gl",
            "<cmd>lua require 'gitsigns'.toggle_linehl()<cr>",
            desc = "Toggle Line Diff"
        },
        {
            "<leader>gn",
            "<cmd>lua require 'gitsigns'.toggle_numhl()<cr>",
            desc = "Toggle Num Diff"
        },
        {
            "<leader>gp",
            "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
            desc = "Preview Hunk"
        },
        {
            "<leader>gr",
            "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
            desc = "Reset Hunk"
        },
        {
            "<leader>gs",
            "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
            desc = "Stage Hunk"
        },
        {
            "<leader>gu",
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            desc = "Undo Stage Hunk"
        },
        {
            "<leader>gw",
            "<cmd>lua require 'gitsigns'.toggle_word_diff()<cr>",
            desc = "Toggle Word Diff"
        },

        -- Harpoon
        -- -------
        { "<leader>h", group = "Harpoon" },
        {
            "<leader>h1",
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
            desc = "Open File 1"
        },
        {
            "<leader>h2",
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
            desc = "Open File 2"
        },
        {
            "<leader>h3",
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
            desc = "Open File 3"
        },
        {
            "<leader>h4",
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
            desc = "Open File 4"
        },
        {
            "<leader>ha",
            "<cmd>lua require('harpoon.mark').add_file()<cr>",
            desc = "Add file"
        },
        {
            "<leader>hu",
            "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
            desc = "Open Menu"
        },

        -- Language Server
        -- ---------------
        { "<leader>l", group = "LSP" },
        {
            "<leader>lA",
            "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
            desc = "Add Workspace Folder"
        },
        {
            "<leader>lD",
            "<cmd>lua vim.lsp.buf.declaration()<cr>",
            desc = "Go To Declaration"
        },
        {
            "<leader>lI",
            "<cmd>lua vim.lsp.buf.implementation()<cr>",
            desc = "Show implementations"
        },
        {
            "<leader>lK",
            "<cmd>lua vim.lsp.buf.hover()<cr>",
            desc = "Hover Commands"
        },
        {
            "<leader>lL",
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
            desc = "List Workspace Folders"
        },
        {
            "<leader>lR",
            "<cmd>lua vim.lsp.buf.rename()<cr>",
            desc = "Rename"
        },
        {
            "<leader>lS",
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            desc = "Workspace Symbols"
        },
        {
            "<leader>lW",
            "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
            desc = "Remove Workspace Folder"
        },
        {
            "<leader>la",
            "<cmd>lua vim.lsp.buf.code_action()<cr>",
            desc = "Code Action"
        },
        {
            "<leader>ld",
            "<cmd>lua vim.lsp.buf.definition()<cr>",
            desc = "Go To Definition"
        },
        {
            "<leader>le",
            "<cmd>Telescope diagnostics bufnr=0<cr>",
            desc = "Document Diagnostics"
        },
        {
            "<leader>lf",
            "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
            desc = "Format"
        },
        {
            "<leader>li",
            "<cmd>LspInfo<cr>",
            desc = "Connected Language Servers"
        },
        {
            "<leader>lk",
            "<cmd>lua vim.lsp.buf.signature_help()<cr>",
            desc = "Signature Help"
        },
        {
            "<leader>ll",
            "<cmd>lua vim.diagnostic.open_float()<CR>",
            desc = "Line diagnostics"
        },
        {
            "<leader>ln",
            "<cmd>lua vim.diagnostic.goto_next()<cr>",
            desc = "Next Diagnostic"
        },
        {
            "<leader>lo",
            "<cmd>lua vim.diagnostic.config({ virtual_text = not require('lsp_lines').toggle() })<cr>",
            desc = "Open Diagnostic Lines"
        },
        {
            "<leader>lp",
            "<cmd>lua vim.diagnostic.goto_prev()<cr>",
            desc = "Prev Diagnostic"
        },
        {
            "<leader>lq",
            "<cmd>lua vim.diagnostic.set_loclist()<cr>",
            desc = "Quickfix"
        },
        {
            "<leader>lr",
            "<cmd>Telescope lsp_references<cr>",
            desc = "References"
        },
        {
            "<leader>ls",
            "<cmd>Telescope lsp_document_symbols<cr>",
            desc = "Document Symbols"
        },
        {
            "<leader>lt",
            "<cmd>lua vim.lsp.buf.type_definition()<cr>",
            desc = "Type Definition"
        },
        {
            "<leader>lw",
            "<cmd>Telescope diagnostics<cr>",
            desc = "Workspace Diagnostics"
        },

        -- Misc
        -- ----
        { "<leader>m", group = "Misc" },
        {
            "<leader>mS",
            "<cmd>SidebarNvimToggle<cr>",
            desc = "Toggle Sidebar"
        },
        {
            "<leader>mm",
            "<cmd>Noice telescope<cr>",
            desc = "Messages"
        },
        {
            "<leader>ms",
            "<cmd>SymbolsOutline<cr>",
            desc = "Toggle SymbolsOutline"
        },
        {
            "<leader>mt",
            "<cmd>FloatermNew --autoclose=2<cr>",
            desc = "New Floaterm"
        },
        {
            "<leader>mz",
            "<cmd>ZenMode<cr>",
            desc = "Toggle ZenMode"
        },

        -- Packer
        -- ------
        { "<leader>p", group = "Packer" },
        {
            "<leader>pC",
            "<cmd>PackerClean<cr>",
            desc = "Clean"
        },
        {
            "<leader>pS",
            "<cmd>PackerStatus<cr>",
            desc = "Status"
        },
        {
            "<leader>pc",
            "<cmd>PackerCompile<cr>",
            desc = "Compile"
        },
        {
            "<leader>pp",
            "<cmd>Telescope packer<cr>",
            desc = "Plugin List"
        },
        {
            "<leader>ps",
            "<cmd>PackerSync<cr>",
            desc = "Sync"
        },

        -- Search
        -- ------
        { "<leader>s", group = "Search" },
        {
            "<leader>sC",
            "<cmd>Telescope colorscheme<cr>",
            desc = "Colorscheme"
        },
        {
            "<leader>sH",
            "<cmd>Telescope heading<cr>",
            desc = "Find Header"
        },
        {
            "<leader>sM",
            "<cmd>Telescope man_pages<cr>",
            desc = "Man Pages"
        },
        {
            "<leader>sP",
            "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
            desc = "Colorscheme with Preview"
        },
        {
            "<leader>sR",
            "<cmd>Telescope registers<cr>",
            desc = "Registers"
        },
        {
            "<leader>sS",
            "<cmd>Telescope symbols<cr>",
            desc = "Search symbols"
        },
        {
            "<leader>sc",
            "<cmd>Telescope commands<cr>",
            desc = "Commands"
        },
        {
            "<leader>sh",
            "<cmd>Telescope help_tags<cr>",
            desc = "Find Help"
        },
        {
            "<leader>sk",
            "<cmd>Telescope keymaps<cr>",
            desc = "Keymaps"
        },
        {
            "<leader>sp",
            "<cmd>Telescope projects<cr>",
            desc = "Projects"
        },
        {
            "<leader>ss",
            "<cmd>Telescope grep_string<cr>",
            desc = "Text under cursor"
        },
        {
            "<leader>st",
            "<cmd>Telescope live_grep<cr>",
            desc = "Text"
        },
        {
            "<leader>sz",
            "<cmd>Telescope spell_suggest<cr>",
            desc = "Spelling Suggestions"
        },

        -- Trouble
        -- ------
        { "<leader>t", group = "Trouble" },
        {
            "<leader>tT",
            "<cmd>TodoTrouble<cr>",
            desc = "Todos"
        },
        {
            "<leader>td",
            "<cmd>Trouble document_diagnostics<cr>",
            desc = "Document Diagnostic"
        },
        {
            "<leader>tl",
            "<cmd>Trouble loclist<cr>",
            desc = "Loclist"
        },
        {
            "<leader>tq",
            "<cmd>Trouble quickfix<cr>",
            desc = "Quickfix"
        },
        {
            "<leader>tr",
            "<cmd>Trouble lsp_references<cr>",
            desc = "LSP References"
        },
        {
            "<leader>tt",
            "<cmd>TroubleToggle<cr>",
            desc = "Toggle Trouble"
        },
        {
            "<leader>tw",
            "<cmd>Trouble workspace_diagnostics<cr>",
            desc = "Workspace Diagnostics"
        },

        -- Window
        -- ------
        { "<leader>w", group = "Window" },
        {
            "<leader>w=",
            "<cmd>WindowsEqualize<cr>",
            desc = "Equally size"
        },
        {
            "<leader>wa",
            "<cmd>WindowsToggleAutowidth<cr>",
            desc = "Toggle Autowidth"
        },
        {
            "<leader>wm",
            "<cmd>WindowsMaximize<cr>",
            desc = "Maximize"
        },
        {
            "<leader>wq",
            "<cmd>:q<cr>",
            desc = "Close"
        },
        {
            "<leader>wr",
            "<cmd>Telescope resume<cr>",
            desc = "Telescope Resume"
        },
        {
            "<leader>ws",
            "<cmd>:split<cr>",
            desc = "Horizontal Split"
        },
        {
            "<leader>wt",
            "<c-w>t",
            desc = "Move to new tab"
        },
        {
            "<leader>wv",
            "<cmd>:vsplit<cr>",
            desc = "Vertical Split"
        },
        {
            "<leader>ww",
            "<c-w>x",
            desc = "Swap"
        },
    })
