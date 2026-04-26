return {
	"echasnovski/mini.ai",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter-textobjects" },
	opts = function()
		local ai = require("mini.ai")
		return {
			n_lines = 500,
			custom_textobjects = {
				o = ai.gen_spec.treesitter({
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}, {}),
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
			},
		}
	end,
	config = function(_, opts)
		require("mini.ai").setup(opts)

		local wk = require("which-key")
		local mode = { "o", "x" }

		local inside = {
			[" "] = "Whitespace",
			['"'] = 'Balanced "',
			["'"] = "Balanced '",
			["`"] = "Balanced `",
			["("] = "Balanced (",
			[")"] = "Balanced ) including white-space",
			[">"] = "Balanced > including white-space",
			["<lt>"] = "Balanced <",
			["]"] = "Balanced ] including white-space",
			["["] = "Balanced [",
			["}"] = "Balanced } including white-space",
			["{"] = "Balanced {",
			["?"] = "User Prompt",
			_ = "Underscore",
			a = "Argument",
			b = "Balanced ), ], }",
			c = "Class",
			f = "Function",
			o = "Block, conditional, loop",
			q = "Quote `, \", '",
			t = "Tag",
		}
		local around = {}
		for k, v in pairs(inside) do
			around[k] = v:gsub(" including.*", "")
		end

		local spec = {
			{ "in", group = "Inside Next textobject", mode = mode },
			{ "il", group = "Inside Last textobject", mode = mode },
			{ "an", group = "Around Next textobject", mode = mode },
			{ "al", group = "Around Last textobject", mode = mode },
		}
		for key, desc in pairs(inside) do
			table.insert(spec, { "i" .. key,  desc = desc, mode = mode })
			table.insert(spec, { "in" .. key, desc = desc, mode = mode })
			table.insert(spec, { "il" .. key, desc = desc, mode = mode })
		end
		for key, desc in pairs(around) do
			table.insert(spec, { "a" .. key,  desc = desc, mode = mode })
			table.insert(spec, { "an" .. key, desc = desc, mode = mode })
			table.insert(spec, { "al" .. key, desc = desc, mode = mode })
		end
		wk.add(spec)
	end,
}
