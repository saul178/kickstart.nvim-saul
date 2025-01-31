return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    dashboard = {
      sections = {
        {
          section = 'terminal',
          cmd = 'chafa ~/directories/Pictures/chun-terminal-pics/chun-ki.jpg; sleep .1',
          height = 17,
          padding = 1,
        },
        {
          pane = 2,
          { section = 'keys', gap = 1, padding = 1 },
          { section = 'startup' },
        },
      },
    },
  },
}
