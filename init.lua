-- ============================================================
--  Final init.lua for vscode-neovim
-- ============================================================

-- ---------- 1. Plugin manager (lazy.nvim) ----------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ---------- 2. Plugins ----------
require("lazy").setup({
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
})

-- ---------- 3. Basic settings ----------
vim.opt.number = true
vim.opt.relativenumber = false        -- change to true if you like relative numbers
vim.opt.clipboard = "unnamedplus"     -- system clipboard
vim.opt.hlsearch = true               -- highlight searches
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.backspace = "indent,eol,start"
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.g.mapleader = " "                 -- make Space the leader key (optional)

-- ---------- 4. Custom mappings ----------

-- vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
-- H / L → beginning / end of line
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")

-- J / K → 5 lines down / up (optional, keep if you want)
vim.keymap.set({ "n", "v" }, "J", "5j")
vim.keymap.set({ "n", "v" }, "K", "5k")

-- Clear search highlights: <leader>cl  (Space then c then l if leader is space)
vim.keymap.set("n", "<leader>cl", ":nohlsearch<CR>")

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>c", '"_c')
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>c", '"_c')

print("NVIMI'S INIT.LUA LOADED")
