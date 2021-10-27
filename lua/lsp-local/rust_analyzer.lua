-- local nvim_lsp = require'lspconfig'
local config = {
	settings = {
		-- to enable rust-analyzer settings visit:
		["rust-analyzer"] = {
			-- enable clippy on save
			checkOnSave = {
				command = "clippy",
			},
		},
	},
}

return {
	config = function(_)
		return config
	end,
}
