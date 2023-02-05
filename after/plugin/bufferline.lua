local bufferline = require("bufferline")

bufferline.setup({
	options = {
		offsets = {
			{ filetype = "NvimTree", text = "", padding = 1 },
			{ filetype = "neo-tree", text = "", padding = 1 },
			{ filetype = "Outline", text = "", padding = 1 },
		},
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		show_close_icon = true,
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 24,
		show_tab_indicators = false,
		-- indicator = {
		-- 	icon = false,
		-- 	style = "underline",
		-- },
		enforce_regular_tabs = true,
		view = "multiwindow",
		show_buffer_close_icons = true,
		separator_style = "slant",
		always_show_bufferline = true,
		diagnostics = "nvim_lsp",
		-- diagnostics = false,
		-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
		-- 	if context.buffer:current() then
		-- 		return ""
		-- 	end
		--
		-- 	return ""
		-- end,
	},
})
vim.cmd([[highlight Normal guibg=none]])
