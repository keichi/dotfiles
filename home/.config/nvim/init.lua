-- Set encoding to UTF-8
vim.cmd.language("en_US.UTF-8")
vim.opt.fileencoding = "utf-8"

-- Map leader key to <Space> (must be set before plugins load)
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Font
vim.opt.guifont = "UDEV Gothic NF:h15"

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- Show line numbers
vim.opt.number = true
vim.opt.list = true
-- Tab related
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.colorcolumn = "101"
-- Border for floating windows (LSP hover, diagnostics, etc.)
vim.opt.winborder = "bold"
vim.opt.textwidth = 100
-- Enable interop with system clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.whichwrap = "b,s,h,l,[,],<,>,~"
-- Stop search at the bottom of the file
vim.opt.wrapscan = false
-- Supposed to speedup rendering
vim.opt.lazyredraw = true
-- Case-sensitive search if pattern contains capital case letter
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Register spellfile
vim.opt.spelllang = "en,cjk"
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim", tag = "v0.2.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "ss", builtin.find_files, {})
      vim.keymap.set("n", "sg", builtin.live_grep, {})
      vim.keymap.set("n", "sb", builtin.buffers, {})
      vim.keymap.set("n", "sh", builtin.help_tags, {})
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        tabline = {
          lualine_a = { "buffers" },
        }
      }
    end
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme duskfox")
    end
  },
  { "windwp/nvim-autopairs", opts = {} },
  { "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        numhl = true,
      }
    end
  },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "famiu/bufdelete.nvim" },
  { "j-hui/fidget.nvim", event = "VeryLazy", opts = {} },
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy", opts = {} },
  {
    "asiryk/auto-hlsearch.nvim",
    tag = "1.1.0",
    -- Not opts = {}: passing a table reaches vim.tbl_islist, deprecated in Nvim 0.12
    config = function()
      require("auto-hlsearch").setup()
    end
  },
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("pylsp", {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = false },
              autopep8 = { enabled = false },
              pyflakes = { enabled = false },
              mccabe = { enabled = false },
            }
          }
        },
      })
    end
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      completion = { documentation = { auto_show = true } },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Requires tree-sitter CLI: brew install tree-sitter-cli
      require("nvim-treesitter").install({
        "bash", "c", "cmake", "cpp", "cuda", "fortran", "javascript", "json", "latex", "lua",
        "markdown", "markdown_inline", "python", "rust", "toml", "typescript", "yaml",
      })
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          -- Fails for filetypes without a parser; those keep regex syntax
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end
  },
})

-- Open nvim-tree on startup
local function open_nvim_tree(data)
  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command(
  "DiagnosticsToggleVirtualText",
  function()
    vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
  end,
  {}
)

-- Command to toggle diagnostics
vim.api.nvim_create_user_command(
  "DiagnosticsToggle",
  function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  end,
  {}
)

-- Save buffer
vim.keymap.set("n", "<Leader>s", "<Cmd>w<CR>")

-- Delete buffer while keeping window layout
vim.keymap.set("n", "<Leader>w", "<Cmd>Bdelete<CR>")

-- Cycle between buffers
vim.keymap.set("n", "sn", "<Cmd>bn<CR>")
vim.keymap.set("n", "sp", "<Cmd>bp<CR>")

-- (Un)Indent multiple times with > and <
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Scroll with <C-e> and <C-y> in insert mode
vim.keymap.set("i", "<C-e>", "<C-x><C-e>")
vim.keymap.set("i", "<C-y>", "<C-x><C-y>")

-- Clear search highlight
vim.keymap.set("n", "<ESC><ESC>", "<Cmd>nohlsearch<CR>")

-- LSP related

-- Built-in defaults (Neovim 0.11+): K hover, grn rename, gra code action,
-- grr references, gri implementation, gO document symbols
vim.keymap.set({"n", "v"}, "<Leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gh", vim.lsp.buf.references)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)

-- Format code
vim.keymap.set("n", "gf", vim.lsp.buf.format)
