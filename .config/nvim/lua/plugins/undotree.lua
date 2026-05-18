return {
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<C-r>', vim.cmd.UndotreeToggle)
    end,
  },
}
