--------------------------------------------------------------------------------
-- Personal settings

-- Additional Plugins
lvim.plugins = {
  { "catppuccin/nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  { "rafamadriz/neon" },
  {
    'xeluxee/competitest.nvim',
    requires = 'MunifTanjim/nui.nvim', --dependences?
    config = function() require 'competitest'.setup() end
  },
  { "norcalli/nvim-colorizer.lua" },
}

-- Self modification of relative numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- Peronalized dashboard configuration
lvim.builtin.alpha.dashboard.section.header.val = {
  [[]],
  [[]],
  [[]],
  [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
  [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
  [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
  [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
  [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
  [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
  [[]],
  [[]],
  [[]],
}

local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("clangd", opts)

-- Lualine configuration
lvim.builtin.lualine.options.theme = "horizon"
-- no need to set style = "lvim"
local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_y = {
  components.spaces,
  components.location
}

-- Mapping to move between buffers
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"

-- prettier
-- lvim.keys.normal_mode["<Space>Pf"] = ":!prettier --write %<CR>"
-- lvim.builtin.which_key.mappings["P"] = {
-- "<cmd>!prettier --write %<CR>",
-- "prettier"
-- }

-- All on one page
vim.opt.wrap = true

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Nvimtree right
lvim.builtin.nvimtree.setup.view.side = "right"

-- Change theme
lvim.colorscheme = "neon"

-- Config theme
vim.g.neon_style = "doom"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.g.neon_bold = true
vim.o.termguicolors = true
vim.cmd [[colorscheme neon]]

-- transparent window
lvim.transparent_window = true

-- Config null-ls
local nls = require("null-ls")
nls.setup({
  sources = {
    --here add new sources
    nls.builtins.formatting.autopep8,

    -- nls.builtins.formatting.phpcbf.with({ extra_args = { "--standard=PSR12" }}),
    -- nls.builtins.formatting.eslint,
    -- nls.builtins.formatting.prettier,
    -- nls.builtins.formatting.stylua,
    -- nls.builtins.diagnostics.eslint.with({ method = nls.methods.DIAGNOSTICS_ON_SAVE }),
    -- nls.builtins.diagnostics.ruff.with({ extra_args = { "--max-line-length=180" }, method = nls.methods.DIAGNOSTICS_ON_SAVE }),
    -- nls.builtins.diagnostics.phpcs.with({ extra_args = { "--standard=PSR12" }, method = nls.methods.DIAGNOSTICS_ON_SAVE }),
  },
})