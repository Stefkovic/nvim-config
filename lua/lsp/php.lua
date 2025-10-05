return {
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	root_markers = { "composer.json", "composer.lock", ".git" },
	settings = {
		intelephense = {
			environment = {
				phpVersion = "8.2",
			},
			files = {
				maxSize = 5000000,
			},
		},
	},
}
