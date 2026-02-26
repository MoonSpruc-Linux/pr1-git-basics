local opt = vim.opt

-- Basic Settings
opt.showmode = false
opt.updatetime = 350
vim.wo.signcolumn = "yes"
-- opt.colorcolumn = "80"
-- opt.showtabline = 0

-- Backup, undo, swap
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Cursor, colors
opt.cursorline = true -- Выделять активную строку где находится курсор
opt.termguicolors = true

-- Scroll
opt.so = 10 -- При скролле Ctrl + u ctrl + d оставлять n строк сверху или снизу

-- Search
opt.ignorecase = true -- Игнорировать регистр при поиске
opt.smartcase = true -- Не игнорирует регистр если в паттерне есть большие буквы
opt.hlsearch = true -- Подсвечивает найденный паттерн
opt.incsearch = true -- Интерактивный поиск

-- Wrapping
opt.wrap = false

-- Mouse
opt.mouse = "a" -- Возможность использовать мышку

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Splits
opt.splitbelow = true
opt.splitright = true
opt.hidden = true

-- Clipboard
opt.clipboard = "unnamedplus" -- Разрешить общий буфер обмена

-- Indent Settings
opt.shiftwidth = 2
opt.tabstop = 2
opt.smarttab = true
opt.smartindent = true

opt.autoindent = true
opt.breakindent = true
opt.expandtab = tru

-- Folding
opt.foldenable = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99

-- Show errors
local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = true, -- показывает ошибку/предупреждение рядом с кодом
	signs = true, -- иконки слева в gutter
	underline = true, -- подчёркивает проблемный участок
	update_in_insert = false, -- обновлять даже во время ввода
})

-- Remove background udner numbers left side
vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])

-- Make backspace better
opt.backspace = {"start", "eol", "indent"}

-- Ignore search by files in this directories
opt.wildignore:append({
	"*/node_modules/*",
	"*/.git/*",
	"*/dist/*"
})
