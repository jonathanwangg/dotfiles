-- Source: https://www.swift.org/documentation/articles/zero-to-swift-nvim.html

-- This snippet clones lazy.nvim if it doesn’t already exist, and then adds it to the runtime path.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Leader Key (Must be before loading lazy.nvim)
vim.g.mapleader = " "  -- Set the leader key to spacebar

-- Map leader key to open Telescope's find_files
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- Map leader key to search using live_grep (search text across files)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Now we initialize lazy.nvim and tell it where to look for the plugin specs.
require("lazy").setup("plugins", {
  ui = {
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      keys = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      lazy = "",
    },
  },
})

vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,list:full" -- don't insert, show options

-- Line Numbers
vim.opt.nu = true
vim.opt.rnu = true

-- textwrap at 80 cols
-- vim.opt.tw = 80

