local status_ok, modes = pcall(require, "modes")
if not status_ok then
  return
end

modes.setup({
  colors = {
    copy = "#f5c359",
    delete = "#c75c6a",
    insert = "#78ccc5",
    visual = "#9745be",
  },

  -- cursorline highlight opacity
  line_opacity = 0.1,

  -- highlight cursor
  set_cursor = true,

  -- Highlight in active window only
  focus_only = false
})
