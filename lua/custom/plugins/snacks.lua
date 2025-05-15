return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      enable = true,
      sections = {
        {
          section = 'terminal',
          cmd = 'ascii-image-converter -Cb -d 100,15 ~/directories/Pictures/chun-terminal-pics/chun-kiss-hearts-transparant.png',
          height = 15,
          width = 100,
          padding = 2,
          indent = -20,
        },
        { title = 'Bookmarks', section = 'keys', padding = 1 },
        {
          title = 'Projects',
          section = 'projects',
          indent = 2,
          padding = 1,
          picks = true,
        },
        { title = 'Recent Files', section = 'recent_files', indent = 2, padding = 2 },
        {
          section = 'terminal',
          cmd = 'ascii-image-converter -Cb -d 128,58 ~/directories/Pictures/chun-terminal-pics/chun-horny3-transparant.png; sleep .5',
          height = 58,
          width = 128,
          pane = 2,
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
      function()
        Snacks.rename.rename_file()
      end,
      desc = 'Rename File',
    },
    {
      '<leader>un',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
      end,
    })
  end,
}
