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

-- line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- textwrap at 80 cols
-- vim.opt.tw = 80

-- set solarized colorscheme.
-- NOTE: Uncomment this if you have installed solarized, otherwise you'll see
--       errors.
-- vim.cmd.background = "dark"
-- vim.cmd.colorscheme("solarized")
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

