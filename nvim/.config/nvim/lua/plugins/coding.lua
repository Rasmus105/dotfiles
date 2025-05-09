return {
	{ -- Show the changes while renaming
		"smjonas/inc-rename.nvim",
		enabled = true,

		cmd = "IncRename",
		config = true,
	},

	{ -- Better increase/descrease (+/-)
		"monaqa/dial.nvim",
        -- stylua: ignore
        enabled = true,
		keys = {
			--{ "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
			--{ "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
			{
				"+",
				function()
					return require("dial.map").inc_normal()
				end,
				expr = true,
				desc = "Increment",
			},
			{
				"-",
				function()
					return require("dial.map").dec_normal()
				end,
				expr = true,
				desc = "Decrement",
			},
		},
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{ -- Underline under current and any matching words
		"echasnovski/mini.cursorword",
		config = function()
			local cursorword = require("mini.cursorword")
			cursorword.setup({
				delay = 0,
			})
		end,
	},

	{ -- Functionality to work with two "paired" characters (Automatically adds ')' when typing '(', does the same for '[', '{', '"', ''', '`'))
		"echasnovski/mini.pairs",
		enabled = false,

		version = "*",

		opts = {},
	},

	{
		"echasnovski/mini.surround",
		enabled = true,

		version = "*",

		opts = {
			mappings = {
				add = "zh", -- Add surrounding in Normal and Visual modes
				delete = "ds", -- Delete surrounding
				replace = "cs", -- Replace surrounding

				-- Disable the rest
				update_n_lines = "", -- Update `n_lines`
				suffix_last = "", -- Suffix to search with "prev" method
				suffix_next = "", -- Suffix to search with "next" method
				find = "", -- Find surrounding (to the right)
				find_left = "", -- Find surrounding (to the left)
				highlight = "", -- Highlight surrounding
			},
		},
	},
}
