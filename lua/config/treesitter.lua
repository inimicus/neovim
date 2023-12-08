-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.phpdocm1 = {
--   install_info = {
--     url = "https://github.com/inimicus/tree-sitter-phpdoc", -- local path or git repo
--     files = {"src/parser.c"},
--     -- optional entries:
--     branch = "master", -- default branch in case of git repo if different from master
--     generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--     requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
--   },
--   filetype = "php", -- if filetype does not match the parser name
-- }

require("nvim-treesitter.configs").setup({
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
        "bash",
        "cmake",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "phpdoc",
        "scss",
        "typescript",
        "yaml",
    },
    -- List of parsers to ignore installing
    ignore_install = {},
    highlight = {
        -- false will disable the whole extension
        enable = true,
        -- list of language that will be disabled
        disable = {},
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
        },
    },
    indent = { enable = true },
    autopairs = { { enable = true } },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["ib"] = "@block.inner",
                ["ab"] = "@block.outer",
                ["ir"] = "@parameter.inner",
                ["ar"] = "@parameter.outer",
            },
        },
    },
    autotag = {
        enable = true,
    },
    -- rainbow = {
    --     enable = true,
    --     extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    --     max_file_lines = 2000 -- Do not enable for files with more than specified lines
    -- }
})
