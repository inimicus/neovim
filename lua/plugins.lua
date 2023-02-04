-- =============================================================================
-- plugins.lua
-- =============================================================================

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
-- Via https://github.com/Allaman/nvim
local function get_config(name)
    return string.format('require("config/%s")', name)
end

-- -----------------------------------------------------------------------------
-- Packer Bootstrap
-- -----------------------------------------------------------------------------
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path =
string.format("%s/site/pack/packer/start/packer.nvim", fn.stdpath("data"))

-- Via https://github.com/tjdevries/config_manager
local download_packer = function()
    if vim.fn.input("Download Packer? (y for yes) ") ~= "y" then
        return
    end

    print("Downloading packer.nvim...")

    local directory =
    string.format("%s/site/pack/packer/start/", vim.fn.stdpath("data"))

    fn.mkdir(directory, "p")

    local out = fn.system(
        string.format(
            "git clone %s %s",
            "https://github.com/wbthomason/packer.nvim",
            directory .. "/packer.nvim"
        )
    )

    print(out)

    execute("packadd packer.nvim")

    print("packer.nvim installed!")
end

if not pcall(require, "packer") then
    download_packer()
end

-- -----------------------------------------------------------------------------
-- Configure Packer
-- -----------------------------------------------------------------------------
local packer = require("packer")
local use = packer.use
local compile_path =
string.format("%s/plugin/packer_compiled.lua", install_path)

packer.init({
    -- Set `:PackerCompile profile=true` to enable profiling
    enable = true,
    -- Time in ms to include a plugin in the profile
    threshold = 0,
    compile_path = compile_path,
    max_jobs = 10,
})

packer.reset()

use("wbthomason/packer.nvim")

-- -----------------------------------------------------------------------------
-- UI Plugins
-- -----------------------------------------------------------------------------

-- Speed up the business
use({ "lewis6991/impatient.nvim" })

-- Colorscheme
use({ "rebelot/kanagawa.nvim", config = get_config("kanagawa") })

-- Control and navigate any list
use({
    "nvim-telescope/telescope.nvim",
    requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
    },
    config = get_config("telescope"),
})

-- Inline color highlighter
use({
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = get_config("colorizer"),
})

-- Smart comments
use({
    "numToStr/Comment.nvim",
    config = get_config("comment"),
})

-- Make cursor pop
use({ "edluffy/specs.nvim", config = get_config("specs") })

-- Automatically pair tags/brackets/etc
use({ "windwp/nvim-autopairs", config = get_config("autopairs") })
use({ "windwp/nvim-ts-autotag", config = get_config("autotag") })

-- Popup file browser powered by Telescope
use({ "nvim-telescope/telescope-file-browser.nvim" })

-- File browser
use({
    "kyazdani42/nvim-tree.lua",
    requires = {
        "kyazdani42/nvim-web-devicons",
    },
    config = get_config("nvim-tree"),
})
-- Alternatively:
-- use {
--     "nvim-neo-tree/neo-tree.nvim",
--     branch = "v2.x",
--     requires = {
--         "nvim-lua/plenary.nvim",
--         "kyazdani42/nvim-web-devicons",
--         "MunifTanjim/nui.nvim",
--         {
--             's1n7ax/nvim-window-picker',
--             tag = "1.*",
--             config = get_config("window-picker")
--         }
--     },
--     config = get_config("neo-tree")
-- }

-- Better search highlight/progress
use({
    "kevinhwang91/nvim-hlslens",
    config = get_config("hlslens"),
})

use({
    "petertriho/nvim-scrollbar",
    config = get_config("scrollbar"),
    wants = { { "kevinhwang91/nvim-hlslens" } },
})

-- Show buffers as tabs or make tab line fancy
-- use({ "akinsho/bufferline.nvim", config = get_config("bufferline") })

-- Improved tabline
use({
    "nanozuki/tabby.nvim",
    config = get_config("tabby"),
})

-- fzf implementation
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
use({ "nvim-telescope/telescope-fzf-writer.nvim" })

-- Telescope for Packer
use({ "nvim-telescope/telescope-packer.nvim" })

-- Telescope for Project
use({ "nvim-telescope/telescope-project.nvim" })

-- Jack-of-all-trades sidebar
use({ "sidebar-nvim/sidebar.nvim", config = get_config("sidebar") })

-- Fancy notifications
use({ "rcarriga/nvim-notify", config = get_config("notify") })

-- Status line
use({
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
})

-- Startup dashboard
use({
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = get_config("dashboard"),
    requires = { "nvim-tree/nvim-web-devicons" },
})

-- Dress up menus/selections/prompts
use({ "stevearc/dressing.nvim" })

-- Modal cursor
use({ "mvllow/modes.nvim", config = get_config("modes") })

use({
    "anuvyklack/windows.nvim",
    requires = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim",
    },
    config = get_config("windows"),
})

-- -----------------------------------------------------------------------------
-- Editing Plugins
-- -----------------------------------------------------------------------------

-- Language servers
use({
    "neovim/nvim-lspconfig",
    requires = {
        {
            "williamboman/mason-lspconfig.nvim",
            requires = {
                {
                    "williamboman/mason.nvim",
                    config = get_config("mason"),
                },
            },
            config = get_config("mason-lspconfig"),
        },
    },
    config = get_config("lsp"),
})

-- Typescript LSP setup
use({
    "jose-elias-alvarez/typescript.nvim",
    requires = { { "neovim/nvim-lspconfig" } },
    config = get_config("typescript"),
})

-- Debugger
use({
    "mfussenegger/nvim-dap",
    config = get_config("dap"),
})
use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
use({ "nvim-telescope/telescope-dap.nvim" })
use({ "theHamsta/nvim-dap-virtual-text" })

-- Winbar location
if vim.version().minor >= 8 then
    use({
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
        config = get_config("navic"),
    })
end

-- Editorconfig support
use({ "gpanders/editorconfig.nvim" })

-- Smart language tree parsing
use({
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate",
})

-- Syntax aware text-objects, select, move, swap, and peek support
use("nvim-treesitter/nvim-treesitter-textobjects")

-- Syntax aware comments
use("JoosepAlviste/nvim-ts-context-commentstring")

-- Autocompletion
use({
    "hrsh7th/nvim-cmp",
    requires = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "f3fora/cmp-spell", { "hrsh7th/cmp-calc" } },
    },
    config = get_config("cmp"),
})

-- Handsome folds
-- Waiting on https://github.com/neovim/neovim/pull/17446
-- use {
--     'kevinhwang91/nvim-ufo',
--     requires = 'kevinhwang91/promise-async',
--     config = get_config('ufo'),
-- }

-- Handsome diffs and utils
use({
    "sindrets/diffview.nvim",
    config = get_config("diffview"),
    requires = "nvim-lua/plenary.nvim",
})

-- Speedy splitting/joining lines
use({ "AndrewRadev/splitjoin.vim" })

-- Snippets
use({ "hrsh7th/vim-vsnip", config = get_config("vsnip") })

-- Snippets collection for a set of different programming languages for faster development
use({
    "rafamadriz/friendly-snippets",
    requires = {
        { "hrsh7th/vim-vsnip" },
    },
})

-- Git signs à la gitgutter
use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    config = get_config("gitsigns"),
})

use({
    "jose-elias-alvarez/null-ls.nvim",
    config = get_config("null-ls"),
    requires = { "nvim-lua/plenary.nvim" },
})

-- Don't rearrange splits when closing buffers
use({ "famiu/bufdelete.nvim" })

-- Adds icons to LSP autocomplete
use({
    "onsails/lspkind-nvim",
    requires = {
        { "famiu/bufdelete.nvim" },
    },
})

-- Show LSP-based signatures while typing
use({
    "ray-x/lsp_signature.nvim",
    requires = {
        { "neovim/nvim-lspconfig" },
    },
})

-- Highlight arguments via Treesitter
use({
    "m-demare/hlargs.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = get_config("hlargs"),
})

-- Color picker
-- use {
--     "ziontee113/color-picker.nvim",
--     config = get_config("color-picker")
-- }

-- Symbol sidebar à la tagbar
use({
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
    config = get_config("symbols"),
})

-- Indent guides
use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = get_config("indent-blankline"),
})

-- Better surround
use({
    "echasnovski/mini.nvim",
    config = get_config("mini"),
})

-- Show all troubles in one spot
use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = get_config("trouble"),
})

-- Fancify TODOs and NOTEs
use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "BufReadPost",
    config = get_config("todo"),
})

-- Better dot repeat
use({ "tpope/vim-repeat" })

-- -----------------------------------------------------------------------------
-- QOL Plugins
-- -----------------------------------------------------------------------------

-- Smooth scrolling
use({
    "karb94/neoscroll.nvim",
    config = get_config("neoscroll"),
})

-- Highlight other uses of the current word
use({
    "RRethy/vim-illuminate",
    config = get_config("illuminate"),
})

-- Improved highlight under cursor (star) functionality/etc
use({ "ironhouzi/starlite-nvim" })

-- Manage projects
use({ "ahmedkhalf/project.nvim", config = get_config("project") })

-- Shows mappings when you can't remember them
use({ "folke/which-key.nvim", event = "VimEnter", config = get_config("which") })

-- Persist and toggle multiple terminals
use({
    "akinsho/nvim-toggleterm.lua",
    config = get_config("toggleterm"),
})

-- Move through buffers fast
use({
    "ggandor/leap.nvim",
    config = get_config("leap"),
})
-- Alternatively:
-- use {
--     "ggandor/lightspeed.nvim",
--     event = "BufReadPre",
--     config = get_config("lightspeed")
-- }

-- YAML awesomeness
use({ "cuducos/yaml.nvim", ft = { "yaml" } })

-- Popup commandline
-- use {
--     "VonHeikemen/fine-cmdline.nvim",
--     requires = {"MunifTanjim/nui.nvim"},
--     config = get_config("fine-cmdline")
-- }

-- Replaces the UI for messages, cmdline and the popupmenu
use({
    "folke/noice.nvim",
    event = "VimEnter",
    config = get_config("noice"),
    requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        "nvim-telescope/telescope.nvim",
    },
})

use {
    'pwntester/octo.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
    },
    config = get_config('octo')
}
