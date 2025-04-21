-- Map "jj" to ESC.
return {
  {
    "LazyVim/LazyVim",  -- or any plugin you'd like to configure
    opts = {
      -- plugin options (if any)
    },
    config = function()
      -- your keymap settings here
      vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode with jj" })
    end,
  },
}

