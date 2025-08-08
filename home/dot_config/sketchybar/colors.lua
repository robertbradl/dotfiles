return {
	black = 0xff181819,
	white = 0xffe2e2e3,
	red = 0xffcc241d,
	green = 0xff98971a,
	blue = 0xff458558,
	yellow = 0xffd79921,
	orange = 0xffd65d0e,
	magenta = 0xffb16286,
	grey = 0xff928375,
	transparent = 0x00000000,

	bar = {
		bg = 0x00000000,
		border = 0xff2c2e34,
	},
	popup = {
		bg = 0xc02c2e34,
		border = 0xff7f8490,
	},
	bg1 = 0xff282828,
	bg2 = 0xff3c3836,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
