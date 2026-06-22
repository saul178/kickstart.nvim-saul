return {
  'flashcodes-themayankjha/Fkthemes.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
    -- Add your themes here
    -- Tokyonight
    {
      'folke/tokyonight.nvim',
      config = function()
        require('tokyonight').setup {
          transparent = true,
          styles = {
            sidebars = 'transparent',
            floats = 'transparent',
          },
        }
      end,
    },
    --
    -- Rose Pine
    { 'rose-pine/neovim', name = 'rose-pine' },
    --
    -- Catppuccin
    {
      'catppuccin/nvim',
      name = 'catppuccin',
      priority = 1000,
      config = function()
        require('catppuccin').setup {
          flavour = 'mocha',
          transparent_background = true,
        }
      end,
    },
    --
    -- everforest
    {
      'neanias/everforest-nvim',
      config = function()
        require('everforest').setup {
          transparent_background_level = 1,
        }
      end,
    },
    --
    -- Others
    'rebelot/kanagawa.nvim',
    'shaunsingh/nord.nvim',
  },
  config = function()
    require('fkthemes').setup {
      themes = {
        'tokyonight',
        'everforest',
        'catppuccin',
        'kanagawa',
        'rose-pine',
        'nord',
      },
      default_theme = 'tokyonight',
      transparent_background = true,
    }
  end,
}
