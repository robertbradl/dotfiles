local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

local cal = sbar.add("item", {
	icon = {
		string = icons.calendar,
		color = colors.red,
		padding_left = 8,
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
	},
	label = {
		color = colors.white,
		padding_right = 8,
		align = "right",
		font = { family = settings.font.numbers },
	},
	position = "right",
	update_freq = 30,
	padding_left = 1,
	padding_right = 1,
	background = {
		color = colors.bg1,
		border_color = colors.bg2,
	},
	click_script = "open -a 'Calendar'",
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({ label = os.date("%a. %d %b.") })
end)
