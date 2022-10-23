require("project_nvim").setup({
    patterns = {
        ".git",
        "package.json",
        "composer.json",
    },
    -- detection_methods = { "lsp", "pattern" },
    detection_methods = { "pattern" },
})
