-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

-- relatives numbers
vim.wo.relativenumber = true

-- All on one page
vim.opt.wrap = true

-- Copy and Paste
vim.opt.clipboard = "unnamedplus"
