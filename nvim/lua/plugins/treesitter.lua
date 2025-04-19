-- https://github.com/nvim-treesitter/nvim-treesitter

return {
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",  -- Automatically update treesitter parsers after installation
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "cpp", "swift", "objc" },  -- Automatically install maintained parsers
				highlight = {
					enable = true,  -- Enable Treesitter syntax highlighting
				},
				indent = {
					enable = true,  -- Enable Treesitter-based indentation
				},
				autopairs = {
					enable = true,  -- Enable automatic bracket pairing
				},
				-- Optional features
				rainbow = {
					enable = true,  -- Enable rainbow parentheses
					extended_mode = true,  -- Enable extended rainbow for more features
				},
				-- Enable code folding (Treesitter-based)
				fold = {
					enable = true,
				},
			}
		end
	}
}

