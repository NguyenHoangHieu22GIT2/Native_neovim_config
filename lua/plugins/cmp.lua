return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-emoji",
	},
	---@param opts cmp.ConfigSchema
	opts = function(_, opts)
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			snippet = {
				expand = function(args)
					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
			mapping = {
				-- ["<Enter>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
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
				["<C-space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-p>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item({ behavior = "insert" })
					else
						cmp.complete()
					end
				end),
				["<C-n>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item({ behavior = "insert" })
					else
						cmp.complete()
					end
				end),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
	end,
}
