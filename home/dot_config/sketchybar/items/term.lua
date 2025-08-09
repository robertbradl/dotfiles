local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

sbar.add("item", { position = "right", width = 5 })

local term = sbar.add("item", {
	icon = {
		string = icons.terminal,
		font = { size = 16.0 },
		padding_right = 8,
		padding_left = 5,
	},
	label = { drawing = false },
	background = {
		color = colors.bg2,
		border_color = colors.black,
		border_width = 1,
	},
	position = "right",
	padding_left = 1,
	padding_right = 1,
	click_script = "open -a 'WezTerm'",
})

sbar.add("bracket", { term.name }, {
	background = {
		color = colors.transparent,
		height = 30,
		border_color = colors.grey,
	},
})

sbar.add("item", { position = "right", width = settings.group_paddings })
