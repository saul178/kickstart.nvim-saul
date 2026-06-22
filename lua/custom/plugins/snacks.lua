return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    image = {
      enable = true,
    },
    dashboard = {
      enable = true,
      sections = {
        { padding = 15 },
        {
          title = 'Bookmarks',
          section = 'keys',
          padding = 1,
        },
        {
          title = 'Projects',
          section = 'projects',
          padding = 1,
          picks = true,
          indent = 2,
        },
        {
          title = 'Recent Files',
          section = 'recent_files',
          padding = 2,
          indent = 2,
        },
        {
          section = 'terminal',
          pane = 2,
          -- cmd = 'ascii-image-converter -Cb ~/directories/Pictures/terminal-pics/G89pZAQb0AMTa3m-nobg.png; sleep .5',
          cmd = 'chafa ~/directories/Pictures/terminal-pics/G89pZAQb0AMTa3m-nobg.png --format symbols --symbols vhalf --colors full; sleep .1',
          height = 55,
          width = 100,
        },
      },
    },
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },
  keys = {
    {
      '<leader>cR',
      function() Snacks.rename.rename_file() end,
      desc = 'Rename File',
    },
    {
      '<leader>un',
      function() Snacks.notifier.hide() end,
      desc = 'Dismiss All Notifications',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
      end,
    })
  end,
}
