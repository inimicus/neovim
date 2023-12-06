local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local function statusLineFormat(str)
    local modes = {
        ["V-BLOCK"] = "V-B",
        ["V-LINE"] = "V-L",
    }

    if modes[str] ~= nil then
        return modes[str]
    else
        return str:sub(1, 1)
    end
end

local function branchLineFormat(str)
    local maxLength = 15

    if str == nil then
        return nil
    end

    if #str <= maxLength then
        return str
    end

    return str:sub(1, maxLength) .. "…"
end

local winbarSections = {
    lualine_a = {},
    lualine_b = {
        {
            "filetype",
            colored = false,  -- Displays filetype icon in color if set to true
            icon_only = true, -- Display only an icon for filetype
        },
    },
    lualine_c = {
        {
            "filename",
            file_status = true,
            path = 1,
            shorting_target = 40,
            symbols = {
                modified = "●",
                readonly = "",
            },
            fmt = function(str)
                local tree = "NvimTree"
                if string.sub(str, 1, string.len(tree)) == tree then
                    return tree
                else
                    return str
                end
            end,
        },
    },
    lualine_x = {
        {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = "󰌵 ",
            },
            colored = true,           -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false,   -- Show diagnostics even if there are none.
        },
    },
    lualine_y = {
        {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
        },
    },
    lualine_z = {},
}

local statusLineSections = {
    lualine_a = {
        { "mode", fmt = statusLineFormat },
        {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
        },
    },
    lualine_b = {
        { "b:gitsigns_head", icon = "", fmt = branchLineFormat },
        {
            "diff",
            separator = "",
        },
    },
    lualine_c = {
        {
            cond = function()
                local navic_installed, navic = pcall(require, "nvim-navic")
                return navic_installed and navic.is_available()
            end,
            "require('nvim-navic').get_location()",
        },
    },
    lualine_x = {
        {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
        },
        "filetype",
    },
    lualine_y = {
        {
            function()
                local msg = nil
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes
                        and vim.fn.index(filetypes, buf_ft) ~= -1
                        and client.name ~= "null-ls"
                    then
                        return client.name
                    end
                end
                return msg
            end,
            cond = function()
                local clients = vim.lsp.get_active_clients()
                return next(clients) ~= nil
            end,
            icon = " ",
            padding = { left = 0, right = 1 },
        },
    },
    lualine_z = {
        {
            "location",
            icon = "",
            -- Trim extra leading space
            fmt = function(str)
                return str:sub(2)
            end,
        },
    },
}

lualine.setup({
    options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = {
            left = "",
            right = "",
        },
        section_separators = {
            left = "",
            right = "",
        },
        disabled_filetypes = {
            "dashboard",
            "neo-tree",
            "TelescopePrompt",
        },
        globalstatus = true,
    },
    sections = statusLineSections,
    inactive_sections = {
        -- Empty: Global statusline
    },
    tabline = {},
    winbar = winbarSections,
    inactive_winbar = winbarSections,
    extensions = {
        "nvim-dap-ui",
        "nvim-tree",
        "quickfix",
        "symbols-outline",
        "toggleterm",
    },
})
