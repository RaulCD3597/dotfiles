local opt = vim.opt -- for conciseness

opt.number = true
opt.relativenumber = true

-- don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim
opt.clipboard = 'unnamedplus'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Configure how new splits shoud be opened
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
opt.scrolloff = 10

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for ident width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy ident from current line when starting new one
