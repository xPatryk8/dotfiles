return{
    { 
      'nvim-mini/mini.nvim', version = false,

      config = function()
        require('mini.ai').setup()
        require('mini.statusline').setup({ use_icons = true })
        require('mini.pairs').setup()
      end,
    },
}
