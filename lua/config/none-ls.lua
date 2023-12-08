local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local builtins = null_ls.builtins
local diagnostics = builtins.diagnostics
local formatting = builtins.formatting

local sources = {
    diagnostics.cfn_lint,
    diagnostics.jsonlint,
    diagnostics.yamllint,
    diagnostics.phpstan,
    -- diagnostics.shellcheck,
    formatting.prettierd,
    formatting.phpcsfixer.with({ prefer_local = "vendor/bin" }),
    formatting.shfmt,
}

null_ls.setup({
    debug = false,
    sources = sources,
})
