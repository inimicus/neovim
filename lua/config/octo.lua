local status_ok, octo = pcall(require, 'octo')
if not status_ok then
    return
end

octo.setup({
    suppress_missing_scope = {
        projects_v2 = true,
    }
})
