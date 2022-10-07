local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
    return
end

scrollbar.setup()

local hlslens_ok = pcall(require, "hlslens")
if hlslens_ok then
    require("scrollbar.handlers.search").setup()
end
