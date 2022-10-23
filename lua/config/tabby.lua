local status_ok = pcall(require, "tabby")
if not status_ok then
    return
end

local tabline = require("tabby.tabline")
local api = require("tabby.module.api")

local theme = {
    fill = "TabLineFill",
    head = "TabLine",
    current_tab = "TabLineSel",
    tab = "TabLine",
    win = "TabLine",
    tail = "TabLine",
}

local tab_name = function(tab)
    local cur_win = api.get_tab_current_win(tab.id)
    if api.is_float_win(cur_win) then
        return "[Floating]"
    end
    local current_bufnr = vim.fn.getwininfo(cur_win)[1].bufnr
    local current_bufinfo = vim.fn.getbufinfo(current_bufnr)[1]
    local current_buf_name = vim.fn.fnamemodify(current_bufinfo.name, ":t")
    if current_buf_name == "" then
        return "[Empty]"
    else
        return current_buf_name
    end
end

local change_mark = function(tab, icon_changed, icon_no_change)
    local already_marked = false
    local has_changes = false
    tab.wins().foreach(function(win)
        local bufnr = vim.fn.getwininfo(win.id)[1].bufnr
        local bufinfo = vim.fn.getbufinfo(bufnr)[1]
        if not already_marked and bufinfo.changed == 1 then
            already_marked = true
            has_changes = true
        end
    end)

    return has_changes and icon_changed or icon_no_change
end

local tab_icon = function(tab)
    local win_count = #api.get_tab_wins(tab.id)
    if win_count == 1 then
        if tab.is_current() then
            return change_mark(tab, " ", " ")
        else
            return change_mark(tab, " ", " ")
        end
    else
        if tab.is_current() then
            return change_mark(tab, "לּ ", "ךּ ")
        else
            return change_mark(tab, "﬽ ", "כּ ")
        end
    end
end

tabline.set(function(line)
    return {
        {
            -- TODO: Add something neat here
            { "", hl = theme.head },
            line.sep("", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
                line.sep("", theme.fill, hl),
                tab_icon(tab),
                tab_name(tab),
                line.sep("", hl, theme.fill),
                hl = hl,
                margin = " ",
            }
        end),
        hl = theme.fill,
    }
end, {
    buf_name = {
        mode = "unique",
    },
})
