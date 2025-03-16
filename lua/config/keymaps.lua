-- Remap navigation keys for Colemak-DH layout
-- Map n, e, i, m to behave like j, k, l, h in QWERTY
vim.keymap.set({'n', 'v'}, 'n', 'j', {
    desc = 'Down (Colemak-DH n → QWERTY j)'
})
vim.keymap.set({'n', 'v'}, 'e', 'k', {
    desc = 'Up (Colemak-DH e → QWERTY k)'
})
vim.keymap.set({'n', 'v'}, 'i', 'l', {
    desc = 'Right (Colemak-DH i → QWERTY l)'
})
vim.keymap.set({'n', 'v'}, 'm', 'h', {
    desc = 'Left (Colemak-DH m → QWERTY h)'
})

-- Remap displaced commands to new keys
vim.keymap.set({'n', 'v'}, 'j', 'e', {
    desc = 'End of word (was e)'
})
vim.keymap.set({'n', 'v'}, 'k', 'n', {
    desc = 'Next search match (was n)'
})
vim.keymap.set({'n'}, 'l', 'i', {
    desc = 'Insert mode (was i)'
})
vim.keymap.set({'n', 'v'}, 'h', 'm', {
    desc = 'Mark (was m)'
})

-- Additional useful remappings for Colemak-DH
vim.keymap.set({'n', 'v'}, 'K', 'N', {
    desc = 'Previous search match (was N)'
})
vim.keymap.set({'n'}, 'L', 'I', {
    desc = 'Insert at line start (was I)'
})
vim.keymap.set({'n'}, 'H', 'M', {
    desc = 'Middle of screen (was M)'
})
