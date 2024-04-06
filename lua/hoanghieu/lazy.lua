

require("lazy").setup({

  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  {"nvim-telescope/telescope.nvim",lazy = false,tag = "0.1.6", requires = { {'nvim-lua/plenary.nvim'} }},
  {"rose-pine/neovim",as = "rose-pine" ,config = function()
	  vim.cmd('colorscheme rose-pine')
  end},
  {'nvim-treesitter/nvim-treesitter'},
  {'ThePrimeagen/harpoon'},
  {'mbbill/undotree'},
  {'tpope/vim-fugitive'},
  {"mg979/vim-visual-multi"},
  {"numToStr/Comment.nvim"},
  {"neovim/nvim-lspconfig"},
  {"hrsh7th/cmp-nvim-lsp"},
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  
  {"williamboman/mason-lspconfig.nvim"},
  {"williamboman/mason.nvim"},
  {"max397574/better-escape.nvim"},
  {"nvimtools/none-ls.nvim"},
  {"nvim-lualine/lualine.nvim", requires = { 'nvim-tree/nvim-web-devicons', opt = true }},
  {"nvim-pack/nvim-spectre"},
  {"akinsho/toggleterm.nvim"},
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      if not opts.mapping then
        opts.mapping = {}
      end
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
})
