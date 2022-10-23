local status_ok, li = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

li.setup({
    -- automatically detect which servers to install
    -- (based on which servers are set up via lspconfig)
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
    },
})
