local status_ok, _ = pcall(require, "leap")
if not status_ok then
    return
end

-- :h leap-config

local illuminate_installed, illuminate = pcall(require, "illuminate")

if illuminate_installed then
    vim.api.nvim_create_autocmd('User', {
        pattern = 'LeapEnter',
        callback = function ()
            illuminate.pause()
        end
    })

    vim.api.nvim_create_autocmd('User', {
        pattern = 'LeapLeave',
        callback = function ()
            illuminate.resume()
        end
    })
end
