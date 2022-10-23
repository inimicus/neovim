local status_ok, typescript = pcall(require, "typescript")
if not status_ok then
    return
end

local navic_installed, navic = pcall(require, "nvim-navic")

typescript.setup({
    server = {
        on_attach = function(client, bufnr)
            if navic_installed then
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, bufnr)
                end
            end
        end,
    },
})
