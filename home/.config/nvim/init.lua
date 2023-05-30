-- Set encoding to UTF-8
vim.api.nvim_exec("language en_US.UTF-8", true)
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "uft-8"

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.list = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ruler = true
vim.opt.colorcolumn = "81"
vim.opt.textwidth = 80
vim.opt.clipboard = "unnamedplus"
vim.opt.whichwrap = "b,s,h,l,[,],<,>,~"
-- Stop search at the bottom of the file
vim.opt.wrapscan = false
-- Supposed to speedup rendering
vim.opt.lazyredraw = true
vim.opt.ttyfast = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
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
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("", "<C-n>", ":NvimTreeToggle<CR>")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {
        tabline = {
          lualine_a = { "buffers" },
        }
      }
    end
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    },
  },
  {
    "williamboman/mason.nvim",
    build = "MasonUpdate",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        automatic_installation = true
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup {}
      lspconfig.fortls.setup {}
      lspconfig.pyright.setup {}
    end
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  { "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = { "c", "cpp", "fortran", "latex", "python" },
    config = function()
      vim.cmd("TSUpdate")
    end
  },
  { "wakatime/vim-wakatime" },
  { "famiu/bufdelete.nvim" },
  { "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  },
})

-- Open nvim-tree on startup
local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- create a new, empty buffer
  vim.cmd.enew()

  -- wipe the directory buffer
  vim.cmd.bw(data.buf)

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Map leader key to <Space>
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Save buffer
vim.keymap.set("n", "<Leader>s", ":w<CR>", { noremap = true })

-- Delete buffer while keeping window layout
vim.keymap.set("n", "<Leader>w", ":Bdelete<CR>", { noremap = true })

-- Cycle between buffers
vim.keymap.set("n", "sn", ":bn<CR>", { noremap = true })
vim.keymap.set("n", "sp", ":bp<CR>", { noremap = true })

-- (Un)Indent multiple timeps with > and < 
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Scroll with <C-e> and <C-y> in insert mode
vim.keymap.set("i", "<C-e>", "<C-x><C-e>")
vim.keymap.set("i", "<C-y>", "<C-x><C-y>")
