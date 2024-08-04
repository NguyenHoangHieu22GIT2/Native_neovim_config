function ColorScheme(color)
	-- color = color or 'rose-pine'
	vim.cmd.colorscheme(color)

  -- This is for transparent background
	vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
	vim.api.nvim_set_hl(0,"NormalFloat",{bg = "none"})
end

ColorScheme('gruvbox')
