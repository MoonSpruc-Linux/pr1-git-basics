local opts = { noremap = true, silent = true }
local keymap = vim.keymap
vim.g.mapleader = " "

-----------------------------------------------------------
-- General
-----------------------------------------------------------
-- Save (normal + insert)
keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<cr>", opts)

-- Exit insert quickly
keymap.set("i", "jj", "<esc>", opts)

-- Clear search highlight
keymap.set("n", "<esc>", "<cmd>noh<cr>", opts)

-- Quit
keymap.set("n", "<A-q>", "<cmd>:q<cr>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Make line top
-- keymap.set('i', 'nn', '<Esc>O', opts)

-- Paste text in insert mode
keymap.set("i", "<S-Tab>", "<c-r>+", opts)
-----------------------------------------------------------
-- Tabs
-----------------------------------------------------------
keymap.set("n", "<F5>", "<cmd>tabnew<cr>", opts)
keymap.set("n", "<F6>", "<cmd>tabprevious<cr>", opts)
keymap.set("n", "<F7>", "<cmd>tabnext<cr>", opts)
keymap.set("n", "<A-1>", "<cmd>BufferLineCyclePrev<cr>", opts)
keymap.set("n", "<A-2>", "<cmd>BufferLineCycleNext<cr>", opts)
keymap.set("n", "<A-3>", "<cmd>BufferLineMovePrev<cr>", opts)
keymap.set("n", "<A-4>", "<cmd>BufferLineMoveNext<cr>", opts)
keymap.set("n", "<A-5>", "<cmd>:bdelete<cr>", opts)
-----------------------------------------------------------
-- Window navigation
-----------------------------------------------------------
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Vertical split
keymap.set("n", "<C-\\>", "<C-w>v", opts)

-- Close split
keymap.set("n", "<F8>", "<cmd>close<cr>", opts)

-----------------------------------------------------------
-- Neo-tree
-----------------------------------------------------------
keymap.set('n', '<C-e>', '<cmd>Neotree filesystem reveal<cr>', opts)
keymap.set('n', '<C-q>', '<cmd>Neotree close<cr>', opts)
keymap.set('n', '<C-t>', '<C-w>w', opts)
-----------------------------------------------------------
-- Resize windows
-----------------------------------------------------------
keymap.set("n", "<A-h>", "<cmd>vertical resize +2<cr>", opts)
keymap.set("n", "<A-l>", "<cmd>vertical resize -2<cr>", opts)
keymap.set("n", "<A-j>", "<cmd>resize -2<cr>", opts)
keymap.set("n", "<A-k>", "<cmd>resize +2<cr>", opts)
-----------------------------------------------------------
-- Visual mode indent keep selection
-----------------------------------------------------------
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- keymap.set("n", "<F1>", "<cmd>tabnew | terminal<cr>", opts)
-- keymap.set("n", "<F2>", "<cmd>vsplit | terminal<cr>", opts)
keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
-- keymap.set({"t", "n"}, "<F2>", "<cmd>:ToggleTerm 2<cr>", opts)
-----------------------------------------------------------
-- LSP (buffer-local)
-----------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, bufopts)
  end,
})
-----------------------------------------------------------
-- Copy HTML classes to CSS
-----------------------------------------------------------
vim.api.nvim_set_keymap( 'v', '<leader>cc', ':lua CopyHTMLClassesCSS()<CR>', opts)
-----------------------------------------------------------
-- Rename all similiar words
-----------------------------------------------------------
vim.keymap.set("n", "<leader>rg", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-----------------------------------------------------------
-- Make on enter normal tab
-----------------------------------------------------------
vim.keymap.set("i", "<CR>", function()
  return "\n  "
end, { expr = true })
