local status_ok, fine = pcall(require, "fine-cmdline")
if not status_ok then
    return
end

local map = vim.api.nvim_set_keymap

fine.setup({
    cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = " :"
    },
    popup = {
        position = {
            row = "10%",
            col = "50%"
        },
        size = {
            width = "60%"
        },
        border = {
            style = "rounded"
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder"
        }
    }
})

map("n", ":", "<cmd>FineCmdline<CR>", {noremap = true, silent = true})
