local status_ok, windows = pcall(require, "windows")
if not status_ok then
    return
end

local o = vim.o

o.winwidth = 10
o.winminwidth = 10
o.equalalways = false

windows.setup({
    animation = {
        duration = 200,
        fps = 30,
    },
})
