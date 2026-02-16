return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_markers = { "composer.json", "composer.lock", ".git" },
  settings = {
    intelephense = {
      environment = {
        phpVersion = "8.4",
      },
      files = {
        maxSize = 5000000,
      },
    },
  },
}
