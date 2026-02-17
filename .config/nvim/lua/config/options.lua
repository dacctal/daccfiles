vim.cmd("let g:netrw_banner = 0")
vim.cmd("set termguicolors")

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.hlsearch = true

vim.opt.mouse = "a"
vim.g.editorconfig = true

vim.g.markdown_folding = 1
