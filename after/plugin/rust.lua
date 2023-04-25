require("rust-tools").setup({
	server = {
		settings = {
			["rust-analyzer"] = {
				completion = {
					callable = {
						snippets = "none",
					},
				},
				-- check = {
				-- 	command = "clippy",
				-- 	extraArgs = { "--all", "--", "-W", "clippy::all" },
				-- },
			},
		},
	},
})
