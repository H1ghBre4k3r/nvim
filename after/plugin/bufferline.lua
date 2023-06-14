local bufferline = require("bufferline")

bufferline.setup({
	options = {
		offsets = {
			{ filetype = "NvimTree", text = "File Explorer", padding = 1 },
			{ filetype = "neo-tree", text = "File Explorer", padding = 1 },
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
		enforce_regular_tabs = true,
		view = "multiwindow",
		show_buffer_close_icons = true,
		separator_style = "slant",
		always_show_bufferline = true,
		diagnostics = "nvim_lsp",
		truncate_names = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = ""
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "" or (e == "warning" and "" or "")
				s = s .. "  " .. n .. " " .. sym
			end
			return s
		end,
	},
})
vim.cmd([[highlight Normal guibg=none]])
