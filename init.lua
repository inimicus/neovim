-- =============================================================================
-- init.lua
-- =============================================================================

-- Now!
pcall(require, "impatient")

-- Global autocommands/groups
require("autocmd")

-- Plugins managed by Packer
require("plugins")

-- Global mappings
require("mappings")

-- Global non-plugin options
require("options")
