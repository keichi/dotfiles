-- Set encoding to UTF-8
vim.api.nvim_exec("language en_US.UTF-8", true)
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- Allow switching from an unsaved buffer
vim.opt.hidden = true
-- Show line numbers
vim.opt.number = true
vim.opt.list = true
-- Tab related
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ruler = true
vim.opt.colorcolumn = "101"
vim.opt.textwidth = 100
-- Enable interop with system clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.whichwrap = "b,s,h,l,[,],<,>,~"
-- Stop search at the bottom of the file
vim.opt.wrapscan = false
-- Supposed to speedup rendering
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
-- Case-sensitive search if pattern contains capital case letter
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Register spellfile
vim.opt.spelllang = "en,cjk"
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

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
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
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
      vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
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
      require("gitsigns").setup {
        numhl = true,
      }
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "cpp", "fortran", "latex", "python",
                             "markdown", "markdown_inline" },
        highlight = { enable = true }
      }
    end
  },
  { "wakatime/vim-wakatime" },
  { "famiu/bufdelete.nvim" },
  { "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = function()
      require("fidget").setup()
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup()
    end
  },
  {
    "asiryk/auto-hlsearch.nvim",
    tag = "1.1.0",
    config = function()
      require("auto-hlsearch").setup()
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.clangd.setup {
        capabitilies = capabilities,
        filetypes = {"c", "cpp", "objc", "objcpp", "cuda"}
      }
      lspconfig.fortls.setup {
        capabitilies = capabilities
      }
      lspconfig.pylsp.setup {
        capabitilies = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = false },
              autopep8 = { enabled = false },
              pyflakes = { enabled = false},
              mccabe = { enabled = false},
              pycodestyle = { enabled = false}
            }
          }
        }
      }
      lspconfig.ruff.setup {
        capabitilies = capabilitiese,
      }
    end
  },
  {
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga",
    config = function()
        require("lspsaga").setup({
          lightbulb = {
            enabled = false
          }
        })
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  },
  { "onsails/lspkind.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format({ maxwidth = 50 })
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        })
      })
    end
  },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
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
    local current_value = vim.diagnostic.config().virtual_text
    if current_value then
      vim.diagnostic.config({virtual_text = false})
    else
      vim.diagnostic.config({virtual_text = true})
    end
  end,
  {}
)

-- Command to toggle diagnostics
vim.api.nvim_create_user_command(
  "DiagnosticsToggle",
  function()
    local current_value = vim.diagnostic.is_disabled()
    if current_value then
      vim.diagnostic.enable()
    else
      vim.diagnostic.disable()
    end
  end,
  {}
)

-- Map leader key to <Space>
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Save buffer
vim.keymap.set("n", "<Leader>s", "<Cmd>w<CR>", { noremap = true })

-- Delete buffer while keeping window layout
vim.keymap.set("n", "<Leader>w", "<Cmd>Bdelete<CR>", { noremap = true })

-- Cycle between buffers
vim.keymap.set("n", "sn", "<Cmd>bn<CR>", { noremap = true })
vim.keymap.set("n", "sp", "<Cmd>bp<CR>", { noremap = true })

-- (Un)Indent multiple timeps with > and < 
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Scroll with <C-e> and <C-y> in insert mode
vim.keymap.set("i", "<C-e>", "<C-x><C-e>")
vim.keymap.set("i", "<C-y>", "<C-x><C-y>")

-- Clear search highlight
vim.keymap.set("n", "<ESC><ESC>", "<Cmd>nohlsearch<CR>", { noremap = true })

-- LSP related

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
vim.keymap.set("n", "gh", "<Cmd>Lspsaga lsp_finder<CR>")

-- Code action
vim.keymap.set({"n", "v"}, "<Leader>ca", "<Cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>")

-- Go to definition
vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>")

-- Go to type definition
vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>")

-- Format code
vim.keymap.set("n", "gf", vim.lsp.buf.format)

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>")

-- Floating terminal
vim.keymap.set({"n", "t"}, "<Leader>t", "<Cmd>Lspsaga term_toggle<CR>")
