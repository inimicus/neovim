local status_ok, lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

lspconfig.setup({
    ensure_installed = {
        "sumneko_lua",
        "intelephense",
        "tsserver",
    },
    automatic_installation = true,
});
