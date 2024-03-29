local mason_ok, mason = pcall(require, "mason")
local mason_lspconfig_ok, lspconfig = pcall(require, "mason-lspconfig")
local lspconfig_ok, nvim_lsp = pcall(require, "lspconfig")

if not mason_ok or not mason_lspconfig_ok or not lspconfig_ok then
    return
end

mason.setup()
lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "intelephense",
        "tsserver",
    },
    automatic_installation = true,
});

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
}

local lsp_lines_installed, lsp_lines = pcall(require, "lsp_lines")
local navic_installed, navic = pcall(require, "nvim-navic")
local ufo_installed, _ = pcall(require, "ufo")
if ufo_installed then
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }
end

-- Configure diagnostic signs
local signs = {
    Error = " ",
    Warn = " ",
    Info = " ",
    Hint = "󰌵",
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    if navic_installed then
        if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
        end
    end
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- NOTE: tsserver is configured via typescript plugin
local servers = {
    "bashls",
    "docker_compose_language_service",
    "dockerls",
    "dockerls",
    "emmet_ls",
    "eslint",
    "intelephense",
    "jsonls",
    "lua_ls",
    "pylsp",
    "yamlls",
    "lemminx",
}

-- Use a loop to conveniently call 'setup' on multiple servers
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
        settings = {
            intelephense = {
                stubs = {
                    "Core",
                    "Ev",
                    "PDO",
                    "Phar",
                    "Reflection",
                    "SPL",
                    "SQLite",
                    "SimpleXML",
                    "Zend OPcache",
                    "ZendCache",
                    "ZendDebugger",
                    "ZendUtils",
                    "apcu",
                    "bcmath",
                    "bz2",
                    "calendar",
                    "crypto",
                    "ctype",
                    "curl",
                    "date",
                    "dba",
                    "dom",
                    "enchant",
                    "event",
                    "exif",
                    "fileinfo",
                    "filter",
                    "fpm",
                    "ftp",
                    "gd",
                    "geoip",
                    "geos",
                    "gettext",
                    "gmp",
                    "gnupg",
                    "grpc",
                    "hash",
                    "http",
                    "iconv",
                    "imagick",
                    "imap",
                    "inotify",
                    "intl",
                    "json",
                    "ldap",
                    "libevent",
                    "libxml",
                    "lua",
                    "mbstring",
                    "mcrypt",
                    "memcache",
                    "memcached",
                    "meminfo",
                    "meta",
                    "msgpack",
                    "mysql",
                    "mysqli",
                    "ncurses",
                    "oauth",
                    "odbc",
                    "openssl",
                    "pcntl",
                    "pcre",
                    "pdflib",
                    "pdo_mysql",
                    "pdo_sqlite",
                    "posix",
                    "pthreads",
                    "radius",
                    "random",
                    "readline",
                    "recode",
                    "redis",
                    "regex",
                    "session",
                    "shmop",
                    "snmp",
                    "soap",
                    "sockets",
                    "sodium",
                    "sqlite3",
                    "ssh2",
                    "standard",
                    "superglobals",
                    "sync",
                    "sysvmsg",
                    "sysvsem",
                    "sysvshm",
                    "tidy",
                    "tokenizer",
                    "v8js",
                    "xcache",
                    "xdebug",
                    "xml",
                    "xmlreader",
                    "xmlwriter",
                    "yaml",
                    "zend",
                    "zip",
                    "zlib",
                },
                files = {
                    maxSize = 5000000,
                },
                telemetry = {
                    enable = false,
                },
                completion = {
                    enable = true,
                    triggerParameterHints = true,
                    insertUseDeclaration = true,
                    fullyQualifyGlobalConstantsAndFunctions = true,
                },
                environment = {
                    includePaths = {
                        "../includes",
                        "./includes",
                    },
                },
                diagnostics = {
                    enable = true,
                },
                format = {
                    enable = false,
                },
                rename = {
                    namespaceMode = "all",
                },
                phpdoc = {
                    useFullyQualifiedNames = true,
                },
                hint = {
                    enable = true,
                },
            },
            typescript = {
                hint = {
                    enable = true,
                },
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                hint = {
                    enable = true,
                },
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            eslint = {
                format = {
                    enabled = false,
                },
            },
            json = {
                format = { enabled = false },
                schemas = {
                    {
                        description = "TypeScript config",
                        fileMatch = { "tsconfig.json", "tsconfig.*.json" },
                        url = "http://json.schemastore.org/tsconfig",
                    },
                    {
                        description = "ESLint config",
                        fileMatch = {
                            ".eslintrc.json",
                            ".eslintrc",
                            ".eslintrc.js",
                        },
                        url = "http://json.schemastore.org/eslintrc",
                    },
                    {
                        description = "Prettier settings",
                        fileMatch = {
                            ".prettierrc",
                            ".prettierrc.json",
                            "prettier.config.json",
                        },
                        url = "http://json.schemastore.org/prettierrc",
                    },
                    {
                        description = "Package config",
                        fileMatch = { "package.json" },
                        url = "https://json.schemastore.org/package",
                    },
                    {
                        description = "Packer config",
                        fileMatch = { "packer.json" },
                        url = "https://json.schemastore.org/packer",
                    },
                    {
                        description = "Renovate config",
                        fileMatch = {
                            "renovate.json",
                            "renovate.json5",
                            ".github/renovate.json",
                            ".github/renovate.json5",
                            ".renovaterc",
                            ".renovaterc.json",
                        },
                        url = "https://docs.renovatebot.com/renovate-schema",
                    },
                    {
                        description = "OpenApi config",
                        fileMatch = { "*api*.json" },
                        url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
                    },
                },
            },
            Lua = {
                cmd = { "lua-language-server" },
                filetypes = { "lua" },
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";"),
                },
                format = {
                    enable = true,
                },
                completion = {
                    enable = true,
                    callSnippet = "Both",
                },
                hint = {
                    enable = true,
                },
                diagnostics = {
                    enable = true,
                    globals = {
                        "vim",
                        "describe",
                    },
                    disable = {},
                },
                -- workspace = {
                --     library = {
                --         vim.api.nvim_get_runtime_file("", true),
                --         [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                --         [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                --         [vim.fn.expand("/usr/share/awesome/lib")] = true
                --     },
                --     -- adjust these two values if your performance is not optimal
                --     maxPreload = 2000,
                --     preloadFileSize = 1000
                -- },
                telemetry = {
                    enable = false,
                },
            },
        },
    })
end

if lsp_lines_installed then
    lsp_lines.setup()
    -- Disable virtual_text since it's redundant due to lsp_lines.
    vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { highlight_whole_line = false }
    })
end
