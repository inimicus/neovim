-- =============================================================================
-- autocmd.lua
-- =============================================================================

local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd
local wo = vim.wo
local bo = vim.bo

local function inArray(needle, haystack)
    for _, value in ipairs(haystack) do
        if value == needle then
            return true
        end
    end
end

-- -----------------------------------------------------------------------------
-- Show cursorline for active buffer only
-- -----------------------------------------------------------------------------

local showCursorLineGroup = create_augroup("HideCursorLineForInactive", {
    clear = true,
})

-- Disable cursorline when leaving
create_autocmd("WinLeave", {
    command = "setlocal nocursorline",
    group = showCursorLineGroup,
})

-- Enable cursorline when entering specific file/buffer types
local function showCursorLine()
    local excludeBuftypes = {
        "nofile",
        "prompt",
    }
    local excludeFiletypes = {
        "dashboard",
    }

    if
        inArray(bo.filetype, excludeFiletypes)
        or inArray(bo.buftype, excludeBuftypes)
    then
        return
    end

    wo.cursorline = true
end

create_autocmd({
    "VimEnter",
    "WinEnter",
    "BufWinEnter",
}, {
    callback = showCursorLine,
    group = showCursorLineGroup,
})
