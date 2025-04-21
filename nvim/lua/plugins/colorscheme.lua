-- lua/plugins/colorscheme.lua
return {
  -- Monokai Pro color scheme plugin
  {
    'loctvl842/monokai-pro.nvim',
    config = function()
      -- Set up the colorscheme
      vim.cmd('colorscheme monokai-pro')

      -- Optional: Customize Monokai Pro settings
      require('monokai-pro').setup({
        filter = 'spectrum', -- Choose filter: monokai, pro, spectrum, machine, etc.
        transparent_background = false, -- Make background transparent (false/true)
        terminal_colors = true, -- Set terminal colors
      })
    end
  }
}

