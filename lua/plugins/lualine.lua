-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')
local badge = require('badge')

-- Reference
-- Explorer:                         
-- Misc: ﬘ ⌯ ☱ ♯ 
-- Analysis: ✖ ✘ ✗ ⬪ ▪ ▫
-- Quickfix:               
-- Location:            
-- Lock: ⚠  ⚿  � � � �
-- Version: 
-- Zoom: � �
-- Unknown: ⯑

-- Section conditions
local conditions = {
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand('%:p:h')
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end
}

-- Detect quickfix vs. location list
local function is_loclist()
	return vim.fn.getloclist(0, {filewinid = 1}).filewinid ~= 0
end

-- Extension: Quickfix
-- local extension_quickfix = {
-- 	sections = {
-- 		lualine_a = {
-- 			{
-- 				function()
-- 					local pad = vim.g.global_symbol_padding or ' '
-- 					local q = '' .. pad
-- 					local l = '' .. pad
-- 					return is_loclist() and l..'Location List' or q..'Quickfix List'
-- 				end,
-- 				padding = { left = 1, right = 0 },
-- 			},
-- 			{
-- 				function()
-- 					if is_loclist() then
-- 						return vim.fn.getloclist(0, {title = 0}).title
-- 					end
-- 					return vim.fn.getqflist({title = 0}).title
-- 				end
-- 			},
-- 		},
-- 		lualine_z = { function() return '%l/%L' end },
-- 	},
-- 	filetypes = {'qf'},
-- }

-- Extension: File-explorer
local extension_file_explorer = {
	sections = {
		lualine_a = {
			{
				function() return '▊' end,
				-- color = { fg = colors.active.boundary },
				padding = 0,
			},
			{ function() return '' end, padding = 1 },
			{ function() return '%<' end, padding = { left = 1, right = 0 }},
			{
				function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':~') end,
				padding = { left = 0, right = 1 },
			}
		},
		lualine_z = { function() return '%l/%L' end },
	},
	inactive_sections = {
		lualine_a = {
			{ function() return '' end, padding = 1 },
			{ function() return '%<' end, padding = { left = 1, right = 0 }},
			{
				function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':~') end,
				padding = { left = 0, right = 1 },
			}
		},
		lualine_z = { function() return '%l/%L' end },
	},
	filetypes = {'fern'},
}

-- Extension: Only name and line-count
-- local extension_line_count = {
-- 	sections = {
-- 		lualine_a = {
-- 			{
-- 				function() return '▊' end,
-- 				-- color = { fg = colors.active.boundary },
-- 				padding = { left = 0, right = 1 },
-- 			},
-- 			{ badge.utility_title(), padding = 0 },
-- 		},
-- 		lualine_z = { function() return '%l/%L' end },
-- 	},
-- 	-- Wait for https://github.com/hoob3rt/lualine.nvim/issues/301
-- 	inactive_sections = {
-- 		lualine_a = { badge.utility_title() },
-- 		lualine_z = { function() return '%l/%L' end },
-- 	},
-- 	filetypes = {'Trouble', 'DiffviewFiles', 'NeogitStatus', 'Outline'},
-- }

-- Global Config
local config = {
	options = {
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		theme = 'tokyonight',
		icons_enabled = true,
	},

	-- extensions = {
	-- 	extension_quickfix,
	-- 	extension_file_explorer,
	-- 	extension_line_count,
	-- },

	-- ACTIVE STATE --
	sections = {
		lualine_a = {
			-- Mode
			{
				'mode'
			},

			-- Readonly or zoomed
			-- {
				-- badge.filemode('%*#', '🔒', '🔎'),
				-- padding = 0,
				-- color = { fg = colors.filemode.readonly },
			-- },

			-- Buffer number
			-- { function() return '%n' end, padding = 0 },

			-- Modified
			-- {
				-- badge.modified('+'),
				-- padding = 0,
				-- color = { fg = colors.filemode.modified }
			-- },

			-- File icon
			-- { badge.icon() },

			-- File path
			-- {
				-- badge.filepath(3, 5),
				-- cond = conditions.buffer_not_empty,
				-- color = { fg = colors.active.filepath },
			-- },


			-- Start truncating here
			-- { function() return '%<' end, padding = { left = 1, right = 0 }},

			-- Whitespace trails
			{ badge.trails('␣'), padding = 0 },

			-- Git branch
			-- { 'branch', icon = '', cond = conditions.check_git_workspace },

			},
		},
		lualine_b = {
			-- Git status
			{
				'diff',
				symbols = { added = '₊', modified = '∗', removed = '₋' },
				-- diff_color = {
				-- 	added = { fg = colors.git.added },
				-- 	modified = { fg = colors.git.modified },
				-- 	removed = { fg = colors.git.deleted },
				-- },
				cond = conditions.hide_in_width,
				padding = 0,
	},
		lualine_c = {
			-- Diagnostics
			{
				'diagnostics',
				sources = { 'nvim_lsp' },
				symbols = { error = ' ', warn = ' ', info = ' ', hint = 'H' },
				-- diagnostics_color = {
				-- 	error = { fg = colors.diagnostics.error },
				-- 	warn = { fg = colors.diagnostics.warn },
				-- 	info = { fg = colors.diagnostics.info },
				-- 	hint = { fg = colors.diagnostics.hint },
				-- },
				padding = 0,
			},
		},
		lualine_x = { function() return '%=' end },
		lualine_y = {
			-- File format, encoding and type.
			{
				badge.filemedia('  '),
				cond = conditions.hide_in_width,
				padding = { left = 1, right = 1 },
			},
		},
		lualine_z = {
			-- Border
			{
				-- function () return '' end,
				function () return '' end,
				padding = 0,
				-- color = { fg = colors.active.progress, bg = colors.active.bg }
			},

			{ badge.progress() },

			-- Box boundary
			-- {
			-- 	function() return '▊' end,
			-- 	color = { fg = colors.active.boundary },
			-- 	padding = 0
			-- },
		}
	},

	-- INACTIVE STATE --
	inactive_sections = {
		lualine_a = {
			{ badge.icon() },
			{ badge.filepath(3, 5), padding = { left = 1, right = 0 }},
			{ badge.modified('+'), --color = { fg = colors.filemode.modified }
		},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{ function() return vim.bo.filetype end },
		}
	}
}

vim.g.qf_disable_statusline = true

-- Initialize lualine
lualine.setup(config)


-- vim: set ts=2 sw=2 tw=80 noet :
