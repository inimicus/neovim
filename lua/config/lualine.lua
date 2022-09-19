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
        return str:sub(1,1)
    end
end

local function branchLineFormat(str)
    local maxLength = 15

    if (str == nil) then
        return nil
    end

    if (#str <= maxLength) then
        return str
    end

    return str:sub(1, maxLength) .. "…"
end

lualine.setup({
    options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = {
            left = "",
            right = ""
        },
        section_separators = {
            left = "",
            right = ""
        },
        disabled_filetypes = {"dashboard", "neo-tree", "NvimTree", "TelescopePrompt"},
        globalstatus = true
    },
    sections = {
        lualine_a = {
            {'mode', fmt = statusLineFormat},
        },
        lualine_b = {
            {"b:gitsigns_head", icon = "", fmt = branchLineFormat},
            "diff"
        },
        lualine_c = {
            {
                "filename",
                file_status = true,
                path = 1, -- show relative path
                shorting_target = 40,
                symbols = {
                    modified = " ●",
                    readonly = " "
                }
            }
        },
        lualine_x = {
            {"diagnostics", sources = {"nvim_diagnostic"}},
            "filetype"
        },
        lualine_y = {},
        lualine_z = {
            {
                "location",
                icon = "",
                -- Trim extra leading space
                fmt = function(str) return str:sub(2) end
            }
        }
    },
    inactive_sections = {
        -- Empty: Global statusline
    },
    tabline = {},
    extensions = {
        "nvim-dap-ui",
        "nvim-tree",
        "quickfix",
        "symbols-outline",
        "toggleterm",
    }
})
