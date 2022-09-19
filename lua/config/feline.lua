local status_ok, feline = pcall(require, "feline")
if not status_ok then
    return
end

-- TODO: Customize plugin
-- https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md
feline.setup()
