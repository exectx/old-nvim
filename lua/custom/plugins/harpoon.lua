return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():append()
    end)
    vim.keymap.set('n', '<D-m>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open harpoon window' })

    vim.keymap.set('n', '<D-S-j>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<D-S-k>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<D-S-l>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<D-S-;>', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>,', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<leader>.', function()
      harpoon:list():next()
    end)
  end,
}
